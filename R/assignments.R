assignments <- function(jobId, maxPerPage = "25"){
  
  # Set function options
  
  funcOps <<- paste("job_id=", jobId, "&max_per_page=", maxPerPage, sep="")
  
  # Define the API endpoint extension to match this function and any other endpoint params
  
 endPointParams(endPointExt="assignments?", endPointPages="&page=")
  
  #dplyr::bind_rows(dataReturn[1:length(dataReturn)])

}
