library(shiny)
library(dplyr)
library(ggplot2)
library(stringr)

server <- function(input, output, session) {
  data_influence <- reactive({
    raw_data <- read.csv("Survey on Student Mental Health1.csv")
    data <- raw_data %>%
      mutate(
        Feeling_during_Pandemic = str_extract(How_did_you_felt_during_COVID_19_pandemic_period, "^[^,]*"),
        Mental_Impacts_of_COVID = case_when(
          Feeling_during_Pandemic %in% c("Happy", "Relieved") ~ "Positive",
          TRUE ~ "Negative"
        )
      ) %>%
      filter(Cgpa > 5)
    
    return(data)
  })
  
  observe({
    updateSelectInput(session, "stressSource",
                      choices = c("All" = "All", unique(data_influence()$From_where_you_are_getting_stress)))
  })
  
  filtered_data <- reactive({
    if (input$stressSource == "All") {
      data_influence()
    } else {
      data_influence() %>%
        filter(From_where_you_are_getting_stress == input$stressSource)
    }
  })
  
  output$pandemicImpactPlot <- renderPlot({
    data <- filtered_data()
    ggplot(data, aes(x = Cgpa, fill = Mental_Impacts_of_COVID)) +
      geom_histogram(position = "dodge", bins = 10) +
      labs(title = "Distribution of CGPA by Mental Impact of COVID-19",
           x = "CGPA",
           y = "Frequency") +
      theme_minimal() +
      scale_fill_brewer(palette = "Set1")
  })
  
#  output$chart1 <- renderPlot({
#    source("chart1")$value
#  })

#  output$takeaway1 <- renderText({
#    "Contents for Takeaway1."
#  })
  
  output$summary_chart <- renderPlot({
    source("summary_chart.R")$value
  })
  
  output$takeaway2 <- renderText({
    "As shown in the chart below, it is evident that regardless of their major, students in technical fields experience the most stress during exams, as the standards for these exams always tend to be higher than those in other fields. Particularly, CSE majors appear most frequently in every stress source bar, indicating that CSE students consistently endure higher stress levels than students in any other major, or/and that there are significantly more students majoring in CSE. Given that the data/tech-related majors are known for tough exams and consistent career popularity, it is not surprising that student stress is correlated with their majors, especially for CSE students."
  })
  
  output$summary_table <- renderDT({
    source("summary_table.R")$value
  })
  
  output$takeaway3 <- renderText({
    "According to the table below, more students reported negative mental impacts from COVID-19  compared to those who reported positive mental impacts. For both groups, the median CGPA is the same. However, students who reported negative mental impacts have higher 25th and 75th percentile CGPAs, indicating that these students tend to have higher grades and a more centralized grade distribution. These values may also suggest that this group of students with higher academic performance experience more worries about future/peer pressure/academic anxiety compounded by COVID-19's negative mental effects. We shall always remember that grade is only a small part of life, and thus, we cannot conclude that students suffering negative mental impacts from COVID have better overall well-being merely due to their tendency for better academic performance."
  })
  
  output$insights <- renderText({
    "Contents for insights."
  })
}