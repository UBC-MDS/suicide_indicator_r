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


test_that("{shinytest2} recording: map_test", {
  app <- AppDriver$new(variant = platform_variant(), name = "map_test", height = 796, 
      width = 1139)
  app$set_inputs(navs = "Suicide Rate by Country")
  app$set_inputs(suicide_map_year = 2001)
  app$set_inputs(suicide_map_shape_mouseover = c(0.0890851890648598, 42.2935641921701, 
      -123.344867058298), allow_no_input_binding_ = TRUE)
  app$set_inputs(suicide_map_shape_mouseout = c(0.740593214661461, 43.8345267822368, 
      -113.505545765156), allow_no_input_binding_ = TRUE)
  app$expect_values()
  app$expect_screenshot()
})
