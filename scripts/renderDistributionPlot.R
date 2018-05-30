library(dplyr)
library(plotly)

# createSuccessPlot returns a plot based on given dataset and the queried day
create_distribution_plot <- function(dataset, goal_bottom, goal_top, user_day) {

  # Begin by filtering based on days and prepare title of plot
  if (user_day != "All Days") {
    dataset <- filter(dataset, weekdays(as.Date(launched)) == user_day)
    user_day <- paste(" on", user_day)
  } else {
    user_day <- ""
  }
  
  # Manipulate our dataset to contain weekdays and the number of projects that
  # became successful that were launched on those weekdays
  dataset <- select(dataset, goal, usd.pledged) %>% 
    
              filter(suppressWarnings(
                  !is.na(as.numeric(goal)) & !is.na(as.numeric(usd.pledged))
              )) %>% 
    
              filter(as.numeric(goal) <= goal_top 
                     & as.numeric(goal) >= goal_bottom) %>% 
    
              mutate(percent_reached = get_percent(usd.pledged, goal)) %>% 
              select(percent_reached) %>% 
              filter(percent_reached >= 0)


  # Build the plot based on the data set
  plot <- plot_ly(dataset, x = ~percent_reached, type = "histogram",
                  hoverinfo = "none", color = "red") %>% 
          layout(
              title = paste0("Percent of Goal Reached by Projects", user_day),
              xaxis = list(title = "Percentage of Goal Reached"),
              yaxis = list(title = "Number of Projects"), 
              paper_bgcolor = "rgba(245, 246, 249, 1)",
              plot_bgcolor = "rgba(245, 246, 249, 1)"
          )
  
  return(plot)
}

# Returns the percentage reached of a goal (capped at 100) or -1 if 
# insufficient data provided to  method (i.e. NAs not numeric strings)
get_percent <- function(pledge, goal) {
  tmp <- as.numeric(pledge) / as.numeric(goal)
  tmp <- as.integer(1000 * tmp) / 10
  
  tmp <- ifelse(tmp > 100, 100, tmp)
  tmp <- ifelse(is.na(tmp), -1, tmp)
  return(tmp)
}
