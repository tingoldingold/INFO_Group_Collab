library(ggplot2)
library(stringr)

# createSuccessPlot returns a plot based on the given dataset and the queried day
createSuccessPlot <- function(dataset) {
  dataset <- read.csv("./data/ks-projects-201612.csv", stringsAsFactors = FALSE)
  # Manipulate our dataset 
  status <- c("successful", "failed", "canceled")
  dataset <- dataset %>% 
    filter(state %in% status) %>% 
    select(main_category, state, category) 
    
  # Build the plot based on the data set
  ggplot(data = dataset) +
    geom_bar(mapping = aes(x = main_category, fill = state), position = "fill") + 
    coord_flip() +
    labs(
      y = "Project Count", 
      x = "Main Category", 
      fill = "Status" 
    ) +
    
    scale_fill_manual(values=c("#4ebad5", "#f22913", "#1fb70b"), name = "",
                      breaks=c("successful", "failed", "canceled"),
                      labels=c("Successful   ", "Failed   ", "Canceled   ")) +

    theme(axis.text = element_text(size = 14),
          axis.title.x = element_text(size = 16),
          axis.title.y = element_text(size = 16),
          legend.text = element_text(size = 16),
          legend.title = element_text(size = 16), 
          legend.position = "top") +
    
    guides(fill=guide_legend(
      keywidth=0.4,
      keyheight=0.1,
      default.unit="inch")
    )
  
  
  
}
