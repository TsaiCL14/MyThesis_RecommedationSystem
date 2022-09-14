#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#### 參考模板：https://shiny.rstudio.com/gallery/mote-effect-size.html
library(shiny)
library(DT)
library(plotly)
library(knitr)
# library(ggridges)
# library(ggplot2)
# library(MOTE)
# library(knitr)
# options(shiny.usecairo = FALSE) # 讓shiny出現中文用
### 需要執行的科系 
source("ShinyScript/useData.R",encoding = "utf-8")
### 會用到的function ####
source("ShinyScript/function/plot_110_VariableGroup function.R",encoding = "utf-8")
source("ShinyScript/function/plot_111_EnrollmentState function.R",encoding = "utf-8")
source("ShinyScript/function/plot_111_FreshmanGoUniversity function.R",encoding = "utf-8")
source("ShinyScript/function/plot_111_Verify function.R",encoding = "utf-8")
source("ShinyScript/function/makeText_111 function.R",encoding = "utf-8")
source("ShinyScript/function/plot_111_Accept function.R",encoding = "utf-8")
source("ShinyScript/function/plot_111_FreshmanGoDepartmentWithState function.R",encoding = "utf-8")
######### UI ##############
# Define UI for application that draws a histogram
ui <- fluidPage(
  shinyUI(
    #### make the nacbar pages ####
    navbarPage(title = "Verify Matching Level",
               tabPanel(title = "Year of 111",
                        source("ShinyScript/tabPanel_111.R",encoding = "utf-8")) ## close tabPanel
    )# close navbarPage
  )# close shinyUI
)# close fluidPage


############## server ##############
# Define server logic required to draw a histogram
server <- function(input, output, session) {
  ##### plot_110_VariableGroup ####
  output$plot_110_VariableGroup <- renderPlotly({
    plot_110_VariableGroup(DEPT = input$DEPT)[[1]]
  })
  
  #### plot_111_Verify  ####
  output$plot_111_Verify <- renderPlotly({
    plot_111_Verify(DEPT = input$DEPT)[[1]]
  })
  #### plot_111_FreshmanGoUniversity #### 
  output$plot_111_FreshmanGoUniversity <- renderPlotly({
    plot_111_FreshmanGoUniversity(DEPT = input$DEPT)[[1]]
  })
  
  #### total_student1 ####
  output$total_student1 <- renderText({
    makeText_111(DEPT = input$DEPT)$'SignUp'
  })
  #### total_student2 ####
  output$total_student2 <- renderText({
    makeText_111(DEPT = input$DEPT)$'Enrollment'
  })
  #### total_student3 ####
  output$total_student3 <- renderText({
    makeText_111(DEPT = input$DEPT)$'Accept'
  })
  
  #### plot_111_EnrollmentState ####
  output$plot_111_EnrollmentState <- renderPlotly({
    plot_111_EnrollmentState(DEPT = input$DEPT)
  })
  #### plot_111_Accept ####
  output$plot_111_Accept <- renderPlotly({
    plot_111_Accept(DEPT = input$DEPT)[[1]]
  })
  #### figure_MP1 ####
  output$figure_MP1 <- renderText({
    plot_110_VariableGroup(DEPT = input$DEPT)[[2]]
  })
  #### figure_MP2 ####
  output$figure_MP2 <- renderText({
    plot_111_Verify(DEPT = input$DEPT)[[2]]
  })
  #### figure_MP3 ####
  output$figure_MP3 <- renderText({
    plot_111_Accept(DEPT = input$DEPT)[[2]]
  })
  #### plot_111_FreshmanGoDepartmentWithState ####
  output$plot_111_FreshmanGoDepartmentWithState <- renderPlotly({
    plot_111_FreshmanGoDepartmentWithState(DEPT = input$DEPT,UNIV = input$UNIV,STATE = input$STATE)
  })
  #### updateSelectInput_UNIV ##### 
  observe({
    updateSelectInput(session, "UNIV",
                      label = NULL,
                      choices = plot_111_FreshmanGoUniversity(DEPT = input$DEPT)[[2]]
                      # selected = plot_111_FreshmanGoUniversity(DEPT = input$DEPT)[[2]][1]
    ) ## close updateSelectInput
  }) ## close observe
  
} ## close server function

####### RUN ############
# Run the application 
shinyApp(ui = ui, server = server)
