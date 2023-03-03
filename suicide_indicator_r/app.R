#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Suicide Indicators App

# Load necessary libraries for the app
library(shiny)
library(ggplot2)
library(tidyverse)
library(leaflet)
library(RColorBrewer)
library(rgdal)

# Read the dataset from the specified location
dataset <-
  read.csv("../data/master.csv")

# read in the world country spatial data frame
world_spdf <- readOGR( 
  dsn= path.expand(paste0("../data/maps/")) , 
  layer="TM_WORLD_BORDERS-0-3",
  verbose=FALSE
)

# Define the user interface (UI) for the shiny app
# Create the first tab of the app for country-wide comparison

ui <- navbarPage(
  "Suicide Identification Dashboard",
  tabPanel(
    "Country Wide Comparison",
    titlePanel("Country Wide Comparison"),
    sidebarLayout(
      sidebarPanel(
        selectInput(
          "country1",
          "Country 1:",
          choices = sort(unique(dataset$country)),
          selected = "Canada"
        ),
        selectInput(
          "country2",
          "Country 2:",
          choices = sort(unique(dataset$country)),
          selected = "United States"
        ),
        sliderInput(
          "year_range",
          "Select Year Range:",
          min = 1987,
          max = 2017,
          sep = "",
          value = c(1999, 2005)
        )
      ),
      mainPanel(
        splitLayout(plotOutput("stacked_bars"),
                    plotOutput("grouped_bars")),
        verticalLayout(plotOutput("line_plot"))
      )
    )
  ),
# Create the second tab of the app for displaying the suicide rate by country on a map
  tabPanel(
    "Suicide Rate by Country",
    titlePanel("Suicide Rate by Country"),
    sidebarLayout(sidebarPanel(
      h4("Select the year you want to observe geographical suicide trends for."),
      br(),
      p("Hover over the country to precise Suicide per 100k values & Gross Domestic",
      "Product (GDP) per Capita of that country in USD."),
      sliderInput(
        "suicide_map_year",
        "Select Year:",
        min = 1987,
        max = 2017,
        value = 2007,
        sep = "",
        animate = FALSE
          # animationOptions(interval = 300, loop = TRUE) # runs to slow with updating
      )
    ),
    mainPanel(
      leafletOutput("suicide_map",height = "75vh")
      )
      )
    ),

)

# Define the server function
server <- function(input, output, session) {
  # Create reactive data for selected range of years, countries of interest
  subset_data <- reactive({
    subset(
      dataset,
      year >= input$year_range[1] &
        year <= input$year_range[2] &
        country == input$country1 & country == input$country2
    )
  })
  
  
# Create reactive data for selected range of years and countries
# Calculate the proportion of suicides to the total population
  output$stacked_bars <- renderPlot({
    calc_data <- dataset |>
      group_by(year, country, sex) %>%
      summarise(
        suicides = sum(suicides_no),
        population = sum(population),
        suicides_100k_pop_recal = sum(suicides_no) / sum(population) * 100
      ) %>%
      ungroup()
    
    data <-
      calc_data |> filter(country == input$country1 |
                            country == input$country2) |>
      filter(year >= input$year_range[1] &
               year <= input$year_range[2])

# Create a stacked bar plot for the suicide rate by gender for both countries    
    ggplot(data,
           aes(
             x = as.Date(paste0(year, "-01-01")),
             y = suicides_100k_pop_recal,
             fill = sex
           )) +
      geom_bar(stat = "identity", position = "stack") +
      labs(
        title = sprintf(
          "Comparison of Suicide Rate in %s and %s between %s and %s by Gender",
          input$country1,
          input$country2,
          input$year_range[1],
          input$year_range[2]
        ),
        x = "Year",
        y = "Suicides per 100k Population"
      ) +
      theme_classic() +
      scale_fill_manual(values = c("#D55E00", "#0072B2"), name = "Gender:") +
      facet_grid(cols = vars(country)) +
      theme(
        strip.background = element_blank(),
        strip.text = element_text(size = 12, face = "bold"),
        legend.position = "bottom",
        legend.title = element_text(size = 12, face = "bold")
      ) +
      scale_x_date(date_labels = "%Y", date_breaks = "1 year") +
      scale_y_continuous(labels = scales::percent_format())
  })

# Sample plots will go in here
  output$grouped_bars <- renderPlot({
    ggplot(dataset, aes(x = year, y = 'suicides_100k_pop', fill = sex)) +
      geom_bar(stat = "identity") +
      labs(title = "Plot", x = "Plot", y = "Plot") +
      theme_classic()
  })
  
  output$line_plot <- renderPlot({
    ggplot(dataset, aes(x = year, y = 'suicides_100k_pop', fill = sex)) +
      geom_bar(stat = "identity") +
      labs(title = "Plot", x = "Plot", y = "Plot") +
      theme_classic()
  })

# Heatmaps will go in here  
  output$suicide_map <- renderLeaflet({

    # get the input year for reference throughout
    selected_year <- input$suicide_map_year
    
    # filter the primary dataset to that year and summarize
    year_data <- dataset |>
      filter(
        year == selected_year | is.na(year)
      ) |>
      group_by(country) |>
      summarise(
        year = selected_year, 
        suicides_100k_pop = mean(suicides_100k_pop),
        gdp_per_capita = mean(gdp_per_capita....),
        population = sum(population)
      ) 
    
    # use a copy of polygon object to not over write
    year_spdf <- world_spdf
    
    # combine subset suicide data with polygon data
    year_spdf@data <- merge(x = world_spdf@data, y = year_data,
                            by.x = "NAME", by.y = "country", all.x = TRUE
    ) |>
      select(FIPS, ISO2, ISO3, UN, everything())
    
    # order of the data must match the original polygon order otherwise the
    # polygons don't line up on the map/labels
    reordered_idx <- match(world_spdf@data$NAME, year_spdf@data$NAME)
    year_spdf@data <- year_spdf@data[reordered_idx, ]
    
    # Create a color palette with handmade bins.
    mybins <- c(0,10,20,30,40,50,Inf)
    mypalette <- colorBin( palette="YlOrBr", domain=year_spdf@data$suicides_100k_pop, na.color="transparent", bins=mybins)
    
    # Prepare the text for tooltips:
    mytext <- paste(
      "Country: ", year_spdf@data$NAME,"<br/>", 
      "Year: ", year_spdf@data$year, "<br/>",
      "Suicides per 100k: ", round(year_spdf@data$suicides_100k_pop, 2), 
      sep="") %>%
      lapply(htmltools::HTML)
    
    # Final Map
    m <- leaflet(year_spdf) %>% 
      addTiles()  %>% 
      setView( lat=10, lng=0 , zoom=2) %>%
      addPolygons( 
        fillColor = ~mypalette(suicides_100k_pop), 
        stroke=TRUE, 
        fillOpacity = 0.9, 
        color="white", 
        weight=0.3,
        label = mytext,
        labelOptions = labelOptions( 
          style = list("font-weight" = "normal", padding = "3px 8px"), 
          textsize = "13px", 
          direction = "auto"
        )
      ) %>%
      addLegend( pal=mypalette, values=~population, opacity=0.9, title = "Suicides Per 100k", position = "bottomleft" )
  })
  
  output$gdp_map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addMarkers(lng = -123.116226,
                 lat = 49.246292,
                 popup = "Vancouver")
  })
  
}

# Run the application
shinyApp(ui = ui, server = server)