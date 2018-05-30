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
  
  # Barplot
  p <- plot_ly(artbook, labels = ~category, values = ~n, type = 'pie',
               textposition = 'inside',
               textinfo = 'label+percent',
               insidetextfont = list(color = '#FFFFFF'),
               hoverinfo = 'text',
               text = ~paste("Total number of project is ", n),
               marker = list(colors = colors,
                             line = list(color = '#FFFFFF', width = 1.5)),
               #The 'pull' attribute can also be used to create space between the sectors
               showlegend = FALSE) %>%
    layout(title = 'United States Personal Expenditures by Categories in 1960',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  p
}

#pie <- ggplot(artbook, aes(x = "", y = n, fill = category))+
  #geom_bar(width = 1, stat = "identity") + coord_polar("y", start=0)
#pie
