assignments <- function(jobId){
  
  listAssignmentsOps <- paste("job_id=",jobId,sep="")
  
  assignmentsURL <- paste("https://nyu-demo.survos.com/app_dev.php/api1.0/assignments?", listAssignmentsOps, sep="")
  
  getAssignmentsData <- GET(url=assignmentsURL, add_headers(Authorization=paste("Bearer ", accessToken, sep="")))
  
  assignmentsData = fromJSON(content(getAssignmentsData,type="text"))
  
  as.data.frame(assignmentsData$items)
  
}
