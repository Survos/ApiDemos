assignments <- function(maxPerPage, jobId, projectCode, waveId){
  
  # Set function options, accounting for missing options
  ifelse(missing(maxPerPage), maxPerPage <- paste("max_per_page=25"), maxPerPage <- paste("max_per_page=", maxPerPage, sep=""))
  
  ifelse(missing(jobId), jobId <- NA, jobId <- paste("&job_id=", jobId, sep=""))
  ifelse(missing(projectCode), projectCode <- NA, projectCode <- paste("&project_code=", projectCode, sep=""))
  ifelse(missing(waveId),  waveId <- NA, waveId <- paste("&wave_id=", waveId, sep=""))
  
  optsString <- ifelse(is.na(jobId), maxPerPage, paste(maxPerPage, jobId, sep=""))
  optsString <- ifelse(is.na(projectCode), optsString, paste(optsString, projectCode, sep=""))
  funcOps <<- ifelse(is.na(waveId), optsString, paste(optsString, waveId, sep=""))
  
  # Define the API endpoint extension to match this function and any other endpoint params
  
  endPointParams(endPointExt="assignments?", endPointPages="&page=")
  
}
