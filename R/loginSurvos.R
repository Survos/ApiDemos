loginSurvos <- function(username, password, sslVerify = TRUE){
  
  credentials <- paste("username=",username,"&password=",password,sep="")
  
  headersLogin <- list('Accept' = 'application/json')
  
  loginReturn <- RCurl::postForm("https://nyu-demo.survos.com/app_dev.php/api1.0/security/login", .opts=list(postfields=credentials, httpheader=headersLogin, ssl.verifypeer = TRUE))
  
  authenticationKey <- jsonlite::fromJSON(loginReturn)
  
  # Assigning a global variable with <<- 
  
  accessToken <<- authenticationKey$accessToken

}

