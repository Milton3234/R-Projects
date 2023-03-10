##Importing the dataset we'll use.
data_basketball <- read_csv("1_data/1_data_sources/01_BasketballStats.csv")
View(data_basketball)
##adding packages we'll use
library(readr)
library(readxl)


data_stores <- readr::read_csv("1_data/1_data_sources/02_Stores.csv")
str(data_stores)

###creating a folder path to make our work easier
folder_path<-"1_data/1_data_sources/"


excel_file<-"03_excel_source_data.xlsx"
data_raw_excel<-read_excel(paste(folder_path, excel_file, sep = ""))

X04_exercise_data <- read_csv("1_data/1_data_sources/04_exercise_data.csv")
data_excercise<-X04_exercise_data
View(data_excercise)

library(tidyr)

###I want to tidy data_raw_excel
data_split<-data_raw_excel %>% 
 separate(col = ProductID, sep = -4, into = c("product","product_type")) %>%
  unite(col = product_category, c(CategoryID, product),sep = "-")

#Unite() columns Store and EmployeeID in data_exercise
#using the ":" separator to create column "Store-Employee"
data_excercise %>% 
  unite(col = "Store-Employee", c(Store, EmployeeID), sep = ":")
  

