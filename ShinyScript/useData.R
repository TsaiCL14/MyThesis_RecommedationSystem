department <- list.files("data/")
department <- department[grep("useData_4",department)]
## part1
z <- strsplit(department,"useData_4_")
z <- lapply(z,function(w){
  w[2]
})
z <- unlist(z)
## part2
z <- strsplit(z,".rds")
z <- lapply(z,function(w){
  w[1]
})
z <- unlist(z)
## order
seat <- unlist(lapply(strsplit(z,"111_"),function(w){
  w[2]
}))
## back department
department <- z[order(as.numeric(seat))]
