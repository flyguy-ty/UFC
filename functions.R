columnCleaner <- function(td, index) {
  varvec <- ""
  for (i in seq(index, 120, by=10)) {
    varvec <- c(varvec,unlist(strsplit(td[i], "\n")))
  }
  
  varvec <- varvec[varvec != ""]
  
  return(varvec)
}

names <- columnCleaner(td, 2)
