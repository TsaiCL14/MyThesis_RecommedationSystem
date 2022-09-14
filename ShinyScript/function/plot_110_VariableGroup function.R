
plot_110_VariableGroup <- function(DEPT){
  library(plotly)
  FCU_department <- readRDS("data/useData_1.rds")
  FCU_department <- as.data.frame(FCU_department,stringsAsFactor = F)
  z <- readRDS("data/useData_2.rds")
  useDEPT <- FCU_department$V3[which(FCU_department[,1] == DEPT,)]
  plotData <- z[[useDEPT]]
  colnames(plotData) <- paste0("MatchingLavel ",colnames(plotData),"")
  PlotDT <- data.frame("MatchingLevel" = colnames(plotData),
                       "Enrollment" = plotData["TRUE",])
  fig <- plot_ly(PlotDT,x = ~MatchingLevel,y = ~Enrollment,text = ~Enrollment,type = "bar") # FF4040
  fig <- fig %>% layout(title = list(text = paste0("110_",useDEPT,"_BestVariableGroup"),y = 0.96),
                        xaxis = list(title = ""),
                        yaxis = list(title = ""))
  output <- paste0("BestVariableGroup： ", round(sum(PlotDT$Enrollment[c(4,5)])/sum(PlotDT$Enrollment[c(1,2)]),2))
  return(list('figure' = fig,
              'performance' = output))
  
}
