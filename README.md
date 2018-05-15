# INFO 201 FINAL PROJECT PROPOSAL

Maegan Nevalsky, Tristan Ingold, Soham Pardeshi, Estelle Jiang

---

# Project Description 

The following markdown file will explain the theme and data that will be used in our Final Project Assignment. This project is meant to display our knowledge and mastery of core R skills developed throughout the duration of this course. This project will culminate with a full launch of our website that will give intelligent and creative insights into our data. Read further to gain insight into the data we have chosen to use, the questions we plan to answer, and the technical processes we plan on using to wrangle the data, process it, and display it to the users. 

### Dataset
We will be using the [Kickstarter Dataset](https://www.kaggle.com/kemical/kickstarter-projects/data) which we found on Kaggle. Specifically, the most useful data in this corpus includes the **goal** of fundraiser, the **launch date**, the **end date**, and the amount of USD **currency pledged** (conversion to US dollars done by Kickstarter). This information will be stored in a CSV file (~37 MB) which we will have to convert to a data frame in order to process. The advantage to this is that we will have a local copy of the data, so we can load information faster; however, the tradeoff is that we won’t have live information about how new fundraisers are performing.

### Audience 
Kickstarter is a huge _platform for entrepreneurs_, those looking to get involved in new and creative projects, as well as, just regular people trying to see what is being created in the world around them. The size and popularity of the platform means that the website gets traffic from many different people but there are two groups in particular that serve as the main audiences: _Backers_ and _Entrepreneurs_. Although, the data we will present will be relevant to the entrepreneurs, our **main target audience for this project will be the Backers**. In More detail, these are the people that search this site funding projects they like and think will be successful. Backers are offered rewards in terms of prizes, money and ownership in return for their monetary support. Unfortunately, only about 44% of these projects will be successful. Our aim will be to offer insights and tips into what makes a successful Kickstarter project that which will prove to be most beneficial to potential Backers. 

### Exploration
There are a wide variety of questions that we intend to explore in this dataset. The following are a few of the possibilities for what we can learn through our analysis, but they are just a starting point for us to discover even more interesting insights to this data.

- What are the most common Kickstarter categories and subcategories?
- What categories and subcategories are most successful in terms of percent success, amount of money pledged, or number of backers?
- How many Kickstarter campaigns were cancelled and what percentage of those already had backers? 
- Is there any correlation between the time of year the campaign is launched and the campaign’s success? 



---

# Technical Description

### Data Format

We found our dataset from **Kaggle** website, which is a great place to discover and seamlessly analyze open data. There are lots of interesting and meaningful open datasets online and people who love data and code can easily get the dataset they want. Since it is an open dataset with **.csv format**, we are able to download and directly read in the necessary data. 

### Data Wrangling
 
When it comes to data wrangling, we will definitely **reshape** our dataset into some new dataframe and perform computations in order to display much clearer and more revealing visualizations for people who browse our website. Moreover, we will also have to choose the most meaningful among the **15 columns** to **reformat** our dataset in the following weeks. 

### Libraries
While this is not an exhaustive collection of the libraries that we intend on using, we do foresee use of the following tools in our project. We may also use some additional internal tools (e.g. lintr) that we felt were not mentioning.

**shiny** - provides a powerful framework for building web apps that have an interactive/dynamic component

**ggplot2** - a system for creating graphic visualizations based on our processed data

**plotly** - another graphic visualization tool which allows for browser-based interactivity when used in combination with ggplot2

**dyplr** - a data manipulation tool, providing a “consistent set of verbs’ that help us solve common data manipulation challenges

Using these, we hope to move forward on our project, iteratively coming closer to a novel understanding and deep insight about our data.

### Challenges

One of the challenges our team will definitely face is going to be using git for collaboration. Although we did well together on a7, we are all still getting used to the process and will likely hit some bumps along the way. It may also be challenging defining our own deadlines and holding ourselves to them, because we are in charge of our own pacing for this project. Lastly, it could be difficult to keep our final project from spreading too wide. The dataset we chose has so many interesting insights to explore, that we could easily get sidetracked from our main goals.
