members <- function(projectCode, maxPerPage = "25", pii = "0"){
  
  
  # Set function options, accounting for missing options
  ifelse(missing(maxPerPage), maxPerPage <- paste("max_per_page=25"), maxPerPage <- paste("max_per_page=", maxPerPage, sep=""))
  
  ifelse(missing(projectCode), projectCode <- NA, projectCode <- paste("&project_code=", projectCode, sep=""))
  ifelse(missing(pii), pii <- NA, pii <- paste("&pii=", pii, sep=""))
  
  optsString <- ifelse(is.na(pii), maxPerPage, paste(maxPerPage, pii, sep=""))
  funcOps <<- ifelse(is.na(projectCode), optsString, paste(optsString, projectCode, sep=""))
  
  # Define the API endpoint extension to match this function and any other endpoint params
  
  endPointParams(endPointExt="members?", endPointPages="&page=")
  
}
