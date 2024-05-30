library("dplyr")
library("tidyverse")

data_set <- read.csv("~/Documents/exploratory-analysis-eam52/Survey on Student Mental Health1.csv")

mutate_col_names <- data_set %>%
  mutate(
    screen = On_what_do_you_spend_your_screen_time_more,
    stress = When_you_are_stressed_more,
    diet = Are_you_getting_good_food_diet_everyday
  )

# Group by major and reason for the choosing of the major
aggregated_data_frame <- mutate_col_names %>%
  count(screen, stress, diet, name = "Total_students_reported")

output$chart1 <- renderTable({
  aggregated_data_frame
})

print(aggregated_data_frame, n = nrow(aggregated_data_frame),  na.print = "NA")
