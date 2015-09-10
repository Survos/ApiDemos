assignments <- function(jobId){
  
  listAssignmentsOps <- paste("job_id=",jobId,sep="")
  
  assignmentsURL <- paste(endPoint,"assignments?", listAssignmentsOps, sep="")
  
  getAssignmentsData <- GET(url=assignmentsURL, add_headers(Authorization=paste("Bearer ", accessToken, sep="")))
  
  assignmentsData = fromJSON(content(getAssignmentsData,type="text"))
  
  as.data.frame(assignmentsData$items)
  
}
