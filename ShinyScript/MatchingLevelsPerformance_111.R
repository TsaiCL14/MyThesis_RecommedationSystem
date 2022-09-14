fluidRow(
  column(width = 6,
         plotlyOutput("plot_110_VariableGroup"),
         plotlyOutput("plot_111_Accept")
  ), ## close column1
  column(width = 6,
         plotlyOutput("plot_111_Verify"),
         plotlyOutput("plot_111_EnrollmentState")
  ) ## close column2
) ##close fluid row