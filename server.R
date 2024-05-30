library(shiny)
library(plotly)
library(ggplot2)
library(bslib)
library(dplyr)
library(stringr)
library(DT)

data <- read.csv("Survey on Student Mental Health1.csv")
server <- function(input, output, session) {
  output$my_chart <- renderPlotly({
    if (input$mentalHealth == "Screen Time") {
      plot_data <- ggplot(data, aes(x = On_what_do_you_spend_your_screen_time_more, fill = On_what_do_you_spend_your_screen_time_more)) +
        geom_bar() +
        labs(title = "Screen Time Usage", x = "Activities", y = "Count", fill = "Screen Time Activities")
      ggplotly(plot_data)
    } else if (input$mentalHealth == "Diet") {
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
  
  output$tables <- renderTable({
      source("tables.R") 
    })
  
  output$takeaway1 <- renderText({
       "As shown in the data table below, it is obvious that factors such as spending too much time on screen, external stress and diet have an impact on one's mental health condition. More than 50% of student in college expereince mental health issues which is stemed from these factos. in Fact, a study has shown that in the united states specifically, it is estimated that up to or more that 50% of those who experience mental health problem, about 31% show an average prevalnce of depression. The quality of food that we consume on the daily can have major effect on our health. For example: eating fruits and vegitables along with protiens daily and eating junk foods daily are different when it comes to the effects they have on our bodies and our brains. Understanding this correlation between food and mental health is important as it can have implications in the way eat and care for our health."
    })
  
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
    "In conclusion, the most important insight is that we should not think about mental health issues based on common prejudices and stereotypes. Many individuals always unintentionally hold a prejudice that students' mental health conditions are mainly related to academic performances since their lives are centered on learning, but it turns out that factors that we tend to ignore, such as diet and screen time, also influence students' mental health. Similarly, a common stereotype is that negative mental impacts definitely lead to some worse outcomes in every aspect of life, but the data shows that students suffering from COVID-19's negative mental effects tend to have higher grades. Extending to broader areas, since every person's mind is limited to some degree, the best starting point for analyzing or learning something is to discard pre-assumptions and study the facts such as data. Though due to many reasons,  facts are not guaranteed to be fully trustable, they do offer people a chance to rethink and embrace a more diverse mindset."
  })
}