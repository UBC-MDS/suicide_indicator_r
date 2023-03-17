library(shinytest2)

test_that("{shinytest2} recording: suicide_indicator_r_sz", {
  app <- AppDriver$new(variant = platform_variant(), name = "suicide_indicator_r_sz", 
      height = 840, width = 1542)
  app$set_inputs(navs = "Country Wide Comparison")
  app$expect_screenshot()
  app$expect_values()
  app$set_inputs(country1 = "Bosnia and Herzegovina")
  app$set_inputs(country2 = "United Arab Emirates")
  app$set_inputs(country2 = "United States")
  app$set_inputs(year_range = c(1999, 2012))
  app$set_inputs(year_range = c(2002, 2015))
  app$set_inputs(year_range = c(1987, 2015))
  app$set_inputs(country1 = "Austria")
  app$set_inputs(sex = "female")
})
