

plot_111_Accept <- function(DEPT){
  z <- readRDS(paste0("data/useData_4_",DEPT,".rds"))
  plotData <- table(z$V5,z$V3)
  colnames(plotData) <- paste0("MatchingLevel ",colnames(plotData),"")
  PlotDT <- data.frame("MatchingLevel" = colnames(plotData),
                       "Accept" = plotData["TRUE",])
  fig <- plot_ly(PlotDT,x = ~MatchingLevel,y = ~Accept,text = ~Accept,type = "bar") # FF4040
  fig <- fig %>% layout(title = list(text = "111_MatchingLevel Accept",y = 0.96),
                        xaxis = list(title = ""),
                        yaxis = list(title = ""))
  # fig
  output <- paste0("MatchingLevel vs Accept： ", round(sum(PlotDT$Accept[c(4,5)])/sum(PlotDT$Accept[c(1,2)]),2))
  return(list('figure' = fig,
              'performance' = output,
              'NumberOfStudent' = sum(PlotDT$Accept,na.rm = T)))
}

