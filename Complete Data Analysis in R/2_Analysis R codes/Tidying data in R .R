library(purrr)
View(data_split)

##checking for null values in our data
is.na(data_split$Q1)

sum(is.na(data_split$Q2))
##the following formula is used to check for null values in all our columns in quick simple lines of code
data_split %>% 
  map(~sum(is.na(.)))

##Return the mean number of characters of each row ignore NA values
data_excercise %>%
  map(~mean(nchar(., keepNA = FALSE)))
View(data_excercise)  

library(tidyr)

#formular for removing NA values
data_split %>% 
  drop_na()

#Replacing the NA values with 0
data_replace_na<-data_split %>% 
  replace_na(list(Q1 = 0,Q2 = 0,Q3 = 0, Q4 = 0))

##Combining multiple similar columns for best practices of tidying up data
data_pivot<-data_replace_na %>%
  pivot_longer(
    cols = c(Q1,Q2,Q3,Q4),
    names_to = "period",
    values_to = "amount"
  )

##Creating 5 new columns in the dataset
View(data_excercise)

data_excercise %>% 
  pivot_wider(
    names_from = Item,
    values_from = CodeAmount
    
  )

##Filling the correct Year info in our data
data_clean<-data_pivot %>% 
  fill(Year)

#Checking for null values to make sure we've completely cleaned our data set
sum(is.na(data_clean))

###Exporting our clean data into a folder as a csv file
write_csv(data_clean, "3_output/Clean_Data.csv")
