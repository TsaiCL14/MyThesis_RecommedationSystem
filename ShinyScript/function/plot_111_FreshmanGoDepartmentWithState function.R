plot_111_FreshmanGoDepartmentWithState <- function(DEPT,UNIV,STATE){
  useData <- readRDS("data/useData_3.rds")
  DeptData <- useData[which(useData$V2 == DEPT),]
  plotData <- DeptData
  plotData <- plotData[which(plotData$V7 == "Y"),]
  plotData <- plotData[-which(plotData$V8 == "unit_1"& plotData$V9 == DEPT),]
  plotData <- plotData[which(plotData$V8 == UNIV),]
  plotData$"V12" <- NA
  for(i in 1:dim(plotData)[1]){
    storage <- DeptData[which(DeptData$V5 == plotData$V5[i]),]
    if(grepl("A",storage$V10[which(storage$V8 == "unit_1" & storage$V9 == DEPT)])){ plotData$V12[i] <- "A"}
    if(grepl("W",storage$V10[which(storage$V8 == "unit_1" & storage$V9 == DEPT)])){ plotData$V12[i] <- "W"}
    if(!grepl("A|W",storage$V10[which(storage$V8 == "unit_1" & storage$V9 == DEPT)])){ plotData$V12[i] <- "N"}
  }
  if(STATE != "Chooseless"){ plotData <- plotData[which(plotData$V12 == STATE),] }
  plotDT <- plotData
  plotDT <- sort(table(plotDT$V9))
  plotDT <- as.data.frame(plotDT)
  if(dim(plotDT)[1] != 1){
    names(plotDT) <- c("DEPT","COUNT")
  }
  if(dim(plotDT)[1] == 1){
    plotDT <- data.frame("DEPT" = rownames(plotDT),
                         "COUNT" = plotDT$plotDT)
  }
  
  fig <- plot_ly(plotDT,x = ~DEPT,y = ~COUNT,text = ~COUNT,
                 type = "bar")
  fig <- fig %>% layout(xaxis = list(title = "",tickangle= -45))
  fig
  
}
