##This case study is about a Facebook page and all posts done in a 12 month period.
##With the goal to understand  what drives impressions,we prepare a dataset,make
##the necessary transformations,perform a Linear Regression, and interpret the results.



##Retrieve Dataset
setwd("C:/Users/Dell Latitude E7240/Downloads/Facebook metrics")
library(readr)
dataset_Facebook<- read.csv("dataset_Facebook.csv", sep=";")
View(dataset_Facebook)

##Creating dataset
dataset<-dataset_Facebook %>% select(Lifetime.Post.Total.Impressions,
                                     Page.total.likes,
                                     Type,
                                     Post.Weekday,
                                     Paid,
                                     comment,
                                     like,
                                     share)

##Data structure
str(dataset)

##transforming type and Post.weekday
dataset$Type <- as.factor(dataset$Type)
dataset$Post.Weekday <- as.factor(dataset$Post.Weekday)

##Transforming variables
dataset$Lifetime.Post.Total.Impressions<- log(dataset$Lifetime.Post.Total.Impressions)
View(dataset)
dataset$Page.total.likes <- log(dataset$Page.total.likes)

#Linear Regression
model <- lm(Lifetime.Post.Total.Impressions ~ .,
            data = dataset)
summary(model)
