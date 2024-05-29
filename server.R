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
#    "Takeaway1."
#  })
  
  output$summary_chart <- renderPlot({
    source("summary_chart.R")$value
  })
  
  output$takeaway2 <- renderText({
    "Takeaway2."
  })
  
  output$summary_table <- renderDT({
    source("summary_table.R")$value
  })
  
  output$takeaway3 <- renderText({
    "Takeaway3."
  })
}