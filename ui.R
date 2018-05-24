#---- UI File 

#---- Libraries 
library(shiny)
library(plotly)
library(shinythemes)
library(dplyr)        

#---- Start UI
shinyUI(navbarPage(
  theme = shinytheme("journal"), 
  img(src = "./imgs/logo.png", height = 25, length = 120),
    tabPanel(
      "Home",
      tags$h1("All About Crowdfunding for Creativity"),
      sidebarLayout(
        sidebarPanel(
          tags$h2("Authors"),
          tags$div(
            class = "para_one", checked = NA,
            tags$h3("Tristan Ingold"),
            tags$p("Tristan is a Business Student currently pursing an 
                   Information Systems option while concurrently pursing an 
                   Informatics Minor. His main interest are in Data Analytics 
                   and Visualization."),
            tags$a(href="tingold1997@gmail.com", "Email Tristan!"), 
            tags$h3("Maegan Nevalsky"),
            tags$p("Maegan studies stuff......"),
            tags$a(href="maegann@uw.edu ", "Email Maegan!"), 
            tags$h3("Soham Pardeshi"),
            tags$p("Soham Pardeshi studies stuff......."),
            tags$a(href="spard@uw.edu", "Email Soham!"), 
            tags$h3("Estelle Jiang"),
            tags$p("Estelle Jiang studies stuff......."),
            tags$a(href="mailto:yichej@uw.edu","Email Estelle!")
          )
        ), 
        mainPanel(
          tags$div(
            class = "page_one_about", checked = NA,
          tags$h3("What is Kickstarter"),
          tags$p("Kickstarter is a funding platform for everything from film, to
                 gaming, to music, art, and design. They try to host the most 
                 innovative and imaginative ideas that are brought to life by 
                 their users. Everything on Kickstarter must be a project with a
                 clear goal, like making an album, a book, or a work of art. A 
                 project will eventually be completed, and something will be 
                 produced by it."), 
          tags$h3("Basics for Kickstarter"),
          tags$p("A project is a finite work with a clear goal that you’d like 
                 to bring to life. Think albums, books, or films. The funding 
                 goal is the amount of money that a creator needs to complete 
                 their project. Funding on Kickstarter is all-or-nothing. No one
                 will be charged for a pledge towards a project unless it
                 reaches its funding goal. This way, creators always have the 
                 budget they scoped out before moving forward. A creator is the 
                 person or team behind the project idea, working to bring it to 
                 life. Backers are folks who pledge money to join creators in 
                 bringing projects to life. Rewards are a creator's chance to 
                 share a piece of their project with their backer community. 
                 Typically, these are one-of-a-kind experiences, limited 
                 editions, or copies of the creative work being produced."),
          tags$h3("Who is our audience?"),
          tags$p("The size and popularity of the platform means that the website
                 gets traffic from many different people but there are two 
                 groups in particular that serve as the main audiences: Backers
                 and Entrepreneurs. Although, the data we will present will be 
                 relevant to the entrepreneurs, our main target audience for 
                 this project will be the Backers. In More detail, these are 
                 the people that search this site funding projects they like and
                 think will be successful. Backers are offered rewards in terms 
                 of prizes, money and ownership in return for their monetary 
                 support. Unfortunately, only about 44% of these projects will 
                 be successful. Our aim will be to offer insights and tips into 
                 what makes a successful Kickstarter project that which will
                 prove to be most beneficial to potential Backers. "),
          tags$h3("Backers?"),
          tags$p("Many backers are rallying around their friends' projects. Some 
                 are supporting a new effort from someone they've long admired. 
                 Some are just inspired by a new idea, while others are 
                 motivated to pledge by a project's rewards — a copy of what's 
                 being produced, a limited edition, or a custom experience 
                 related to the project. Backing a project is more than just 
                 pledging funds to a creator. It's pledging your support to a 
                 creative idea that you want to see exist in the world. The 
                 majority of initial funding usually comes from the fans and 
                 friends of each project. If they like it, they'll spread the 
                 word to their friends, and so on. Press, blogs, Twitter, 
                 Facebook, and Kickstarter itself are also big sources of 
                 traffic and pledges. Altogether, millions of people visit 
                 Kickstarter every week.")
          ),
          tags$link(
            rel = "stylesheet", type = "text/css",
            href = "style.css")
        ),
        position = "right"
      )
    ),
    tabPanel(
      "Catagory Analysis",
      tags$h1("Catagories?"),
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
      "Money Pledged",
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
      "Success Statistics",
 
      tags$hr(),
      fluidRow(
        column(12, offset = 2,
          tags$h2("Project Status"), 
          plotOutput("plotTest")
        )
      ),
      tags$hr(), 
      fluidRow(
        column(12, offset = 2,
               tags$h4("Result interpretation:", class = "inter")
        )
      ),
      tags$hr(), 
      fluidRow(
        column(12, offset = 2,
               tags$h4("Result interpretation:", class = "inter")
        )
      )
    ),
    tabPanel(
      "Distributions",
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
  )
)