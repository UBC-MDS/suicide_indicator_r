library(shinytest2)

test_that("{shinytest2} recording: suicide_indicator_r_sz", {
  app <- AppDriver$new(variant = platform_variant(), name = "suicide_indicator_r_sz", 
      height = 840, width = 1116)
  app$set_inputs(navs = "Country Wide Comparison")
  app$expect_values()
  app$expect_screenshot()
  app$set_inputs(country1 = "Cuba")
  app$set_inputs(country2 = "Uruguay")
  app$set_inputs(year_range = c(1999, 2012))
  app$set_inputs(year_range = c(1992, 2012))
  app$set_inputs(sex = "female")
  app$set_inputs(sex = "male")
})
