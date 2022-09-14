
plot_111_FreshmanGoUniversity <- function(DEPT){
  useData <- readRDS("data/useData_3.rds")
  DeptData <- useData[which(useData$V2 == DEPT),]
  plotData <- DeptData
  plotData <- plotData[which(plotData$V7 == "Y"),]
  plotData$"V12" <- NA
  for(i in 1:dim(plotData)[1]){
    storage <- DeptData[which(DeptData$V5 == plotData$V5[i]),]
    storage[which(storage$V8 == "unit_1" & storage$V9 == DEPT),]
    storage$V10[which(storage$V8 == "unit_1" & storage$V9 == DEPT)]
    if(grepl("A",storage$V10[which(storage$V8 == "unit_1" & storage$V9 == DEPT)])){ plotData$V12[i] <- "A"}
    if(grepl("W",storage$V10[which(storage$V8 == "unit_1" & storage$V9 == DEPT)])){ plotData$V12[i] <- "W"}
    if(!grepl("A|W",storage$V10[which(storage$V8 == "unit_1" & storage$V9 == DEPT)])){ plotData$V12[i] <- "N"}
  }
  plotData <- plotData[-which(plotData$V8 == "unit_1" & plotData$V9 == DEPT),]
  plotDT <- table(plotData$V8,plotData$V12)
  plotDT <- cbind(plotDT,apply(plotDT,1,sum))
  plotDT <- plotDT[order(plotDT[,dim(plotDT)[2]]),]
  plotDT <- data.frame("college" = rownames(plotDT),
                       "Accept" = plotDT[,"A"],
                       "Wait" = plotDT[,"W"],
                       "N_Accept" = plotDT[,"N"],stringsAsFactors = F)
  fig <- plot_ly(plotDT,type = "bar") # FF4040
  fig <- fig %>% add_trace(x = ~college,y = ~Accept,text = ~Accept, name = 'Accept')
  fig <- fig %>% add_trace(x = ~college,y = ~Wait,text = ~Wait, name = 'Wait')
  fig <- fig %>% add_trace(x = ~college,y = ~N_Accept,text = ~N_Accept, name = 'N Accept')
  fig <- fig %>% layout(yaxis = list(title = 'Count'), barmode = 'stack')
  fig <- fig %>% layout(title = list(text = paste0(DEPT," Where Go"),y = 0.96),
                        xaxis = list(title = ""),
                        yaxis = list(title = ""))

  return(list("figure" =fig,
              'name' = plotDT$college[length(plotDT$college):1]))
}

