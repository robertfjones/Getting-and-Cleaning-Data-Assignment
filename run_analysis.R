#Load libraries
library(dplyr)

#Download and unzip data
download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "assignment data.zip")
unzip("assignment data.zip")

#Setup working directory
oldwd <- getwd()
setwd("~/RStudio/Getting and Cleaning Data Assignment/UCI HAR Dataset")
folders <- list.dirs()


#Custom function to collect data from files
collecttxt <- function(files){
  tfiles <- currentfiles[grep("txt",files)] #only import text files.
  for (f in tfiles) {
    print(paste("Importing",f))
    assign(f,read.table(f), pos = .GlobalEnv)
  }
}

#Collect data from text files

setwd("~/RStudio/Getting and Cleaning Data Assignment/UCI HAR Dataset")
currentfiles <- list.files() #only first two files are required
collecttxt(currentfiles[1:2])

setwd("~/RStudio/Getting and Cleaning Data Assignment/UCI HAR Dataset/train")
currentfiles <- list.files()
collecttxt(currentfiles)

setwd("~/RStudio/Getting and Cleaning Data Assignment/UCI HAR Dataset/test")
currentfiles <- list.files()
collecttxt(currentfiles)

#Get activity labels and apply to y data
y_test.txt$activity <- activity_labels.txt[y_test.txt$V1,2]
y_train.txt$activity <- activity_labels.txt[y_train.txt$V1,2]

#Apply variable decsriptors
names(X_test.txt) <- features.txt$V2
names(X_train.txt) <- features.txt$V2
names(subject_test.txt) <- "subject"
names(subject_train.txt) <- "subject"

#Merge Data Sets using column bind
train <- cbind(subject_train.txt,y_train.txt[2],X_train.txt)
test <- cbind(subject_test.txt,y_test.txt[2],X_test.txt)

train$source <- "train"
test$source <- "test"

combined <- rbind(train,test)

#extract mean and standard deviation
meanstd <- combined[grep("mean|std",names(combined))]

#Re-attach subject and activity
finaldata <- cbind(combined[1:2],meanstd)

#Group data
groupeddata <- group_by(finaldata, subject,activity)

#Summarise with mean based on group
datasummary <- summarise_each(groupeddata, funs(mean))
newnames <- c(names(datasummary[1:2]),paste0("mean.of.'",names(datasummary[-(1:2)]),"'"))
names(datasummary) <- newnames

#Change directory for writing of tidy data. 
setwd("~/RStudio/Getting and Cleaning Data Assignment/")

write.table(datasummary,"tidydata.txt", row.names = FALSE)

