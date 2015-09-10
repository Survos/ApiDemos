jobs <- function(projectCode){
  
  listJobsOps <- paste("project_code=",projectCode,sep="")

  jobsURL <- paste(endPoint,"jobs?",listJobsOps,sep="")

  getJobsData <- GET(url=jobsURL, add_headers(Authorization=paste("Bearer ", accessToken, sep="")))
  
  jobsData = fromJSON(content(getJobsData,type="text"))
  
  as.data.frame(jobsData$items)
                 
}
