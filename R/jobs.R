jobs <- function(projectCode){
  
  listJobsOps <- paste("projectCode=",projectCode,sep="")

  jobsURL <- paste("https://nyu-demo.survos.com/app_dev.php/api1.0/jobs?",listJobsOps,sep="")

  getJobsData <- GET(url=jobsURL, add_headers(Authorization=paste("Bearer ", accessToken, sep="")))
  
  jobsData = fromJSON(content(getJobsData,type="text"))
  
  as.data.frame(jobsData$items)
                 
}
