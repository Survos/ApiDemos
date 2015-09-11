loginSurvos <- function(username, password, sslVerify = TRUE){

  credentials <- paste("username=",username,"&password=",password,sep="")
  
  headersLogin <- list('Accept' = 'application/json')
  
  loginReturn <- RCurl::postForm(paste(endPoint,"security/login", sep=""), .opts=list(postfields=credentials, httpheader=headersLogin, ssl.verifypeer = TRUE))
  
  authenticationKey <- jsonlite::fromJSON(loginReturn)
  
  # Assigning a global variable with <<- 
  
  accessToken <<- authenticationKey$accessToken

}
