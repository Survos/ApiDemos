applicants <- function(projectCode, maxPerPage = "25", pii = "0"){
  
  # Set function options
  funcOps <<- paste("project_code=",projectCode, "&max_per_page=", maxPerPage, "&PII=", pii, "&criteria[enrollment_status_code]=applicant", sep="")
  
  # Define the API endpoint extension to match this function and any other endpoint params
  
  endPointParams(endPointExt="members?", endPointPages="&page=")

}
