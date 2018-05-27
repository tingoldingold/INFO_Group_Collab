library(ggplot2)
library(stringr)
library(dplyr)

# createSuccessPlot returns a plot based on the given dataset and the queried day
createBackersPlot <- function(dataset) {
  # dataset <- read.csv("./data/ks-projects-201612.csv", stringsAsFactors = FALSE)
  dataset$backers <- as.integer(dataset$backers)
  # Manipulate our dataset 
  dataset <- dataset %>%  
    filter(state == "successful") %>% 
    filter(currency == "USD") %>% 
    group_by(main_category)
  
  options("scipen"=999, "digits"=3)
  # Build the plot based on the data set
  ggplot(data = dataset) +
    geom_bar(mapping = aes(x = main_category, y = backers, 
                           fill = main_category), stat = "identity") +
    coord_flip() + 
    labs(
      y = "Backers", 
      x = "Main Category"
    ) + 
    guides(fill=FALSE) +
    theme(axis.text = element_text(size = 14),
          axis.title.x = element_text(size = 16),
          axis.title.y = element_text(size = 16))
  
}
