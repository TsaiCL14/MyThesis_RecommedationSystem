########## 設計111入學年度分頁的小頁面
####create fluid row####
# library(shiny)
fluidRow(
  
  #### 圖片的擺放方式 ####
  #### 左邊 ###
  # column(width = 12,
  plotlyOutput("plot_111_FreshmanGoUniversity"),
  # ) ## close column1
  plotlyOutput("plot_111_FreshmanGoDepartmentWithState")
  # 'shinyapp/shiny_plot/plot_111_FreshmanGoDepartmentWithState function.R'
  
) ##close fluid row