#install.packages('Hmisc')
#install.packages("jsonlite", repos="http://cran.r-project.org")
#install.packages('curl')
#install.packages('RCurl')
#install.packages("httr")
 
# json examples
#   http://www.r-bloggers.com/new-package-jsonlite-a-smarter-json-encoderdecoder/

#load
#library(jsonlite)
#library(RCurl)
#library(httr)

REST_ENDPOINT <- "https://nyu-demo.survos.com/app_dev.php/api1.0/"
url <- paste(REST_ENDPOINT, "security/login", sep="")

cmap <- postForm(url, username="username", password="password", style="POST")

x <- fromJSON(cmap)
accessToken = x$accessToken
accessToken
url <- paste(REST_ENDPOINT, 'jobs', sep="")
url <- paste(url, "?projectCode=nyu_demo&page=1", sep="")
cmap <- ''
getData <- GET(url=url,
            add_headers(Authorization=paste("Bearer ", accessToken, sep=""))
)
x = fromJSON(content(getData,type="text"))
x$page
x$`_embedded`
x$`_embedded`$items

myjson <- fromJSON(cmap, pretty = TRUE)

getdata<-GET(url=query, add_headers(Authorization="bearer <your api key>"))
fromJSON(content(getdata,type="text"))



POST(url="", config=add_headers(
  c('Host="nyu-demo.survos.com"',
    'User-Agent="R"',
    'Authorization="Basic MyKeyandSecretBase64Encoded"',
    'Content-Type="application/x-www-form-urlencoded;charset=UTF-8"',
    'Content-Length="29"',
    'Accept-Encoding="gzip"')), body="grant_type=client_credentials")


#convert object to json
myjson <- toJSON(iris, pretty=TRUE)
cat(myjson)

users <- fromJSON("http://pano.l.survos.com/app_dev.php/api/users?_format=json")
names(users)
data1 <- fromJSON("https://api.github.com/users/hadley/orgs")
panos <- fromJSON("http://pano.l.survos.com/app_dev.php/api/panos?_format=json&page=1")
names(panos)

#it's a data frame
names(data1)
data1$login

#convert json back to object
iris2 <- fromJSON(myjson)
print(iris2)

library(Hmisc)

setwd("/var/www/Posse/x/")
mcsds<- read.csv("turk_job_mcsds_assignments.csv", stringsAsFactors=F)
mcsds<- subset(mcsds, AssignmentStatusCode=="Submitted", select=c(MemberCode, Id, AcceptTime, SubmitTime,Score,
                                                                  q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, 
                                                                  q11, q12, q13, q14, q15, q16, q17, q18, 
                                                                  q19, q20, q21, q22, q23, q24, q25, q26, 
                                                                  q27, q28, q29, q30, q31, q32, q33))
describe(mcsds[,5:37])

score <- density(mcsds$Score)
plot(score, main="Density Plot of MCSDS Survey Score")

