library(dplyr)

tidyverse_conflicts()

dplyr::filter()
stats::filter()

filter()

view(data_stores)

data_stores %>% 
  select(StoreID,Store_Sales)

data_stores %>% 
  pull(Daily_Customer_Count)

filter(data_stores,Store_Sales>=100000)

data_stores %>% 
  filter(Daily_Customer_Count >= 800 | Store_Sales>=50000)

slice(data_stores,1:30)
slice(data_stores,1, 30)

data_stores %>% 
  slice(1:30) %>% 
  filter(Items_Available < 2000)

#Return the Store,District and Daily customer count for stores
data_stores %>% 
 filter(Store_Sales>=10000) %>% 
  select(Store_Sales,DistrictID,Daily_Customer_Count)

##Creating new columns with mutate()
data_stores %>% 
  mutate(average_sales_per_customer = Store_Sales/Daily_Customer_Count)

data_stores %>% 
  mutate(Store_volume = case_when(
    Daily_Customer_Count >= 1000 ~ "Large",
    Daily_Customer_Count >= 500 & Daily_Customer_Count < 1000 ~ "Med",
    TRUE ~ "Small"
  ))

data_stores %>% 
  mutate(sales_Rank = dense_rank(-Store_Sales)) %>% 
  arrange(sales_Rank)

##Exercise
##First create a new column that calculates the Average Sales per customer
##Second, create a rank column of Average Sales per customer from highest to lowest
##Third, sort the tibble by the new rank column
##Finally, only return the fifth to fifteenth rows
data_stores %>% 
  mutate(average_sales_per_customer = Store_Sales/Daily_Customer_Count) %>% 
  mutate(average_sales_per_customer_rank = dense_rank(-average_sales_per_customer)) %>% 
  arrange(average_sales_per_customer_rank) %>% 
  slice(5:15)

##Summarise group by
data_stores %>%
  summarise(mean(Store_Sales))

data_stores %>% 
  summarise(first = first(Store_Sales))

data_stores %>% 
  summarise(IQR = IQR(Store_Sales))

data_stores %>% 
  summarise(Q3 = quantile(Store_Sales, .75))
  
data_stores %>% 
  summarise(
    mean = mean(Store_Sales),
    MAX = max(Store_Sales),
    MIN = min(Store_Sales),
    Standard_Deviation = sd(Store_Sales),
    Variance = var(Store_Sales)
  )

data_stores %>% 
  group_by(DistrictID) %>% 
  summarise(District_sales = sum(Store_Sales))


#Exercise - Create a new conditional column, "customer_volume" that bins the daily customer count
#The customer volume column will return "high" if daily customer count is greater than 600 and "low" if less than 600
#Then, group data_store by DistrictID and customer_volume, summarising thedata by the average of store salesdata_stores %>%
data_stores %>% 
    mutate(customer_volume = case_when(
     Daily_Customer_Count >= 600 ~ "high",
      TRUE ~ "low"
     )) %>% 
    group_by(DistrictID,customer_volume) %>% 
    summarise(Average_Sales_District = mean(Store_Sales))


data_stores %>% 
  nest(data = Store_Area:Store_Sales)

data_stores %>% 
  group_by(StoreID,DistrictID) %>% 
  nest()

##Combining data with joins

data2 <- tibble(
  ID = c("John",'seb','Joseph','Adam','Yuting'),
  length = 1:5*2,
  length2 = 16:20*4
)
View(data2)

data3 <- tibble(
  ID = c("Stephen",'Seb','Joseph','Adam','Yuting'),
  width = 6:10*3,
  width2 = 11:15*4
)
View(data3)

left_join(data2,data3,by = "ID")

inner_join(data2,data3,by = "ID")

right_join(data2,data3,by = "ID", keep = TRUE)

full_join(data2,data3,by = "ID", keep = TRUE,suffix= c("-data2","-data3"))

full_join(data2,data3,by = "ID", keep = TRUE)

##Using Select() with tidy select functions
data_stores %>% 
  select(DistrictID,StoreID)

data_stores %>% 
  select(everything())

data_stores %>% 
  select(last_col())

data_stores %>% 
  select(starts_with('d'))

data_stores %>% 
  select(ends_with('t'))

data_stores %>% 
  select(contains("Store"))

data_stores %>% 
  select(contains('ID')) %>% 
  select(starts_with('S'))

##Performing Multiple Operations with rowwise() & across()
data2 %>% 
  mutate(average_length = mean(c(length,length2)))

data2 %>%
  rowwise() %>% 
  mutate(average_length = mean(c(length,length2)))

data2 %>%
  rowwise() %>% 
  mutate(average_length = sum(c(length,length2)))

data_stores %>%
  group_by(DistrictID) %>% 
  summarise(across(Store_Area:Store_Sales,sum))

data_stores %>%
  group_by(DistrictID) %>%
  mutate(DistrictTotal = across(Store_Area:Store_Sales,sum))

##Excercise - Return the standard deviation of the last four columns of data_stores
data_stores %>%
  summarise(across(Store_Area:Store_Sales,sd))

##Excercise
#Group data_stores by District
#Summarise the grouped tibble to find the average store sales and average store area
#Return a sum of the two columns for each row in the tibble
data_stores %>% 
  group_by(DistrictID) %>% 
  summarise(Average_Store_Sales = mean(Store_Sales), Average_Store_Area = mean(Store_Area)) %>% 
  rowwise() %>%
  mutate(sum(Average_Store_Sales,Average_Store_Area))
