#---- Server File 
source("./scripts/renderSuccessPlot.R")

#---- Libraries 
library(dplyr)
library(shiny)

#---- Load Testing Data
kickstarter <- read.csv(file="./data/ks-projects-201612.csv", stringsAsFactors = FALSE)

#---- Start shinyServer
shinyServer(function(input, output) { 

  ### ------- Category Analysis Plots ------- ###
  
  ### ---------- Money Pledge Plots --------- ###
  
  ### ------ Success Statistics Plots ------- ###
  output$plot_success <- renderPlot({
    return(createSuccessPlot(kickstarter, input$success_day)) # see source() at top
  })
  
  
  ### -------- Distributions Plots ---------- ###
  
})