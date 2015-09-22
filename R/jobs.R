jobs <- function(projectCode, maxPerPage = "25"){
  
  # Set function options, accounting for missing options
  ifelse(missing(maxPerPage), maxPerPage <- paste("max_per_page=25"), maxPerPage <- paste("max_per_page=", maxPerPage, sep=""))

  ifelse(missing(projectCode), projectCode <- NA, projectCode <- paste("&project_code=", projectCode, sep=""))

  funcOps <<- ifelse(is.na(projectCode), maxPerPage, paste(maxPerPage, projectCode, sep=""))

  # Define the API endpoint extension to match this function and any other endpoint params
  
  dataReturn <- endPointParams(endPointExt="jobs?", endPointPages="&page=")
  
  dplyr::bind_rows(dataReturn[1:length(dataReturn)])

}
