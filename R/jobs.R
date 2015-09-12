jobs <- function(projectCode, maxPerPage = "25"){
  
  # Set function options
  
  funcOps <<- paste("project_code=", projectCode, "&max_per_page=", maxPerPage, sep="")

  # Define the API endpoint extension to match this function and any other endpoint params
  
  dataReturn <- endPointParams(endPointExt="jobs?", endPointPages="&page=")
  
  dplyr::bind_rows(dataReturn[1:length(dataReturn)])

}
