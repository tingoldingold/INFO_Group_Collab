library(dplyr)
library(ggplot2)

# createSuccessPlot returns a plot based on the given dataset and the queried day
createDistributionPlot <- function(dataset, selection) {

  # Manipulate our dataset to contain weekdays and the number of projects that
  # became successful that were launched on those weekdays
  dataset <- select(dataset, goal, usd.pledged) %>% 
              filter(!is.na(is.numeric(goal)) & !is.na(is.numeric(usd.pledged))) %>% 
              mutate(percent_reached = getPercent(usd.pledged, goal)) %>% 
              select(percent_reached)

  # Build the plot based on the data set
  plot <- p <- plot_ly(x = dataset$percent_reached, type = "histogram")
  
  return(plot)
}

getPercent <- function(pledge, goal) {
  tmp <- as.numeric(pledge) / as.numeric(goal)
  tmp <- as.integer(1000 * tmp) / 10
  tmp <- ifelse(tmp > 100, 100, tmp)
  tmp <- ifelse(is.na(tmp), 0, tmp)
  return(tmp)
}

kickstarter <- read.csv(file="./data/ks-projects-201612.csv", 
                        stringsAsFactors = FALSE)
test <- createDistributionPlot(kickstarter)
test
