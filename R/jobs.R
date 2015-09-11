jobs <- function(projectCode){
  
  # Set function options
  
  funcOps <<- paste("project_code=", projectCode, sep="")

  # Define the API endpoint extension to match this function and any other endpoint params
  
  dataReturn <- endPointParams(endPointExt="jobs?", endPointPages="&page=")
  
  dplyr::bind_rows(dataReturn[1:length(dataReturn)])

}
