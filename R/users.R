users <- function(){
  
  # Set function option
  # None to be set for this function
  
  # Define the API endpoint extension to match this function and any other endpoint params
  
  dataReturn <- endPointParams(endPointExt="users?", endPointPages="users?page=")

  dplyr::bind_rows(dataReturn[1:length(dataReturn)])

}

  

