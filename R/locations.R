locations <- function(projectCode, memberId, startDate = "2015-01-01"){
  
  listLocationsOps <- paste("project_code=",projectCode, "member_id=", memberId, "start_date=", startDate, sep="")
  
  locationsURL <- paste("https://nyu-demo.survos.com/app_dev.php/api1.0/locations?",listLocationsOps,sep="")
  
  getLocationsData <- GET(url=locationsURL, add_headers(Authorization=paste("Bearer ", accessToken, sep="")))
  
  locationsData = fromJSON(content(getLocationsData,type="text"))
  
  as.data.frame(locationsData$items)
  
}
