locations <- function(projectCode){
  
  listLocationsOps <- paste("projectCode=",projectCode,sep="")
  
  locationsURL <- paste("https://nyu-demo.survos.com/app_dev.php/api1.0/locations?",listLocationsOps,sep="")
  
  getLocationsData <- GET(url=locationsURL, add_headers(Authorization=paste("Bearer ", accessToken, sep="")))
  
  locationsData = fromJSON(content(getLocationsData,type="text"))
  
  as.data.frame(locationsData$`_embedded`[1])
  
}


