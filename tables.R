library("dplyr")
library("tidyverse")

data_set <- read.csv("~/Documents/exploratory-analysis-eam52/Survey on Student Mental Health1.csv")

mutate_col_names <- data_set %>%
  mutate(
    screen = On_what_do_you_spend_your_screen_time_more ,
    stress = When_you_are_stressed_more,
    diet = Are_you_getting_good_food_diet_everyday 
  )

# Group by major and reason for the choosing of the major
agregated_data_frame <- mutate_col_names %>%
  group_by(major, reason, attitude, sleep_amount, diet) %>%
  summarize(
    average_gpa = mean(gpa, na.rm = TRUE),
    maximum_gpa = max(gpa, na.rm = TRUE),
    median_gpa = median(gpa, na.rm = TRUE),
    total_students = n()
  )

print(agregated_data_frame, n = nrow(agregated_data_frame))
