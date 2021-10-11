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
airbnb_top_neighborhoods




