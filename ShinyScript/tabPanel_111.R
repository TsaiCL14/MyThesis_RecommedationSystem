####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(2,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Choose DEPT")),
         br(),
         ##put input boxes here
         div(style="display: inline-block;vertical-align:top; width: 100%;",
             strong("Choose DEPT:"), 
             selectInput(inputId = "DEPT",label = NULL,choices = department,
                         selected = "unit") ## close selectInput
         ), ## close div
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Numerical：")),
         br(),
         ### show tables
         # br(),
         div(style="display: inline-block;vertical-align:top; width: 100%;",
             strong("Numerical Of DEPT"),
             # strong("選擇科系報考人數 : \t",textOutput('total_student')),
             textOutput('total_student1'),
             # br(),
             textOutput('total_student2'),
             # br(),
             textOutput('total_student3')
         ), ## close div 
         br(),
         br(),
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             # strong("契合度表現分數")),
             strong("Matching Level Performance")),
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100%;",
             strong("Performance"),
             textOutput('figure_MP1'),
             textOutput('figure_MP2'),
             textOutput('figure_MP3')
         ), ## close div
         br(),
         br(),
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Where Go")),
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100%;",
             strong("Where Go input"),
             selectInput(inputId = "UNIV",label = NULL,choices = c("unit"),
                         selected = "unit"),
             strong("Enrollment State"),
             radioButtons(inputId = "STATE",label = NULL,choices = c("Chooseless","Accept","Wait","N_Accept"),selected = "Chooseless")
         ) ## close div
         ### show value of figure
         ### make some input with Freshman_Go page here
         
         
         
  ), ## close column 1
  
  #### put output here ####
  column(10, 
         tabsetPanel(
           tabPanel("Performance Of Matching Level",
                    source("ShinyScript/MatchingLevelsPerformance_111.R")),
           tabPanel("Where Student Go",
                    source("ShinyScript/Freshman_Go_111.R"))
         ) ## close tabset panel
         
  ) ## close column
  
) ##close fluid row