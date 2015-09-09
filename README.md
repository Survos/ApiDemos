# Platform API for R

R Package for access the Survos Platform API.

The package "survos" now installs as an R package. 

The package "devtools" must be installed first.

Please use the following to install the package:

```R
devtools::install_github("survos/platform-api-r")
```

The DESCRIPTION file contains library requirements and installation will check for this automatically. They are:

    RCurl (>= 1.95-4.7)
    jsonlite (>= 0.9.17)
    curl (>= 0.9.3)

I needed to comment out all other code in other files, e.g. mcsd.R, for the build to work. Please keep this in mind if pushing changes to non-package files to the repository (or move them to a different repository, or move this package to a different repository).

Once installed, the following R script logs in and returns data from the "jobs" endpoint:

```R

firstTime <- true
if (firstTime) {
  install.packages('devtools')
  devtools::install_github("survos/platform-api-r")
}

library("survos")

loginSurvos(username = "YourUserNameHere", password = "YourPasswordHere", style = "POST")

jobsFrame <- jobs(projectCode = "nyu_demo", page = "1")
```

All the jobs data can now be accessed through the variable "jobsFrame".


