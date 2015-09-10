users <- function(){
  
  # This first part is really only required so we know the total number of pages
  
  usersURL <- paste(endPoint,"users?",sep="")
  
  getUsersData <- GET(url=usersURL, add_headers(Authorization=paste("Bearer ", accessToken, sep="")))
  
  usersData = fromJSON(content(getUsersData,type="text"))
  
  # Everything below here deals with returning data across all pages. 
  # TODO: This could probably be made a generic function for the package, used across all other functions
  
  for (i in 1:usersData$pages) { 
    
    usersURL[i] <- as.list(paste(endPoint,"/users?page=",i,sep=""))
    
  }
  
  getUsersData <- lapply(usersURL, function(x) GET(url=x, add_headers(Authorization=paste("Bearer ", accessToken, sep=""))))
  
  usersData = lapply(getUsersData, function(x) fromJSON(content(x,type="text", flatten = TRUE)))
  
  usersData <- lapply(usersData, '[[', 'items' )
  
  dplyr::bind_rows(usersData[1:length(usersData)])
  
}
  

