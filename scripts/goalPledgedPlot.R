library(ggplot2)
library(stringr)
library(dplyr)

createPledgedPlot <- function(dataset, goalRange, pledgedRange, selectedCategory) {
  # dataset <- read.csv("./data/ks-projects-201612.csv", stringsAsFactors = FALSE)
  
  # dataset2 <- read.csv("./data/ks-projects-201801.csv", stringsAsFactors = FALSE)
  
  filtered <- dataset %>% filter(main_category == selectedCategory)
  
  # how can this be sent into ui.R
  # mainCategories <- dataset %>% group_by(main_category) %>% summarise(count = n()) %>% arrange(-count)
  # topCategories <- as.vector(mainCategories$main_category)[1:15]
  # names(topCategories) <- mainCategories$main_category[1:15]
  
  
  p <- ggplot(data = filtered) +
    geom_point(mapping = aes(x = usd_goal_real, y = usd_pledged_real, color = category)) +
    xlim(goalRange[1], goalRange[2]) +
    ylim(pledgedRange[1], pledgedRange[2]) +
    labs(x = "Goal (USD)", y = "Pledged (USD)")
  p
}
