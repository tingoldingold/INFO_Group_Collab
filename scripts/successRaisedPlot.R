library(ggplot2)
library(stringr)
library(dplyr)

# createSuccessPlot returns a plot based on the given dataset
create_raised_plot <- function(dataset) {

  # Manipulate our dataset
  dataset$usd.pledged <- as.integer(dataset$usd.pledged)
  dataset <- dataset %>%
    filter(state == "successful") %>%
    filter(currency == "USD") %>%
    filter(launched > "2016-01-01") %>%
    group_by(main_category)

  options("scipen" = 999, "digits" = 3)
  # Build the plot based on the data set
  ggplot(data = dataset) +
    geom_bar(mapping = aes(
      x = main_category, y = usd.pledged,
      fill = main_category
    ), stat = "identity") +
    coord_flip() +
    labs(
      x = "Main Category",
      y = "US Dollars Pledged"
    ) +
    guides(fill = FALSE) +
    theme(
      axis.text = element_text(size = 14),
      axis.title.x = element_text(size = 16),
      axis.title.y = element_text(size = 16)
    )
}
