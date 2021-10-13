## Assignment 2
# Jimena Rico
# October 13, 2021

# clear environment
rm(list=ls())

library(janitor)
library(readxl)
library(tidyverse)
library(dplyr)

### 1. Setting up data
# 1a) import and save data
airbnb <- read_csv("assign_2.csv")

#airbnb %>% view() #1.b)

# 1c) change column name
airbnb = airbnb %>%
  rename("neighborhood" = "neighbourhood")

### 2. Pipping and summary stats

# 2a) create tibble with n by neighborhood
neighborhoods <- airbnb %>%
  count(neighborhood, sort = T)

# 2b) Keep only top 20 neighborhoods in descending order (without NAs)
neighborhoods= neighborhoods %>%
  filter(!is.na(neighborhood)) %>%
  arrange(desc(n)) %>%
  head(20)

# 2c) airbnb tibble only with top 20 neighborhoods (from neighborhoods tibble)
airbnb_top_neighborhoods <- airbnb %>%
  filter(neighborhood %in% neighborhoods$neighborhood)

# check we got only top 20 neighborhoods
#airbnb_top_neighborhoods %>% count(neighborhood, sort = T)

#2d) summary stats top 20 neighborhoods
summary_stats_top_neighborhoods <- airbnb_top_neighborhoods %>%
  group_by(neighborhood) %>%
  summarize(avg_square_feet=mean(square_feet, na.rm=T),avg_price=mean(price), 
            sd_price=sd(price), max_price=max(price), min_price=min(price)) %>%
  arrange(desc(avg_square_feet))
  
#2e)  save highest average square feet (extract an element from matrix)
highest_avg_square_ft= summary_stats_top_neighborhoods[[1,2]] 

#2f) save 2nd highest average price
summary_stats_top_neighborhoods<- summary_stats_top_neighborhoods %>% 
  arrange(desc(avg_price))

second_avg_price= summary_stats_top_neighborhoods[[2,3]] 



