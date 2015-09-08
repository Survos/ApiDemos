assignments <- function(job_id, wave_id, wave_ids, page, paginate, sslVerify = TRUE){
  
  assignmentsURL <- paste("https://nyu-demo.survos.com/app_dev.php/api1.0/assignments?",sep="")
  
  getAssignmentsData <- GET(url=assignmentsURL, add_headers(Authorization=paste("Bearer ", accessToken, sep="")))
  
  assignmentsData = fromJSON(content(getAssignmentsData,type="text"))
  
}
