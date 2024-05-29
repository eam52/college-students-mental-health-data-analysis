library(shiny)
library(plotly)
library(ggplot2)
library(bslib)
data <- read.csv("~/exploratory-analysis-eam52/Survey on Student Mental Health1.csv")
server <- function(input, output) {
  output$my_chart <- renderPlotly({
    if (input$mentalHealth == "Screen Time"){
      plot_data <- ggplot(data, aes(x = On_what_do_you_spend_your_screen_time_more, fill =  On_what_do_you_spend_your_screen_time_more)) +
        geom_bar() +
        labs(title = "Screen Time Usage", x = "Activities", y = "Count", fill = "Screen Time Activities")
      ggplotly(plot_data)
    } else if (input$mentalHealth == "Diet"){
      plot_data <- ggplot(data, aes(x = Are_you_getting_good_food_diet_everyday, fill = Are_you_getting_good_food_diet_everyday)) +
        geom_bar() +
        labs(title = "Dietary Habits", x = "Are you getting good food diet everyday?", y = "Count", fill = "Diet Status") +
        theme_minimal()
      
      ggplotly(plot_data, tooltip = c("x", "y"))
    } else if(input$mentalHealth == "Stress") {
      plot_data <- ggplot(data, aes(x = When_you_are_stressed_more, fill = When_you_are_stressed_more)) +
        geom_bar() +
        labs(title = "Causes of Stress in College Students", x = "When", y = "Causes", fill = "When stressed") +
        theme_minimal()
      ggplotly(plot_data, tooltip = c("x", "y"))
    } else {
      NULL
    }

  })
  
}


  


