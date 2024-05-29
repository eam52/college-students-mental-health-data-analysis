library(shiny)
library(bslib)
library(rsconnect)
library(plotly)
library(ggplot2)
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
    title = "Negative Factors",
    fluidPage(
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
      ),
      h1("Contributing Factors of Mental Health on College Students", class = "main-title text-center mt-4"),
      sidebarLayout(
        sidebarPanel(
          selectInput("mentalHealth", "Different variables that affect mental Health:",
                      choices = c("Screen Time", "Stress", "Diet"))
        ),
        mainPanel(
          fluidRow(
            column(width = 12,
                   conditionalPanel(
                     condition = "input.mentalHealth == 'Screen Time'",
                     h3("The Purpose Of The Chart", class="section-title"),
                     p("The chart attempts to answer the question: “What do you spend your screen time on?”", class = "section-content"),
                     p("We understand that the time spent on screen time is critical to one's mental health. Students respond to stress differently, and understanding that, we wanted to research the relationship between screen time activities and mental health among college students.", class = "section-content"),
                     p("as we can see majority of the students spend their time on social media, which can cause mental Health coditions such as: depression, anxiety, and stress. ", class = "section-content"),
                     h3("Key Insights and findings", class = "section-title"),
                     tags$ul(
                       tags$li("Majority of student spend thier screen time on Social Media"),
                       tags$li("Others spend it on Studying"),
                       tags$li("and the rest saud others which includs video games, movies and more"),
                     ), 
                     h3("Resources", class="section-title"),
                     p("Read more about effects of Screen Time on college Students", class ="section-content"),
                     p(tags$a(href = "https://www.honorsociety.org/articles/impact-screen-time-college-students-finding-balance-digital-age#:~:text=Mental%20Health%20Challenges%3A%20Heavy%20screen,portray%20an%20idealized%20online%20persona.", "Impacts of Screen Time on College Students", class = "section-content")),
                     p(tags$a(href = "https://www.opb.org/article/2023/02/27/screen-time-body-image/s", "Limiting Screen Time", class = "section-content")),
                     p(tags$a(href = "https://www.thesantaclara.org/blog/college-students-are-as-bad-as-ipad-kids", "College Students Vs Ipad Kids", class = "section-content"))
                     
                   ),
                   conditionalPanel(
                     condition = "input.mentalHealth == 'Diet'",
                     h3("The Purpose Of The Chart", class="section-title"),
                     p("This part of the section answers the question: Are you getting good food diet everyday", class = "section-content"),
                     p("Poor Diet has many drawbacks when it coms to not only mentalhealth but also overal health, if you are in college, you tend to east less than the average person due to stress, workoverload, poor time managment and more...", class = "section-content"),
                     h3("Key Insights and findings", class = "section-title"),
                     tags$ul(
                       tags$li("More than half of the students surveyed said NO"),
                       tags$li("Very little amount of people said YES")
                     ),
                     p("What this lets us know is that majority of student are not properly feeding themselves, which can cause major mental health comditons.", class ="section-content"),
                     h3("Resources", class="section-title"),
                     p("Read more about effects of diet in our daily activities, mental health and overal health", class ="section-content"),
                     p(tags$a(href = "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6659154/", "Mental Health & Nutrition", class = "section-content")),
                     p(tags$a(href = "https://www.healthline.com/nutrition/healthy-eating-tips", "Healthy Meal Plans for College Students", class = "section-content")),
                     p(tags$a(href = "https://www.medicalnewstoday.com/articles/322268", "Strategies on Improving Your Eating Habits", class = "section-content"))
                   ),
                   conditionalPanel(
                     condition = "input.mentalHealth == 'Stress'",
                     h3("The Purpose Of The Chart", class = "section-title"),
                     p("According to National Institutes of Health (NIH):", class = "section-content"), 
                     tags$a(href = "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9169886/", "Link to the NIH Website", class = "section-content"),
                     p("Academic stress is one of the dominant stress factors among college students, and it is said to affect the mental well-being of students, especially those in harder fields of study. Just like stated, some groups have a higher chance of stress due to different factors.", class = "section-content"),
                     p("This Stress Chart attempts to answer the question: When are you stressed the most? Asking students to respond with the most cause of stress factor they experience.", class = "section-content"),
                     h3("Key Insights and findings", class = "section-title"),
                     p("From the chart below, we learn the main cause of stress among college students:", class = "section-content"),
                     tags$ul(
                     tags$li("Majority of student stress from exams"),
                     tags$li("The next group is stress about money"),
                     tags$li("followed by, not getting enought sleep"),
                     ),
                     h3("Resources", class="section-title"),
                     p("Read more about effects of stress and how to cope with stress", class ="section-content"),
                     p(tags$a(href = "https://www.purdueglobal.edu/blog/student-life/college-students-guide-to-stress-management-infographic/", "Stress Managments", class = "section-content")),
                     p(tags$a(href = "https://jedfoundation.org/resource/understanding-academic-stress/", "Stress effects on college students", class = "section-content")),
                     p(tags$a(href = "https://learningcenter.unc.edu/tips-and-tools/managing-college-stress/", "How to cope with stress as a college students", class = "section-content"))
                   ),
                   column(width = 12,
                          plotlyOutput(outputId = "my_chart")
                   )
            )
          )
        )
      )
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
