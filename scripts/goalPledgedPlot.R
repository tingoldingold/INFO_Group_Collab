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

  options("scipen" = 999, "digits" = 3)

  
  p <- ggplot(data = filtered) +
    geom_point(mapping = aes(x = usd_goal_real, y = usd_pledged_real, color = category)) +
    xlim(goalRange[1], goalRange[2]) +
    ylim(pledgedRange[1], pledgedRange[2]) +
    labs(title = "", x = "Goal (USD)", y = "Pledged (USD)", color = "Category") +
    
    theme(
      axis.text = element_text(size = 14),
      axis.title.x = element_text(size = 16),
      axis.title.y = element_text(size = 16),
      legend.text = element_text(size = 16),
      legend.title = element_text(size = 16)
    )
  p
}
