library(devtools)
library(roxygen2)
library(readr)
library(tidyverse)

getwd()
dir()
devtools::create("KangSecondTools")
dir("KangSecondTools")

location <- paste(getwd(),"KangSecondTools", sep="/")
descLoc <- paste(location, "DESCRIPTION", sep="/")
desc <- readLines(descLoc)
desc[grep("Title",desc)]<-"Title: KangSecondTools"
desc[grep("Authors",desc)]<-"Authors@R: person(\"HanGyu\", \"Kang\", email = \"kangx478@umn.edu\", role = c(\"aut\", \"cre\"))"
desc[grep("Description",desc)]<-"Description: This is an package for Homework3"
desc[grep("License",desc)]<-"License: file LICENSE"
writeLines(desc,con="KangSecondTools/DESCRIPTION")
write_file(x="YEAR: 2018 COPYRIGHT HOLDER: HanGyu Kang", path = paste(location, "LICENSE", sep="/"))

setwd(location)
d <- read_csv("http://users.stat.umn.edu/~almquist/3811_examples/gapminder2007ex.csv")
devtools::use_data(d,pkg=location)
write_file(x="
           #' This is data which is included in package, KangHanGyutools
           #'
           #' @author HanGyu Kang \\email{kangx478@umn.edu}
           #' @reference \\url{http://users.stat.umn.edu/~almquist/3811_examples/gapminder2007ex.csv}
           \"d\" ",path=paste(location, "R", "data.R", sep="/"))
d2 <- read_csv("http://www.stat.umn.edu/geyer/3701/data/growth.csv")
devtools::use_data(d2,pkg=location)
write_file(x="
           #' This is second data which is included in package, KangHanGyutools
           #' 
           #' @author HanGyu Kang \\email{kangx478@umn.edu}
           #' @reference \\url{http://www.stat.umn.edu/geyer/3701/data/growth.csv}
           \"d\" ",path=paste(location, "R", "data.R", sep="/"))
d3 <- read_csv("http://www.stat.umn.edu/geyer/3701/data/array-ex1.csv")
devtools::use_data(d3,pkg=location)
write_file(x="
           #' This is third data which is included in package, KangHanGyutools
           #' 
           #' @author HanGyu Kang \\email{kangx478@umn.edu}
           #' @reference \\url{http://www.stat.umn.edu/geyer/3701/data/array-ex1.csv}
           \"d\" ",path=paste(location, "R", "data.R", sep="/"))
devtools::document(location)

file.copy(paste(getwd(),"RFunctionForPackage2.R",sep="/"), paste(location,"R",sep="/"))
file.rename(paste(location,"R","RFunctionForPackage2.R",sep ="/"), paste(location, "R", paste("KangSecondTools", "Rfunctions2.R", sep=""),sep = "/"))
devtools::document(location)

file.copy(paste(getwd(),"RfunctionWdependencies2.R",sep="/"), paste(location,"R",sep="/"))
file.rename(paste(location,"R","RFunctionWdependencies2.R",sep ="/"), paste(location, "R", paste("KangSecondTools", "geeggmeandata2.R", sep=""),sep = "/"))
devtools::document(location)

use_testthat(location)

file.copy(paste(getwd(), "UnitTestForRfunctions2.R",sep="/"), paste(loc, "tests","testthat",sep="/"))
file.rename(paste(location,"tests","testthat","UnitTestForRfunctions2.R",sep="/"),paste(loc,"tests","functions.R",paste("KangSecondTools","fun",sep=""),sep="/"))

use_package("ggplot2",pkg=location)

devtools::check(location)
devtools::build(location)            

use_package_doc(location)
devtools::document(location)
devtools::use_vignette("KangSecondTool Package Vignette",pkg=location)
devtools::check(location)
devtools::build(location)
devtools::install()
