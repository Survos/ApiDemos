applicants <- function(action, id, comment, message){
  
  # Set function options
  funcOps <<- action
  
  # Set the body content
  body <- NULL
  body$id = id
  body$comment = comment
  body$message = message
  body <<- as.data.frame(body)
  
  # Define the API endpoint extension to match this function and any other endpoint params
  
  endPointParams(endPointExt="members/applicants/")
  
}
