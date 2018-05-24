#---- Server File 
source("./scripts/renderSuccessPlot.R")

#---- Libraries 
library(dplyr)
library(shiny)

#---- Load Testing Data
kickstarter <- read.csv(file="./data/ks-projects-201612.csv", 
                        stringsAsFactors = FALSE)

#---- Start shinyServer
shinyServer(function(input, output) { 

  ### ------- Category Analysis Plots ------- ###
  
  ### ---------- Money Pledge Plots --------- ###
  
  ### ------ Success Statistics Plots ------- ###
  output$plotTest <- renderPlot({
    status <- c("successful", "failed", "canceled")
    kickstarter <- kickstarter  %>% 
      filter(state %in% status) %>% 
      select(main_category, state, category) 
    
    # Build the plot based on the data set
   plot <- ggplot(data = kickstarter ) +
      geom_bar(mapping = aes(x = main_category, fill = state), position = "fill") + 
      coord_flip() +
      labs(
        title = "Status of Projects by Catagory",
        y = "Project Count", 
        x = "Main Category", 
        fill = "Status"
      ) +
      scale_fill_manual(values=c("#4155f4", "#f44141", "#1fb70b"))# see source() at top
  })
  
  
  ### -------- Distributions Plots ---------- ###
  
})