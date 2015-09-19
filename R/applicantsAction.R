applicantsAction <- function(action, id, comment, message){
  
  # Set function options
  funcOps <<- action
  
  # Set the body content
  msgBody <- NULL
  msgBody$id = id
  msgBody$comment = comment
  msgBody$message = message
  msgBody <<- as.data.frame(msgBody)
  
  # Define the API endpoint extension to match this function and any other endpoint params
  
  endPointParams(endPointExt="members/applicants/")
  
}
