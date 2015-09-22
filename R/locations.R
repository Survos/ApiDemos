locations <- function(projectCode, memberId, startDate, maxPerPage = "25"){
  
  # Set function options, accounting for missing options
  ifelse(missing(maxPerPage), maxPerPage <- paste("max_per_page=25"), maxPerPage <- paste("max_per_page=", maxPerPage, sep=""))
  
  ifelse(missing(memberId), memberId <- NA, memberId <- paste("&member_id=", memberId, sep=""))
  ifelse(missing(projectCode), projectCode <- NA, projectCode <- paste("&project_code=", projectCode, sep=""))
  ifelse(missing(startDate),  startDate <- NA, startDate <- paste("&start_date=", startDate, sep=""))
  
  optsString <- ifelse(is.na(memberId), maxPerPage, paste(maxPerPage, memberId, sep=""))
  optsString <- ifelse(is.na(projectCode), optsString, paste(optsString, projectCode, sep=""))
  funcOps <<- ifelse(is.na(startDate), optsString, paste(optsString, startDate, sep=""))

  # Define the API endpoint extension to match this function and any other endpoint params
  
  endPointParams(endPointExt="locations?", endPointPages="&page=")
  
  #dplyr::bind_rows(dataReturn[1:length(dataReturn)])
  
}
