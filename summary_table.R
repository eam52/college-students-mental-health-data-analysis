# Author: Angela Sun
library(dplyr)
library(tidyverse)
library(formattable)

data <- read.csv("Survey on Student Mental Health1.csv")
data <- data %>%
  mutate(department = trimws(Department), 
         Feeling_during_Pandemic = str_extract(How_did_you_felt_during_COVID_19_pandemic_period, "^[^,]*"),
         Mental_Impacts_of_COVID = if_else(Feeling_during_Pandemic == "Happy", "Positive", "Negative"))
summary_table <- data %>%
  group_by(Mental_Impacts_of_COVID) %>%
  summarise(Number_of_Students = n(), 
            CGPA_25th_percentile = quantile(Cgpa, probs = c(0.25), na.rm = TRUE), 
            CGPA_50th_percentile = quantile(Cgpa, probs = c(0.50), na.rm = TRUE),
            CGPA_75th_percentile = quantile(Cgpa, probs = c(0.75), na.rm = TRUE))

print(summary_table)