# This function defines common methods for connecting to the Survos API endpoints,
# extracting initial data, then looping through all available pages if required.

endPointParams <- function(endPointExt, endPointPages){
  
  # Define funcOps or it won't be found
  funcOps <- NULL
  
  # This first part is really only required so we know the total number of pages
  
  url <- paste(endPoint, endPointExt, funcOps, sep="")
  
  getData <- httr::GET(url=url, add_headers(Authorization=paste("Bearer ", accessToken, sep="")))
  
  dataReturn <- jsonlite::fromJSON(content(getData,type="text"))
  
  # Everything below here deals with returning data across all pages. 
  # If more than one page found, iterate through them, else just return the single page's items
  
 # if (dataReturn$pages > 1){
    
  for (i in 1:dataReturn$pages) { 
    
    url[i] <- as.list(paste(endPoint, endPointPages, i, funcOps ,sep=""))
    
  }
  
  getData <- lapply(url, function(x) httr::GET(url=x, add_headers(Authorization=paste("Bearer ", accessToken, sep=""))))
  
  dataReturn <- lapply(getData, function(x) jsonlite::fromJSON(content(x,type="text", flatten = TRUE)))
  
  lapply(dataReturn, '[[', 'items' )
  
}