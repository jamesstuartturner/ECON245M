## assignment_2.R
## James Stuart-Turner
## October 2021
library(tidyverse)
airbnb <- read_csv("assign_2.csv")
airbnb <- rename(airbnb, neighborhood = neighbourhood)
airbnb %>% colnames
neighborhoods <- count(airbnb, neighborhood)
neighborhoods <-
  neighborhoods %>% filter(!is.na(neighborhoods)) %>% arrange(desc(n)) %>% head(n =
                                                                                  20L)
airbnb_top_neighborhoods <-
  airbnb %>% filter(neighborhood %in% neighborhoods$neighborhood)
summary_stats_top_neighborhoods <-
  airbnb_top_neighborhoods %>% group_by(neighborhood) %>% summarize(
    avg_square_feet = mean(square_feet, na.rm = TRUE),
    avg_price = mean(price),
    sd_price = sd(price),
    max_price = max(price),
    min_price = min(price)
  ) %>% arrange(desc(avg_square_feet))
highest_avg_square_ft <-
  max(summary_stats_top_neighborhoods$avg_square_feet, na.rm = TRUE)
second_avg_price <-
  max(summary_stats_top_neighborhoods$avg_square_feet [summary_stats_top_neighborhoods$avg_square_feet != max(summary_stats_top_neighborhoods$avg_square_feet, na.rm = TRUE)], na.rm = TRUE)
