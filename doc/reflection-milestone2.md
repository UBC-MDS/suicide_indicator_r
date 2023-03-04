# Reflections on Milestone 2

## Implementations to date

We have successfully combined and implemented all the reactive features of the dashboard. The dashboard is easy to use and presents minimal cognitive load. It currently works with two tab options: Country Wise Comparison and Suicide Rate by Country. This addresses the needs of the user persona effectively. 

The Country Wise Comparison tab shows one chart that implements an interactive world map colored on the scale represented by the number of suicides in a particular country, with a slider for choice of year for the visual. This chart also incorporates a tooltip that shows numerical statistics for number of suicides and GDP of that country.

The second tab implements visual comparison between statistics of two different countries. The reactive widgets include two dropdown menus for selecting the two countries and a slider bar for choice of time interval. First of the individual charts shows gender wise percentage split of the suicides per hundred thousand population. The stacked charts are shown for each of the years selected via the slider bar in the widget. The second chart shows suicide numbers according to age ranges, grouped in bars by the selected countries. The third chart shows suicide numbers(per million) and GDP trends over time for the selected features. This chart also includes average world statistics for easy reference for the app user. It may be noted that for this tab all the reactive features are working simultaneously and effectively.