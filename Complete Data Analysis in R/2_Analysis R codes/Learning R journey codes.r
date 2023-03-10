library(readr)
data_basketball <- read_csv("1_data/1_data_sources/01_BasketballStats.csv")
View(data_basketball)
data_stores <- readr::read_csv("1_data/1_data_sources/02_Stores.csv")
str(data_stores)
library(readxl)
folder_path <- "1_data/1_data_sources/"
excel_file <- "03_excel_source_data.xlsx"
data_raw_excel <- read_excel(paste(folder_path, excel_file, sep = ""))
# Exercise
# Import the 04_exercise_data.csv with UI or code
# Save as data_exercise
data_exercise <- read_csv("1_data/1_data_sources/04_exercise_data.csv")
View(data_exercise)
library(readr)
data_basketball <- read_csv("1_data/1_data_sources/01_BasketballStats.csv")
View(data_basketball)
data_stores <- readr::read_csv("1_data/1_data_sources/02_Stores.csv")
str(data_stores)
library(readxl)
folder_path <- "1_data/1_data_sources/"
excel_file <- "03_excel_source_data.xlsx"
data_raw_excel <- read_excel(paste(folder_path, excel_file, sep = ""))
# Exercise
# Import the 04_exercise_data.csv with UI or code
# Save as data_exercise
data_exercise <- read_csv("1_data/1_data_sources/04_exercise_data.csv")
View(data_exercise)
load("C:/Users/Dell Latitude E7240/Downloads/CFI DUE COURSES/Learner Files - R Fundamentals/r_fundamentals/.RData")
library(magrittr)
cities_tibble %>%
select(cities,population,rating) %>%
filter(population>=100 ) %>%
arrange(rating
cities_tibble %>%
select(cities,population,rating) %>%
filter(population>=100 ) %>%
arrange(rating)
library(dplyr)
cities_tibble %>%
select(cities,population,rating) %>%
filter(population>=100 ) %>%
arrange(rating)
cities_tibble<-tibble(
cities = c("vancouver","kyoto","Toronto","Tokyo","Austin","Osaka"),
country<-c("Canada","Japan","Canada","Japan","USA","Japan"),
region<-c("North America", "Asia","North America", "Asia","North America", "Asia"),
population = c(15,100,20,500,30,400),
rating = c(3,2,5,1,5,2)
)
print(cities_df)
print(cities_tibble)
data.frame(number=1:10000, letter= c("a","b"))
tibble(number=1:10000, letters = "a")
library(magrittr)
cities_tibble %>%
select(cities,population,rating) %>%
filter(population>=100 ) %>%
arrange(rating)
########R Basics######
cities_df<-data.frame(cities = c("vancouver","kyoto","Toronto","Tokyo","Austin","Osaka"),population = c(15,100,20,500,30,400),rating = c(3,2,5,1,5,2))
print(cities_df)
##looking at the structure of cities_df
str(cities_df)
##Looking at an individual column
cities_df$population
##we can sum,multiply and even get statistical measures i.e
sum(cities_df$population)
mean(cities_df$population)
var(cities_df$population)
sd(cities_df$population)
#correlation
cor(cities_df$population, cities_df$rating)
#Linear Models
lm(cities_df$rating ~ cities_df$population)
lm(rating ~ population, data = cities_df)
##defining our region(adding a region column to our data)
reg<-c("North America", "Asia","North America", "Asia","North America", "Asia")
cities_df$region<-reg
str(cities_df)
##T-test(comparing mean)
#checking if rating by region is significantly different
t.test(rating ~ region, data = cities_df)
##creating another column
country<-c("Canada","Japan","Canada","Japan","USA","Japan")
cities_df$country<-country
str(cities_df)
#Analysis of Variance
aov(rating ~ country,data = cities_df)
model_aov<-aov(rating ~ country,data = cities_df)
summary(model_aov)
###Installing R packages
install.packages("readxl")
install.packages("styler")
##Tidyverse is a collection of R packages designed for Data Science & Data Analysis
install.packages("tidyverse")
#tibbles vs data.frames
library(tibble)
#recall our cities_df
cities_tibble<-tibble(
cities = c("vancouver","kyoto","Toronto","Tokyo","Austin","Osaka"),
country<-c("Canada","Japan","Canada","Japan","USA","Japan"),
region<-c("North America", "Asia","North America", "Asia","North America", "Asia"),
population = c(15,100,20,500,30,400),
rating = c(3,2,5,1,5,2)
)
print(cities_df)
print(cities_tibble)
data.frame(number=1:10000, letter= c("a","b"))
tibble(number=1:10000, letters = "a")
library(magrittr)
cities_tibble %>%
select(cities,population,rating) %>%
filter(population>=100 ) %>%
arrange(rating)
library(tidyverse)
library(styler)
cities_tibble<-tibble(
cities = c("vancouver","kyoto","Toronto","Tokyo","Austin","Osaka"),
country<-c("Canada","Japan","Canada","Japan","USA","Japan"),
region<-c("North America", "Asia","North America", "Asia","North America", "Asia"),
population = c(15,100,20,500,30,400),
rating = c(3,2,5,1,5,2)
)
print(cities_df)
print(cities_tibble)
data.frame(number=1:10000, letter= c("a","b"))
tibble(number=1:10000, letters = "a")
library(magrittr)
cities_tibble %>%
select(cities,population,rating) %>%
filter(population>=100 ) %>%
arrange(rating)
