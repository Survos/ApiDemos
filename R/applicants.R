applicants <- function(maxPerPage = "25"){
  
  # Set function options
  funcOps <<- paste("max_per_page=", maxPerPage, sep="")
  
  # Define the API endpoint extension to match this function and any other endpoint params
  
  dataReturn <- endPointParams(endPointExt="members/applicants?", endPointPages="&page=")
  
  # Make the return pretty by un-nesting.
  
  firstFiveCols <- as.data.frame(dataReturn)
  
  lastTwoCols <- as.data.frame(firstFiveCols$submitted)
  
  firstFiveCols <- firstFiveCols[,c(1:5)]
  
  cbind(firstFiveCols,lastTwoCols)

}
