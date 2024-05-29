library(shiny)
library(bslib)
library(rsconnect)

ui <- navbarPage(
  title = "INFO 201 App",
  theme = bs_theme(),
  tabPanel(
    title = "Introductory Page",
    fluidPage(
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
      ),
      div(class = "header-background"),
      div(class = "container",
          div(class = "section mt-4",
              h4("The purpose/importance of the project", class = "section-title"),
              p("Our project focuses on exploring the intricate relationships between various factors—such as academic major, dietary habits, and the impacts of the COVID-19 pandemic—and mental health among college students. We aim to leverage an interactive web application to analyze and visualize data gathered from health surveys and academic records. This approach allows us to identify and understand patterns and trends that may influence students' mental well-being, providing a foundation for targeted mental health strategies and interventions within academic communities.", class = "section-content")
          ),
          div(class = "section mt-4",
              h4("Main questions", class = "section-title"),
              p("The major questions we are seeking to answer:", class = "section-content"),
              tags$ul(
                tags$li("Is there a relationship between mental health issues among college students and their dietary/nutrition habits?"),
                tags$li("Are certain academic majors more likely to be associated with higher levels of stress?"),
                tags$li("How did the COVID-19 pandemic affect the mental and academic well-being of college students?"),
              )
          ),
          div(class = "section mt-4",
              h4("Data Source", class = "section-title"),
              p("The data for our study was sourced from Kaggle, a platform for data science competitions and datasets. The dataset was compiled by AKILESH S, who gathered the data to analyze mental health issues among college students. There are 468 observations (rows) and 18 features (columns) in the dataset. The data was generated through survey responses provided by the students. These responses were self-reported, based on personal feelings or perceptions related to various aspects of mental health. As firsthand data provided by real college students in real time, the data is appropriate for our research on students' mental health.",
                tags$a(href = "https://www.kaggle.com/datasets/akilesh23/student-mental-health-issues/data", "Link to the Original Source"), ".", class = "section-content")
          ),
          div(class = "section mt-4",
              h4("Ethical Questions and Limitations", class = "section-title"),
              p("When working with this data, ethical considerations include ensuring the anonymity and confidentiality of the respondents. It's crucial to handle the data in a way that respects the privacy of the individuals involved and avoids any misuse of sensitive information about their mental health. The dataset presents several limitations. The reliance on self-reported responses may lead to inaccuracies due to subjective interpretations of personal mental health states. The short duration of data collection and concentration of respondents from specific departments (e.g., CSE) may not accurately reflect broader trends and may skew results towards particular demographics. The design of the survey, which in some cases restricted responses to a single choice where multiple responses might be applicable, could result in an incomplete representation of the students' mental health conditions and behaviors. The uneven gender distribution with a higher percentage of male respondents might introduce a bias, potentially impacting the findings and their generalizability to the entire student population. All these factors necessitate a cautious approach to interpreting the findings, considering the potential biases and limitations inherent in the dataset. Further research, perhaps with a more robust and comprehensive data collection method, would be beneficial to deepen the understanding of mental health dynamics among students.", class = "section-content")
          ),
          div(class = "section mt-4",
              h4("Authors", class = "section-title"),
              tags$ul(
                tags$li("Abdulbasit Abdalla (tooly206@uw.edu)"),
                tags$li("Ekram Milash (Eam52@uw.edu)"),
                tags$li("Alison Milles (amilles1@uw.edu)"),
                tags$li("Angela Sun (sinuos2@uw.edu)")
              )
          )
      )
    )
  ),
  tabPanel(
    title = "Interactive Page 1",
    fluidPage(
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
      ),
      h1("Interactive Page 1", class = "main-title text-center mt-4"),
      p("The chart attempts to answer the question: “How do dietary habits correlate with mental health conditions among college students?”", class = "section-content"),
      p("We understand that diet can affect our daily routines, whether we eat too little or too much, both of which can be caused by stress. Students respond to stress differently, and understanding that, we wanted to research the relationship between dietary habits, performance, and mental health among college students.", class = "section-content")

    )
  ),
  tabPanel(
    title = "Interactive Page 2",
    fluidPage(
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
      ),
      h1("Interactive Page 2", class = "main-title text-center mt-4"),
      p("")
    )
  ),
  tabPanel(
    title = "COVID-19 Impact",
    fluidPage(
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
      ),
      div(class = "page-header",
          h1("Impact of COVID-19 on Student Well-being", class = "main-title text-center mt-4"),
          p("This interactive page allows users to delve into the varied impacts of the COVID-19 pandemic on the mental and academic well-being of college students. Use the dropdown menu to filter the data based on different sources of stress and observe the resulting changes in CGPA distributions across the student population.", class = "page-description")
      ),
      
      div(class = "control-panel",
          h4("Data Filtering", class = "control-title mt-4"),
          p("Select a stress source from the dropdown menu to see how different stressors during the pandemic have affected students' academic performance, represented through changes in their CGPA.", class = "control-description"),
          selectInput("stressSource", "Filter by Source of Stress:", choices = c("All")),
          tags$hr() 
      ),
      
      div(class = "visualization",
          h4("Visualization", class = "visualization-title"),
          p("The histogram below updates based on your selection to show the distribution of CGPA among the chosen group of students, providing insights into how their academic achievements were impacted during the pandemic.", class = "visualization-description"),
          plotOutput("pandemicImpactPlot")
      )
    )
  ),
  tabPanel(
    title = "Conclusion/Summary Takeaways",
    fluidPage(
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
      ),
      h1("Key Takeaways", class = "main-title text-center mt-4"),
      p("")
    )
  )
)
