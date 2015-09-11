assignments <- function(jobId){
  
  # Set function options
  
  funcOps <- paste("job_id=", jobId, sep="")
  
  # Define the API endpoint extension to match this function and any other endpoint params
  
 endPointParams(endPointExt="assignments?", endPointPages="assignments?page=")
  
  #dplyr::bind_rows(dataReturn[1:length(dataReturn)])

}