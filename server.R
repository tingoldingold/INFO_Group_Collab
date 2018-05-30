#---- Server File 
source("./scripts/renderSuccessPlot.R")
source("./scripts/successRaisedPlot.R")
source("./scripts/successBackersPlot.R")
source("./scripts/categoryPlot.R")
source("./scripts/renderDistributionPlot.R")
source("./scripts/goalPledgedPlot.R")

#---- Libraries 
library(dplyr)
library(shiny)
library(plotly)
library(styler)
library(lintr)

#---- Load Data File
kickstarter <- read.csv(
  file = "./data/ks-projects-201612.csv",
  stringsAsFactors = FALSE
)

#---- Load 2nd Data file (2018)
kickstarter18 <- read.csv(
  file = "./data/ks-projects-201801.csv",
  stringsAsFactors = FALSE
)


#---- Start shinyServer
shinyServer(function(input, output) {

  ### ------- Category Analysis Plots ------- ###
  output$category_plot <- renderPlotly({
    return(create_category_plot(kickstarter, input$main_category))
  })
  ### ---------- Money Pledge Plots --------- ###
  output$plot_money <- renderPlot({
    return(createPledgedPlot(
      kickstarter18, input$goal_range,
      input$pledged_range, input$category
    ))
  })

  ### ------ Success Statistics Plots ------- ###
  output$sucess_plot_1 <- renderPlot({
    return(create_success_plot(kickstarter))
  })

  output$sucess_plot_2 <- renderPlot({
    return(create_raised_plot(kickstarter))
  })

  output$sucess_plot_3 <- renderPlot({
    return(create_backers_plot(kickstarter))
  })


  ### -------- Distributions Plots ---------- ###
  output$plot_distribution <- renderPlotly({
    return(createDistributionPlot(
      kickstarter,
      input$distribution_range[1],
      input$distribution_range[2],
      input$distribution_day
    ))
  })
})

