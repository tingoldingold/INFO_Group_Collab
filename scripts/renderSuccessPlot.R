library(ggplot2)

# createSuccessPlot returns a plot based on the given dataset and the queried day
createSuccessPlot <- function(dataset, day) {
  
  # Manipulate our dataset to contain weekdays and the number of projects that
  # became successful that were launched on those weekdays
  dataset <- select(dataset, launched, state) %>% 
             mutate(dayofweek = weekdays(as.Date(launched))) %>% 
             filter(state == "successful" & dayofweek == day) %>% 
             select(dayofweek, state) %>% 
             group_by(dayofweek) %>% 
             summarize(count = n())
  
  # Build the plot based on the data set
  plot <- ggplot(dataset, aes(x = count, y = dayofweek)) +
          geom_bar(stat = 'identity')
  
  return(plot)
}