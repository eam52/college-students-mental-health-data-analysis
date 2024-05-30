library(shiny)
server <- function(input, output, session) {
  
  chart2 <- ggplot(data_department, aes(x = When_you_are_stressed_more, fill = department)) + 
    geom_bar(stat = "count") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    labs(title = "Relationship between Major and Source of Stress",
         x = "During Heightened Stress", y = "Number of Students") +
    scale_fill_discrete(name = "Major")
  chart2
  
  output$plot_2 <- renderPlotly({
    student_mental[, unlist(input$Stress), drop = FALSE]
  })
  
}  
  
  
  
  
  
  
  
  
  
}
  
  

  
  
  
  
  
  
