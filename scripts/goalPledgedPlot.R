library(ggplot2)
library(stringr)
library(dplyr)

createPledgedPlot <- function(dataset, goalRange, pledgedRange, selectedCategory) {
  
  # filter data to only include user selected category
  # default value is "Film & Video"
  filtered <- dataset %>% filter(main_category == selectedCategory)

  # create scatter plot of goal vs pledged using filtered data
  # min/max x and y values determined from given user data
  # color of points determined by subcategory
  p <- ggplot(data = filtered) +
    geom_point(mapping = aes(x = usd_goal_real, y = usd_pledged_real, color = category)) +
    xlim(goalRange[1], goalRange[2]) +
    ylim(pledgedRange[1], pledgedRange[2]) +
    labs(x = "Goal (USD)", y = "Pledged (USD)")
  p
}
