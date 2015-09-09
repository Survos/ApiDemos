users <- function(){
  
  usersURL <- paste("https://nyu-demo.survos.com/app_dev.php/api1.0/users?",sep="")
  
  getUsersData <- GET(url=usersURL, add_headers(Authorization=paste("Bearer ", accessToken, sep="")))
  
  usersData = fromJSON(content(getUsersData,type="text"))
  
  for (i in 1:usersData$pages) {
    
    usersURL[i] <- as.list(paste("https://nyu-demo.survos.com/app_dev.php/api1.0/users?page=",i,sep=""))

  }
  
  getUsersData <- lapply(usersURL, function(x) GET(url=x, add_headers(Authorization=paste("Bearer ", accessToken, sep=""))))
  
  usersData = lapply(getUsersData, function(x) fromJSON(content(x,type="text")))
  
  newUsersData <- lapply(usersData, '[[', 'items' )
  
  #newnewUsersData <- lapply(newUsersData, '[[', 'id' )
  
  #newnewnewUsersData <- data.frame(unlist(newnewUsersData))
  
  #newnewnewusersData <- dplyr::bind_rows(lapply(usersData, function(x) unlist(x)))
    
  #as.data.frame(usersData$items)
  #as.data.frame(usersData)
  
}
  

