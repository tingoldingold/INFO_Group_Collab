library(ggplot2)
library(stringr)

# createSuccessPlot returns a plot based on the given dataset and the queried day
createSuccessPlot <- function(dataset) {
  dataset <- read.csv("./data/ks-projects-201612.csv")
  # Manipulate our dataset to contain weekdays and the number of projects that
  # became successful that were launched on those weekdays
  status <- c("successful", "failed", "canceled")
  dataset <- dataset %>% 
    filter(state %in% status) %>% 
    select(main_category, state, category) 
    
  # Build the plot based on the data set
  plot <- ggplot(data = dataset) +
    geom_bar(mapping = aes(x = main_category, fill = state), position = "fill") + 
    coord_flip() +
    labs(
      title = "Status of Projects by Catagory",
      y = "Project Count", 
      x = "Main Category", 
      fill = "Status"
    ) +
    scale_fill_manual(values=c("#4155f4", "#f44141", "#1fb70b"))
  
  return(plot)
}