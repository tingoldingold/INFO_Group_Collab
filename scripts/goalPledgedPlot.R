library(ggplot2)
library(stringr)
library(dplyr)

createPledgedPlot <- function(dataset, goal_range,
                              pledged_range, selected_category) {

  # filter data to only include user selected category
  # default value is "Film & Video"
  filtered <- dataset %>% filter(main_category == selected_category)

  options("scipen" = 999, "digits" = 3)

  # create scatter plot of goal vs pledged using filtered data
  # min/max x and y values determined from given user data
  # color of points determined by subcategory
  p <- ggplot(data = filtered) +
    geom_point(mapping = aes(
      x = usd_goal_real,
      y = usd_pledged_real,
      color = category
    )) +
    xlim(goal_range[1], goal_range[2]) +
    ylim(pledged_range[1], pledged_range[2]) +
    labs(
      title = "", x = "Goal (USD)",
      y = "Pledged (USD)", color = "Category"
    ) +
    theme(
      axis.text = element_text(size = 14),
      axis.title.x = element_text(size = 16),
      axis.title.y = element_text(size = 16),
      legend.text = element_text(size = 16),
      legend.title = element_text(size = 16)
    )
  p
}
