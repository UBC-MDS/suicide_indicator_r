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

# Read the dataset from the specified location
dataset <-
  read.csv("../data/master.csv")

# Define the user interface (UI) for the shiny app
# Create the first tab of the app for country-wide comparison

ui <- navbarPage(
  "Suicide Identification Dashboard",
  theme = bs_theme(bootswatch = "minty"),
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
      sliderInput(
        "year_range",
        "Select Year Range:",
        min = 1987,
        max = 2017,
        value = c(1987, 2017),
        sep = ""
      )
    ),
    mainPanel(leafletOutput("suicide_map")))
  ),
  
  # Create the third tab of the app for displaying the GDP by country on a map
  tabPanel(
    "GDP by Country",
    titlePanel("GDP by Country"),
    sidebarLayout(sidebarPanel(
      sliderInput(
        "year_range",
        "Select Year Range:",
        min = 1987,
        max = 2017,
        value = c(1987, 2017),
        sep = ""
      )
    ),
    mainPanel(leafletOutput("gdp_map")))
  )
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
      group_by(year, country, sex) |>
      summarise(
        suicides = sum(suicides_no),
        population = sum(population),
        suicides_100k_pop_recal = sum(suicides_no) / sum(population) * 100
      ) |>
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
             fill = sex,
           )) +
      geom_bar(stat = "identity", position = "stack") +
      labs(
        title = sprintf(
          "                  Suicide Rate in %s and %s between 
                                        %s and %s by Gender",
          input$country1,
          input$country2,
          input$year_range[1],
          input$year_range[2]
        ),
        x = "Year",
        y = "Suicides per 100k Population (%)"
      ) +
      theme_classic() +
      scale_fill_manual(values = c("#D55E00", "#0072B2"), name = "Gender:") +
      facet_grid(cols = vars(country)) +
      theme(
        strip.background = element_blank(),
        strip.text = element_text(size = 12, face = "bold"),
        legend.position = "bottom",
        legend.title = element_text(size = 12, face = "bold"),
        axis.text.x = element_text(angle = 45, hjust = 1)
      ) +
      scale_x_date(date_labels = "%Y", date_breaks = "2 year") +
      scale_y_continuous(labels = scales::percent_format())
  })

# Sample plots will go in here
  output$grouped_bars <- renderPlot({
    # data wrangling 
    bar_data <- dataset |> filter(country == input$country1 | country == input$country2) |> 
      filter(year >= input$year_range[1] &
               year <= input$year_range[2]) |> 
      group_by(country,age) |> summarise(suicides = sum(suicides_no, na.rm = TRUE),
                                         population = sum(population,na.rm = TRUE),
                                         suicides_100k_pop_recal = sum(suicides_no, na.rm = TRUE) / sum(population, na.rm=TRUE) * 100, 
                                         .groups = 'drop') |> 
      mutate(rank = case_when( # Used for axis order. 
        age == "5-14 years" ~ 1,
        age == "15-24 years" ~ 2,
        age == "25-34 years" ~ 3,
        age == "35-54 years" ~ 4,
        age == "55-74 years" ~ 5,
        age == "75+ years" ~ 6
      )) |> pivot_longer(cols = 'country')
    
    
    # Grouped bar chart
    ggplot(bar_data, aes(x=reorder(age,rank), y=suicides, fill=value)) + 
      geom_bar(stat='identity', position='dodge') +
      labs(
        title = sprintf(
          "Suicide Counts in %s and %s between 
          %s and %s by Age Group",
          input$country1,
          input$country2,
          input$year_range[1],
          input$year_range[2]
        ),
        x = "Age group",
        y = "Suicides counts"
      ) +
      theme_classic() +
      scale_fill_manual(values = c("#D55E00", "#0072B2"), name = "Country:") +
      theme(
        strip.background = element_blank(),
        strip.text = element_text(size = 12, face = "bold"),
        legend.position = "bottom",
        legend.title = element_text(size = 12, face = "bold"),
        axis.text = element_text(angle=15),
        plot.title= element_text(hjust = 0.5)
      ) 
  })
  
  output$line_plot <- renderPlot({
    ggplot(dataset, aes(x = year, y = 'suicides_100k_pop', fill = sex)) +
      geom_bar(stat = "identity") +
      labs(title = "Plot", x = "Plot", y = "Plot") +
      theme_classic()
  })

# Heatmaps will go in here  
  output$suicide_map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addMarkers(lng = -123.116226,
                 lat = 49.246292,
                 popup = "Vancouver")
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