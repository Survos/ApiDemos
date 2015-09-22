cartomap <- function(maxPerPage = "25"){
  
  # Set function option
  funcOps <<- paste("&max_per_page=", maxPerPage, sep="")
  
  # Define the API endpoint extension to match this function and any other endpoint params
  
  dataReturn <- endPointParams(endPointExt="cartomap?", endPointPages="&page=")

  #dplyr::bind_rows(dataReturn[1:length(dataReturn)])

}

