library(dplyr)
library(plotly)

# createSuccessPlot returns a plot based on the given dataset and the queried day
createDistributionPlot <- function(dataset, goalBottom, goalTop, userDay) {

  # Begin by filtering based on days and prepare title of plot
  if(userDay != "All Days") {
    dataset <- filter(dataset, weekdays(as.Date(launched)) == userDay)
    userDay <- paste(" on", userDay)
  } else {
    userDay = ""
  }
  
  # Manipulate our dataset to contain weekdays and the number of projects that
  # became successful that were launched on those weekdays
  dataset <- select(dataset, goal, usd.pledged) %>% 
              filter(suppressWarnings(!is.na(as.numeric(goal)) & !is.na(as.numeric(usd.pledged)))) %>% 
              filter(as.numeric(goal) <= goalTop & as.numeric(goal) >= goalBottom) %>% 
              mutate(percent_reached = getPercent(usd.pledged, goal)) %>% 
              select(percent_reached) %>% 
              filter(percent_reached >= 0)


  # Build the plot based on the data set
  plot <- plot_ly(dataset, x = ~percent_reached, type = "histogram") %>% 
          layout(
              title = paste0('Percent of Goal Reached by Projects', userDay),
              xaxis = list(title = "Number of Projects"),
              yaxis = list(title = 'Percentage of Goal Reached'), 
              paper_bgcolor = 'rgba(245, 246, 249, 1)',
              plot_bgcolor = 'rgba(245, 246, 249, 1)'
          )
  
  return(plot)
}

# Returns the percentage reached of a goal (capped at 100) or -1 if insufficient 
# data provided to the method (i.e. NAs instead of numeric strings)
getPercent <- function(pledge, goal) {
  tmp <- as.numeric(pledge) / as.numeric(goal)
  tmp <- as.integer(1000 * tmp) / 10
  
  tmp <- ifelse(tmp > 100, 100, tmp)
  tmp <- ifelse(is.na(tmp), -1, tmp)
  return(tmp)
}
