# Reflections on Milestone 4

## Implementations to date

We have successfully combined and implemented all the reactive features of the initial dashboard plan. The dashboard is easy to use and presents minimal cognitive load. It currently works with three tab options: Trigger warning, Country Wise Comparison and Suicide Rate by Country. This addresses the needs of our user persona effectively. 

The trigger warning tab contains a warning for the user, given the sensitivity of the analysis topic. The second tab shows one map chart that implements an interactive world map colored on the scale represented by the number of suicides in a particular country, with a slider for choice of year for the visual. This chart also incorporates a tooltip that shows numerical statistics for number of suicides and GDP of that country.

The third tab implements visual comparison between statistics of two different countries. The reactive widgets include two dropdown menus for selecting the two countries and a slider bar for choice of time interval. First of the individual charts on the first sub-tab shows gender wise percentage split of the suicides per hundred thousand population. The stacked charts are shown for each of the years selected via the slider bar in the widget. The second chart shows suicide numbers according to age ranges with the help of a dumbell plot. The third chart, which is present on the second sub-tab, shows suicide numbers(per million) and GDP trends over time for the selected features. This chart also includes average world statistics for easy reference for the app user. It may be noted that for this tab all the reactive features are working simultaneously and effectively.

The app implementation now also includes `shinytest` incorporation and follows a complete CI/CD workflow. 

## TA/Peer/Instructor feedback

The feedback from peers, TAs and the instructor has been very helpful and constructive. The bar charts were erroring out earlier for missing data, as identified by the TA after M2. This problem has been fixed now. The grouped bar chart has been replaced by dumbell plot as advised by Florencia. We believe this looks more appealing. As mentioned by Florencia and in peer review, the earlier app version had plots that did not fit in one page view. This has also been addressed by putting a sub tab and moving the line charts there. We have also included a trigger warning at the launch page for users who may feel sensitive to the topic.

## Room for future improvements

We believe there is still room for improvement in the app. The theme and color coherence could be improved on. There could definitely be an option to compare more than two countries at a time. While individual units on all chart axes are descriptive and clear, all the charts could possibly share similar units. There are a lot of broader studies that our app could potentially incorporate in future.
