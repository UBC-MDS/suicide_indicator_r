library(shinytest2)

test_that("{shinytest2} recording: suicide_indicator_r_sz", {
  app <- AppDriver$new(variant = platform_variant(), name = "suicide_indicator_r_sz", 
      height = 840, width = 1542)
  app$set_inputs(navs = "Country Wide Comparison")
  app$expect_values()
  app$expect_screenshot()
  app$set_inputs(country1 = "Brazil")
  app$set_inputs(country2 = "United Arab Emirates")
  app$set_inputs(year_range = c(1999, 2014))
  app$set_inputs(year_range = c(1992, 2014))
  app$set_inputs(sex = "female")
  app$set_inputs(sex = "male")
  app$set_inputs(tabs = "Suicide and GDP trends")
  app$set_inputs(navs = "Suicide Rate by Country")
  app$set_inputs(navs = "Country Wide Comparison")
})
