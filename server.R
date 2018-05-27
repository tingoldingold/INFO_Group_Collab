#---- Server File 
source("./scripts/renderSuccessPlot.R")
source("./scripts/successRaisedPlot.R")
source("./scripts/successBackersPlot.R")

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
  output$sucess_plot_1 <- renderPlot({
    return(createSuccessPlot(kickstarter))
  })
  
  output$sucess_plot_2 <- renderPlot({
    return(createRaisedPlot(kickstarter))
  })
  
  output$sucess_plot_3 <- renderPlot({
    return(createBackersPlot(kickstarter))
  })
  
  
  ### -------- Distributions Plots ---------- ###
  
})