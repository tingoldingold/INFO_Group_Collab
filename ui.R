#---- UI File 

#---- Libraries 
library(shiny)
library(plotly)
library(shinythemes)
library(dplyr)        

#---- Start UI
shinyUI(navbarPage(
  theme = shinytheme("slate"), 
  "Kickstarter",
    tabPanel(
      "Home",
      tags$h1("What is Kickstater?"),
      sidebarLayout(
        sidebarPanel(
          tags$h2("Second Header")
          ), 
        mainPanel(
          plotOutput("plot")
        )
        )
    ),
    tabPanel(
      "Tab 2",
      tags$h1("What is Kickstater?"),
      sidebarLayout(
        sidebarPanel(
          tags$h2("Second Header")
        ), 
        mainPanel(
          plotOutput("plot")
        )
      )
    ),
    tabPanel(
      "Tab 3",
      tags$h1("What is Kickstater?"),
      sidebarLayout(
        sidebarPanel(
          tags$h2("Second Header")
        ), 
        mainPanel(
          plotOutput("plot")
        )
      )
    ),
    tabPanel(
      "Tab 4",
      tags$h1("What is Kickstater?"),
      sidebarLayout(
        sidebarPanel(
          tags$h2("Second Header")
        ), 
        mainPanel(
          plotOutput("plot")
        )
      )
    ),
    tabPanel(
      "Tab 5",
      tags$h1("What is Kickstater?"),
      sidebarLayout(
        sidebarPanel(
          tags$h2("Second Header")
        ), 
        mainPanel(
          plotOutput("plot")
        )
      )
    )
))