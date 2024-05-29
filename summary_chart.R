# Author: Angela Sun
library(dplyr)
library(tidyverse)
library(ggplot2)

# Clean the Data
raw_data <- read.csv("Survey on Student Mental Health1.csv")
data <- raw_data %>%
  mutate(department = trimws(Department), Feeling_during_Pandemic = 
           str_extract(How_did_you_felt_during_COVID_19_pandemic_period, "^[^,]*"))
# Identify the ten departments with the highest student enrollment
top_10_department <- data %>%
  count(department) %>%
  arrange(desc(n)) %>%
  slice_head(n = 10)
data_department <- data %>%
  filter(department %in% top_10_department$department)
chart <- ggplot(data_department, aes(x = When_you_are_stressed_more, fill = department)) + 
  geom_bar(stat = "count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Relationship between Major and Source of Stress",
       x = "During Heightened Stress", y = "Number of Students") +
  scale_fill_discrete(name = "Major")
chart
