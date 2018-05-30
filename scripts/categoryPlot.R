library(ggplot2)
library(stringr)
library(plotly)

kickstarter <- read.csv(file="./data/ks-projects-201612.csv", 
                        stringsAsFactors = FALSE)

create_category_plot  <- function(dataset, category_name) {
  main_category_data <- dataset %>% 
    group_by(main_category) %>%
    distinct(category)
  
  artbook <- dataset %>% 
    filter(main_category == category_name) %>% 
    group_by(category) %>% 
    summarise(
      n = n()
    )
  
  # PieChart 
  p <- plot_ly(artbook, labels = ~category, values = ~n, type = 'pie',
               textposition = 'inside',
               textinfo = 'label+percent',
               width = 500,
               height = 450,
               insidetextfont = list(color = '#FFFFFF'),
               hoverinfo = 'text',
               text = ~paste("Total number of project is ", n),
               marker = list(colors = colors,
                             line = list(color = '#FFFFFF', width = 0.5)),
               showlegend = FALSE) %>%
    layout(title = 'Kickstarter Subcategories Breakdown',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  p
}