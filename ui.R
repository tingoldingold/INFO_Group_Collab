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

            tags$a(href="mailto:tingold1997@gmail.com", "Email Tristan!"), 
            tags$h3("Maegan Nevalsky"),
            tags$p("Maegan is a Junior at the University of Washington studying
                   Computer Science."),
            tags$a(href="mailto:maegann@uw.edu ", "Email Maegan!"), 

            tags$h3("Soham Pardeshi"),
            tags$p("Soham Pardeshi is a Philosophy student at the University
                  of Washington. He aims to purse the study of the 
                  epistemological overlap between human intelligence and 
                   artificial intelligence."),

            tags$a(href="mailto:spard@uw.edu", "Email Soham!"), 

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
          plotOutput("plot_category")
        )
      )
    ),
    tabPanel(
      "Money Pledged",

      tags$h1("How much money is pledged?"),
      sidebarLayout(
        sidebarPanel(
          tags$h2("Filters"),
          selectInput("category", label = h3("Select Category"), 
                      choices = list("Film & Video"="Film & Video", 
                                     "Music"="Music", 
                                     "Publishing"="Publishing", "Games"="Games", 
                                     "Technology"="Technology", "Art"="Art", 
                                     "Design"="Design", "Food"="Food", 
                                     "Fashion"="Fashion",
                                     "Theater"="Theater", 
                                     "Photography"="Photography",
                                     "Comics"="Comics", "Crafts"="Crafts", 
                                     "Journalism"="Journalism", 
                                     "Dance"="Dance"), 
                      selected = "Film & Video"),
          sliderInput("goalRange", label = h3("Goal Range"), min = 0, 
                      max = 1000000, value = c(0, 500000), step = 5000),
          sliderInput("pledgedRange", label = h3("Pledged Range"), min = 0, 
                      max = 1000000, value = c(0, 500000), step = 5000)

        ), 
        mainPanel(
          plotOutput("plot_money")
        )
      )
    ),
    tabPanel(
      "Success Statistics",
      fluidRow(
        column(10, offset = 1,
          tags$h2("Status of Projects by Catagory"), 
          plotOutput("sucess_plot_1", height = 600), 

          tags$p(class = "succ_summary", "As mentioned ealrier in the analysis, 
                 only about ", strong("40% "), "of projects acutally reach their
                 funding goal and can be started. Kickstarter works on an
                 \"All-orNothing\" protocal which means there is little risk for
                 a Backer looking to get involved in new, creative, and 
                 seemingly low-ball projects. However, if you are a serious 
                 Backer looking to fund projects that will have great sucess and
                 bring you benefits in the long run, it is worth noting which
                 projects have the highest sucess averages.", br(), br(), 
                 strong("Key takeaways from this graph: "), br(), "It is 
                 important to notice that Theatre, Dance and Comics have high 
                 success rates, these projects are often put together by good
                 knowledgable producers, writers, and actors/dancer. However, 
                 these projects may be harder to come by, and because volume in 
                 these categories is so low, if you are a Backer that likes to 
                 find a project that aligns well with their interest, it may be
                 hard to find your niche. Categories such as Fashion, Games and 
                 Technology will have much higher volumes of projects and will
                 more appropiately satisfy niche creative demands but the
                 likelyhood of failure is much higher. There are trade-offs to 
                 being a Backer for different types of projects. We recommend 
                 trying to find projects that interest you in categories of both 
                 high and low success. ")
        )
      ),
      tags$hr(), 
      fluidRow(
        column(10, offset = 1,
          tags$h2("Dollars Pledged to Successful Projects in the United
                  States"),
          plotOutput("sucess_plot_2"), 
          tags$p(class = "succ_summary", "As we talked about earlier there is 
                 quite a discrepancy created around the sucess of projects when
                 one considers the volume that these projects bring in. ", 
                 strong("When only considering projects that are sucessful, "), 
                 "the technology and gaming sectors bring in upwards of $15 
                 million. Notice also that those same categories from above that 
                 enjoyed high success rates are bringing in fractions of that, 
                 with Theatre bringing in under only $1 million dollars in 
                 pledges from Backers.", br(), br(), strong("Key takeaways from 
                 this graph: "), br(), "As a Backer it is extremely important 
                 that you think about what kind of Backer you
                 want to be. Ask yourself: \"What do I want my return on 
                 investment to look like?\" If you are a casual Backer than
                 relax and find the project that speaks best to you no matter 
                 the category. On the other hand, if you came to Kickstarter 
                 with the intention of making a significant amount of profit 
                 than really consider what sector you want to go into. 
                 Technology, Gaming and Design have sufficient enough volume in 
                 successful projects to satisfy the the need for greater 
                 returns. This is in part due to the fact that higher profile
                 projects are established in these categories. Think of 
                 significant return on investment from high profile companies
                 and you will end end talking about the likes of Oculus,
                 Elevation Lab, and Bragi to name a few.")
        ) 
      ),
      tags$hr(), 
      fluidRow(
        column(10, offset = 1,
          tags$h2("Number of Backers by Category"), 
          plotOutput("sucess_plot_3"), 
          tags$p(class = "succ_summary", "Here is a graph about the Backers, by
                 the Backers, for the Backer. Of course, all of these graphs 
                 have been constructed to give Backers insight into certain 
                 factors about the sucess of projects in different categories. 
                 However, this one maps out just how many backers are attracted
                 to project that end up seeing success. There is no surprise 
                 here that because of the volume of projects described earlier
                 there are noteworthy spikes in the Technology, Gaming, and 
                 Design. However there are some interesting spikes that occur 
                 elsewhere in the graph.", br(), br(), strong("Key takeaways 
                                                              from this graph"), 
                 br(), "Film and Video, Music, and Publishing are not to be 
                 ignored. All three of the categories, although not bringing in 
                 over a million backers, still bring in over 250,000 Backers per 
                 year. This shows that they are producing a relatively popular 
                 product offering and taking the time to look up projects in 
                 those categories might be a fruitful endeavor. Another 
                 observation gathered by this graph is the fact that Fashion is 
                 the only category that displays a relative decrease between 
                 money pledged and Backers supporting. This could be due to the 
                 fact that fashion is an market with high entry barriers which 
                 more commonly suits entry through expensive designer goods. It 
                 could also be attributed to a relatively low success rate. 
                 Whatever the cause may be, as a Backer it would be wise to look 
                 at that category as an area in which one can incur more 
                 incentives, ROI, or even ownership because of a low volume of 
                 Backers. ")
        )
      )
    ),
    tabPanel(
      "Distributions",
      tags$h1("What is Kickstater?"),
      sidebarLayout(
        sidebarPanel(
          # Make a list of checkboxes
          radioButtons("selection", label = h3("Choose metric..."),
                       choices = list("Test 1" = 1, "Test 2" = 2)
          )
        ),
        
        mainPanel(
          plotlyOutput("plot_distribution")
        )
      )
    )
  )
)