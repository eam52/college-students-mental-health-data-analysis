library("dplyr")
library("tidyverse")

data_set <- read.csv("Survey on Student Mental Health1.csv")

aggregated_data_frame <- data_set %>%
  mutate(
    screen = On_what_do_you_spend_your_screen_time_more,
    stress = When_you_are_stressed_more,
    diet = Are_you_getting_good_food_diet_everyday) %>%
  count(screen, stress, diet, name = "Total_students_reported")
#print(aggregated_data_frame, n = nrow(aggregated_data_frame),  na.print = "NA")
