
## Assigning Variables
x <- 7
## Reassigning Variables
x <- 2
# Atomic vectors (all same data types)
## logical - TRUE or FALSE
y <- FALSE
## double - numeric - decimal
z <- 2.33
## character - string - "" or ''
a <- "Joseph"
## c() - short for combine to create a longer vector, same data type
b <- c(TRUE, FALSE)
# DataFrames
## data.frame() - name-vector pairs to create a dataframe, default converts string to factors
## $  notation
cities_df <- data.frame(
cities = c("Vancouver", "Kyoto", "Toronto", "Tokyo", "Austin", "Osaka"),
#country = c("Canada", "Japan", "Canada", "Japan", "USA", "Japan"),
#region = c("North America", "Asia", "North America", "Asia", "North America", "Asia"),
population = c(15, 100, 20, 500, 30, 400),
rating = c(3, 2, 5, 1, 5, 2)
)
# compare the mean of two samples
reg <- c("North America", "Asia", "North America", "Asia", "North America", "Asia")
cities_df$region <- reg
# compare the mean of multiple samples
country <- c("Canada", "Japan", "Canada", "Japan", "USA", "Japan")
cities_df$country <- country
model_aov <- aov(rating ~ country, data = cities_df)
d <- c("a", 1.23, TRUE)
a <- "John"
e <- list("a", 1.23, TRUE)
f <- list(1:100)
f
install.packages("tidyverse")
library(tidyverse)
library(styler)
help("tidyverse")
?readr
?readr::read_csv
# tibbles vs data.frames
library(tibble)
cities_tibble <- tibble(
cities = c("Vancouver", "Kyoto", "Toronto", "Tokyo", "Austin", "Osaka"),
country = c("Canada", "Japan", "Canada", "Japan", "USA", "Japan"),
region = c("North America", "Asia", "North America", "Asia", "North America", "Asia"),
population = c(15, 100, 20, 500, 30, 400),
rating = c(3, 2, 5, 1, 5, 2)
)
print(cities_df)
print(cities_tibble)
data.frame(number = 1:10000)
tibble(number = 1:10000)
data.frame(number = 1:10000, letter = c("a", "b"))
tibble(number = 1:10000, letter = c("a", "b"))
tibble(number = 1:10000, letter = "a")
library(magrittr)
cities_tibble %>%
select(cities, population, rating) %>%
filter(population >= 100) %>%
arrange(rating)
