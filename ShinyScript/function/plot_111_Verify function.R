plot_111_Verify <- function(DEPT){
  z <- readRDS(paste0("data/useData_4_",DEPT,".rds"))
  z <- as.data.frame(z,stringsAsFactors = F)
  plotData <- table(z$V4,z$V3)
  colnames(plotData) <- paste0("MatchingLevel ",colnames(plotData),"")
  
  PlotDT <- data.frame("V3" = colnames(plotData),
                       "V4" = plotData["TRUE",])
  fig <- plot_ly(PlotDT,x = ~V3,y = ~V4,text = ~V4,type = "bar") # FF4040
  fig <- fig %>% layout(title = list(text =  paste0("111_",DEPT,"_MatchingLevel Enrollment"),y = 0.96),
                        xaxis = list(title = ""),
                        yaxis = list(title = ""))
  # fig
  output <- paste0("MatchingLevel vs Enrollment： ", round(sum(PlotDT$V4[c(4,5)])/sum(PlotDT$V4[c(1,2)]),2))
  return(list('figure' = fig,
              'performance' = output,
              'NumberOfStudent' = sum(PlotDT$V4,na.rm = T)))
}
