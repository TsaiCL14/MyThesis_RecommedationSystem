
makeText_111 <- function(DEPT){
  
  x <- readRDS("data/useData_3.rds")
  z <- x[which(x$V9 ==DEPT),]
  newZ <- z[which(z$V8 == "unit_1" & z$V9 == DEPT),]
  NumberOfSignUp <- length(unique(z$V5))
  source("ShinyScript/function/plot_111_Accept function.R",encoding = 'utf-8')
  NumberOfEnrollment <- plot_111_Accept(DEPT)[[3]]
  source("ShinyScript/function/plot_111_Verify function.R",encoding = 'utf-8')
  NumberOfAccept <- plot_111_Verify(DEPT)[[3]]
  return(list(
    'SignUp' = paste0('SignUp： ',NumberOfSignUp),
    'Enrollment' = paste0('Enrollment： ',NumberOfEnrollment),
    'Accept' = paste0('Accept： ',NumberOfAccept)
  ))
}
