# suicide_indicator_r

## Overview

The Shiny app is a tool based on the World Health Organization's suicide data that allows mental health researchers and service providers to analyze the suicide rates and related socio-economic factors in different regions of the world. The app features three main tabs, including animated maps showing the evolution of suicide numbers and GDP in the world, as well as visual representations for country-wise comparisons of data. The app aims to identify any trends and correlations between these factors to provide insights into suicide prevention and mental health care.

## Description of the Dashboard

This Shiny app is based on World Health Organization's suicide data, and can help a user analyse suicides around the world based on various socio-economic factors related to the geographic location of the events. Mental health researchers and service providers are the most important class of target audience for this app. A user would be able to see how suicide rates, along with the socio-economic factors, evolve over time in different regions of the world. The app also offers country wise comparisons of the factors that revolve around deaths classified as suicides.

The design of the dashboard is set up with three main options or tabs. The first two present animated (over time) maps showing evolution of suicide numbers (tab 1) and country wise GDP (tab 2) in the world. This would hopefully enable the user to see any trends and correlations (if any) between the two factors. On both these tabs, a slider bar will be given to the user for customized selection of the timeline for animation. The third tab is aimed at presenting three more visual representations for country wise comparison of data. Two dropdown menus will be provided on the left panel to select the two countries to compare, and a slider bar to select timeline. On the right, we will present a stacked bar chart comparing suicide numbers segregated gender wise for both countries and an overall world average. The second visual will be a grouped bar chart comparing suicides among various age groups for the two countries, along with a world average for comparison. The third and final visual for this tab will be a line chart for the GDP as well as suicide rate per capita for the two countries. 

Here is the prototype for our planned dashboard.

![dash_prototype](./img/dash_design.png)

## Usage
The deployment link for this `suicide_indicator_r` Shiny app can be found [here](https://zaiatc-stepan.shinyapps.io/suicide_indicator_r/).

Usage examples:
- Select two countries to be compared from the navigation pane on the left-hand side to filter the plots by country.
- Select year range from the navigation pane on the left-hand side to filter the plots by suicide per year range.
- Hover over the selected region on the map to view the suicide rates and GDP per country and region.

<img src="suicide_indicators_shiny.gif" width="100%" />

For those interested in using suicide_indicator_r dashboard:

## The Problem and its Importance

The problem addressed by the dashboard is the high rate of suicide worldwide, which is a major public health concern.

-	suicide is one of the major public health issue worldwide, with approximately 700,00 people dying by suicide every year, according to the [World Health Organization (WHO)](https://www.who.int/health-topics/suicide).
-	suicide affects the individuals but also the communities around them, therefore, it has very tremendous consequences on the society as whole.
-	individuals attempting the suicide may [experience serious mental issues, depression, anxiety](https://www.cdc.gov/suicide/facts/index.html).

## Motivation

The motivation behind this dashboard is that since increasing suicide rates is such a burning problem, it is important for the clinicians and researchers to be able to identify patterns and relationships in suicide data as it can provide them with valuable insides into risk factors associated with suicidal behavior. By analyzing data on factors such as GDP, age, and gender, researchers and clinicians can develop a better understanding of the complex interplay between social factors that contribute to suicide risk.

## What can you do with `suicide_indicator_r` dashboard?

1.	In addition to country-by-country comparisons of suicide rates and related parameters, the dashboard offers a user-friendly interface for visualizing and tracking the evolution of suicide rates and GDP across time using interactive maps and line plot.

2.	You could also compare the suicide rate in two different countries by year as well as gender with stacked bar chart.

3.	You could analyze and compare the suicide rates by age group in two countries using grouped bar chart.

The dashboard automatically updates in response to the user's inputs, and the user can modify their input using the slider and choice menus. Overall, by determining patterns and connections between suicide rates and socioeconomic characteristics, clinicians and researchers could learn more about socioeconomic factors affecting the suicide rates in different countries.

## Authors

- Qurat-ul-Ain Azim
- Stepan Zaiatc
- Ty Andrews
- Zilong Yi

## Contributing

Interested in contributing? Check out the contributing guidelines. Please note that this project is released with a Code of Conduct. By contributing to this project, you agree to abide by its terms.

## License 

`suicide_indicator_r` was created by Qurat-ul-Ain Azim, Stepan Zaiatc, Ty Andrews and Zilong Yi. The materials of this project are licensed under the [MIT license](https://github.com/UBC-MDS/suicide_indicator_r/blob/main/LICENSE). If re-using/re-mixing please provide attribution and link to this webpage.