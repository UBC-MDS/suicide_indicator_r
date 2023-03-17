# suicide_indicator_r

- [Warning](#warning)
- [Overview](#overview)
- [Usage and Deployment Link](#usage-and-deployment-link)
- [Download and run app locally](#download-and-run-app-locally)
- [What can you do with this dashboard](#what-can-you-do-with-this-dashboard)
- [Download and run app locally](#download-and-run-app-locally)
- [Motivation](#motivation)
- [The Problem and its Importance](#the-problem-and-its-importance)
- [Description of the Dashboard](#description-of-the-dashboard)
- [Contributing](#contributing)
- [Authors](#authors)
- [References](#references)
- [License](#license)

## Warning

This application includes content that some may find sensitive. The analysis contains details on suicides, which may be unsettling to some users. We kindly request that you proceed only if you feel comfortable doing so. Thank you for your understanding.

## Overview

This Shiny app is a tool based on the World Health Organization's suicide data that allows mental health researchers and service providers to analyze the suicide rates and related socio-economic factors in different regions of the world. The app features two main tabs, including animated maps showing the evolution of suicide numbers and GDP in the world, as well as visual representations for country-wise comparisons of data. The app aims to identify any trends and correlations between these factors to provide insights into suicide prevention and mental health care.

## Usage and Deployment Link
The deployment link for this `suicide_indicator_r` Shiny app can be found [here](https://zaiatc-stepan.shinyapps.io/suicide_indicator_r/).

Usage examples:
- Select two countries to be compared from the navigation pane on the left-hand side to filter the plots by country.
- Select year range from the navigation pane on the left-hand side to filter the plots by suicide per year range.
- Select gender of interest from the navigation pane on the left-hand side to select/un-select suicide rate in-between gender comparison.
- Hover over the selected regions on the map to view the suicide rates and GDP per country and region.

https://user-images.githubusercontent.com/112679383/226021791-5c2a4c7d-e9c5-48be-a1ee-84712ec86e58.mov

### Download and run app locally

- Fork the repo and navigate to `app.R` file. 
- Go to [shinyApp.io](https://www.shinyapps.io/) and sign in/up. On the left-side menu, choose `Account -> tokens -> Add Token -> Show -> Show secret -> Copy to clipboard`. 
- Back to Rstudio, go to top-right corner of source editor, click the button `Run App` and follow the instruction from there to set everything up.

## What can you do with this dashboard?

1.	In addition to country-by-country comparisons of suicide rates and related parameters, the dashboard offers a user-friendly interface for visualizing and tracking the evolution of suicide rates and GDP across time using interactive maps and line plot.

2.	You could also compare the suicide rate in two different countries by year as well as gender with stacked bar chart.

3.	You could analyze and compare the suicide rates by age group in two countries using grouped bar chart.

The dashboard automatically updates in response to the user's inputs, and the user can modify their input using the slider, choice menus and the radio buttons. Overall, by determining patterns and connections between suicide rates and socioeconomic characteristics, clinicians and researchers could learn more about socioeconomic factors affecting the suicide rates in different countries.

## Motivation

The motivation behind this dashboard is that since increasing suicide rates is such a burning problem, it is important for the clinicians and researchers to be able to identify patterns and relationships in suicide data as it can provide them with valuable insides into risk factors associated with suicidal behavior. By analyzing data on factors such as GDP, age, and gender, researchers and clinicians can develop a better understanding of the complex interplay between social factors that contribute to suicide risk.

## The Problem and its Importance

The problem addressed by the dashboard is the high rate of suicide worldwide, which is a major public health concern.

-	suicide is one of the major public health issue worldwide, with approximately 700,00 people dying by suicide every year, according to the [World Health Organization (WHO)](https://www.who.int/health-topics/suicide).
-	suicide affects the individuals but also the communities around them, therefore, it has very tremendous consequences on the society as whole.
-	individuals attempting the suicide may [experience serious mental issues, depression, anxiety](https://www.cdc.gov/suicide/facts/index.html).

## Description of the Dashboard

This Shiny app is based on World Health Organization's suicide data [Suicide Rates Overview (1985 to 2021)](https://www.kaggle.com/datasets/omkargowda/suicide-rates-overview-1985-to-2021), and can help a user analyse suicides around the world based on various socio-economic factors related to the geographic location of the events. Mental health researchers and service providers are the most important class of target audience for this app. A user would be able to see how suicide rates, along with the socio-economic factors, evolve over time in different regions of the world. The app also offers country wise comparisons of the factors that revolve around deaths classified as suicides.

The design of the dashboard is set up with three main options or tabs. The first tab is a trigger warning tab to inform the user about the sensitive information present in the app (tab 1) so they proceed with caution. 

The second tab is aimed at presenting three visual representations for country wise comparison of data. Two dropdown menus are provided on the left panel to select the two countries to compare, a slider bar to select timeline, and the radio buttons to filter by gender for the suicides rate bar chart. On the left, we presented a stacked bar chart comparing suicide rates segregated gender wise for both countries. We have given the user an option to select/un-select the gender if only either is of interest by implementing the radio buttons. The second visual is a dumbbell plot comparing suicides among various age groups for the two countries, along with a world average for comparison. The third and final visual for this tab is a line chart for the GDP as well as suicide rates per capita for the two countries.

The third tab presents animated (over time) maps showing evolution of suicide numbers (tab 3) and country wise GDP in the world. This would enable the user to see any trends and correlations (if any) between the two factors. On the tab where map is located, a dropdown menu is given to the user for customized selection of the timeline for animation. The displayed map is interactive enabling users to get more granular information through tooltips by hovering over the visuals/data points.

The prototype of the dashboard at the development stage could be found [here](https://github.com/UBC-MDS/suicide_indicator_r/blob/main/archived/img/dash_design.png)

## Contributing

First and foremost, **THANK YOU** for using and considering to contributing to our dashboard. 

Current major problem with our dashboard is the delay of map showing up, which prevents us from making plot animate as there will be 5-10 seconds delay among different inputs. 

A workaround for this might be restricting the size of data. Instead of showing worldwide map, we could show part of the map, continent with highest suicides counts etc, which could potentially decreases the delay but not solve the problem once and for all. However, this is not ideal as this kind of map is subjective to app developer and might not be helpful for the target people. 

If you happens to know the solution to the problem mentioned above, feel free to make a pull request and we will respond to it in 5 work days. We really appreciate your help. Other requirements to make contributions to our repo please refer to [here](https://github.com/UBC-MDS/suicide_indicator_r/blob/main/CONTRIBUTING.md).

Interested in contributing? Check out the contributing guidelines. Please note that this project is released with a Code of Conduct. By contributing to this project, you agree to abide by its terms.

## Authors

- Qurat-ul-Ain Azim
- Stepan Zaiatc
- Ty Andrews
- Zilong Yi

## References

The dataset used in this project is the [Suicide Rates Overview (1985 to 2021)](https://www.kaggle.com/datasets/omkargowda/suicide-rates-overview-1985-to-2021) available on Kaggle. The data was originally sourced from the United Nations Development Program, World Bank and World Health Organization.

Please refer to the original data sources for more information on how the data was collected and processed.

## License 

`suicide_indicator_r` was created by Qurat-ul-Ain Azim, Stepan Zaiatc, Ty Andrews and Zilong Yi. The materials of this project are licensed under the [MIT license](https://github.com/UBC-MDS/suicide_indicator_r/blob/main/LICENSE). If re-using/re-mixing please provide attribution and link to this webpage.
