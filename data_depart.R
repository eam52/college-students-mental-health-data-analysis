library(dplyr)
library(tidyverse)

raw_data <- read.csv("Survey on Student Mental Health1.csv")
data <- raw_data %>%
  mutate(department = trimws(Department), 
         Feeling_during_Pandemic = str_extract(How_did_you_felt_during_COVID_19_pandemic_period, "^[^,]*"))

top_10_department <- data %>%
  count(department) %>%
  arrange(desc(n)) %>%
  slice_head(n = 10)

data_department <- data %>%
  filter(department %in% top_10_department$department)
save(data_department, top_10_department, file = "processed_data.RData")