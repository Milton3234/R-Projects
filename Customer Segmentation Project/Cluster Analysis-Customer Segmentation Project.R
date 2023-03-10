#Customer segmentation is essential for marketing plans.
#Key questions for a great segmentation include target customers, how to serve them, and where to play.
#Segmentation should be actionable, differentiable, and have an economic perspective.
#In this case study, customers are segmented based on demographic and personal characteristics.
#Kmeans clustering technique is used, resulting in 16 segments.
#The output includes 6 characteristics that are interpretable, actionable, and economically focused.

##simplifying the dataset
data<-Train[,2:9]
summary(data)
str(data)

#checking the number of professions we have
unique(data$Profession)

#Transform blanks into NA
data[data == ""] <- NA
data <- data[complete.cases(data),]
View(data)

#start building on the dataset
library(dplyr)
dataset <- data %>% select_if(is.numeric)
character <- data %>% select_if(is.character)
View(character)

##Transforming character into numerical/ dummy
#install.packages("fastDummies")
library(fastDummies)
character <- dummy_cols(character,
                        remove_most_frequent_dummy = T)

##Finalizing our dataset
dataset <- cbind(dataset,character[, 6:18])

##Scaling the dataset
dataset[,1:16] <- scale(dataset[,1:16])

##determining the amount of segments
##install.packages("factoextra")
library(factoextra)
fviz_nbclust(dataset, kmeans, method = "wss") +
  labs(subtitle = "Elbow Method")


#clustering
clusters <- kmeans(dataset, centers = 6, iter.max = 10)
clusters$centers
write.csv(clusters$centers, file = "cluster.csv")
dataset <- cbind(dataset, clusters$cluster)
View(dataset)


