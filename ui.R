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
      div(class = "header-content",
          h1("Welcome to Our Mental Health Project", class = "main-title text-center mt-4")
      ),
      div(class = "container",
          div(class = "section mt-4",
              h4("The purpose/importance of the project", class = "section-title"),
              p("Our project focuses on exploring the intricate relationships between various factors—such as academic major, dietary habits, and the impacts of the COVID-19 pandemic—and mental health among college students. We aim to leverage an interactive web application to analyze and visualize data gathered from health surveys and academic records. This approach allows us to identify and understand patterns and trends that may influence students' mental well-being, providing a foundation for targeted mental health strategies and interventions within academic communities.", class = "section-content")
          ),
          div(class = "section mt-4",
              h4("Main questions", class = "section-title"),
              p("The major questions we are seeking to answer:", class = "section-content"),
              tags$ul(
                tags$li("How do dietary habits correlate with mental health conditions among college students?"),
                tags$li("Are certain academic majors more likely to be associated with higher levels of stress?"),
                tags$li("What has been the impact of the COVID-19 pandemic on the mental and academic well-being of college students?"),
                tags$li("Does the geographic location of students play a role in their mental health outcomes?")
              )
          ),
          div(class = "section mt-4",
              h4("Data Source", class = "section-title"),
              p("The data for our study was sourced from Kaggle, a platform for data science competitions and datasets. The dataset was compiled by AKILESH S, who gathered the data to analyze mental health issues among college students.",
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
      p("Interactive Page 1.")
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
    title = "Interactive Page 3",
    fluidPage(
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
      ),
      h1("Interactive Page 3", class = "main-title text-center mt-4"),
      p("")
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
