locations <- function(projectCode, memberId, maxPerPage = "25"){
  
  # Set function options

  funcOps <<- paste("project_code=",projectCode, "&member_id=", memberId, "&max_per_page=", maxPerPage, sep="")

  # Define the API endpoint extension to match this function and any other endpoint params
  
  endPointParams(endPointExt="locations?", endPointPages="&page=")
  
  #dplyr::bind_rows(dataReturn[1:length(dataReturn)])
  
}
