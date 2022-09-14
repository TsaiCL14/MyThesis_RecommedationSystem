
plot_111_EnrollmentState <- function(DEPT){
  z <- readRDS(paste0("data/useData_4_",DEPT,".rds"))
  plotData <- table(z$V6,z$V3)
  colnames(plotData) <- paste0("MatchingLevel ",colnames(plotData),"")
  PlotData <- data.frame("V3" = colnames(plotData),stringsAsFactors = F)
  if(any(rownames(plotData) == "State1")){PlotData <- cbind(PlotData,"State1" = plotData["State1",])}
  if(any(rownames(plotData) == "State2")){PlotData <- cbind(PlotData,"State2" = plotData["State2",])}
  if(any(rownames(plotData) == "State3")){PlotData <- cbind(PlotData,"State3" = plotData["State3",])}
  fig <- plot_ly(PlotData,type = "bar") # FF4040
  fig <- fig %>% add_trace(x = ~V3,y = ~State1,text = ~State1, name = 'State1')
  if(any(rownames(plotData) == "State2")){
    fig <- fig %>% add_trace(x = ~V3,y = ~State2,text = ~State2, name = 'State2')
  }
  if(any(rownames(plotData) == "State3")){
    fig <- fig %>% add_trace(x = ~V3,y = ~State3,text = ~State3, name = 'State3')
  }
  fig <- fig %>% layout(yaxis = list(title = 'Count'), barmode = 'stack')
  fig <- fig %>% layout(title = list(text = paste0("111_MatchingLevel_",DEPT,"_Enrollment State"),y = 0.96),
                        xaxis = list(title = ""),
                        yaxis = list(title = ""))
  fig
  
}
