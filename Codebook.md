---
title: "Codebook"
author: "Robert Jones"
date: "14 August 2016"
output: html_document
---
#Getting and Cleaning Data Week 4 Assignment Code Book
##Objective
The objective of this document is  to describes the variables, the data, and any transformations or work that you performed to achive the tidy dataset as specified in the assignment brief. The brief is as follows:
  "You should create one R script called run_analysis.R that does the following.
  
  Merges the training and the test sets to create one data set.
  Extracts only the measurements on the mean and standard deviation for each measurement.
  Uses descriptive activity names to name the activities in the data set
  Appropriately labels the data set with descriptive variable names.
  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject"


##Sections
  - Downloaded Data
  - Data Import
  - Manipulation
  - Tidy dataset
  
##Downloaded Data
The dataset was downloaded using the download.file function from "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and saved as "assignment data.zip" in the following working director:
"D:\users\Z900057\Documents\RStudio\Getting and Cleaning Data Assignment"
 
Note: The url was changed from "http" from "https".

The downloaded file was unzipped using the "unzip" function to the following folder:
"D:\users\Z900057\Documents\RStudio\Getting and Cleaning Data Assignment\UCI HAR Dataset"

The data file comprises the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features (description of the measurements)

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set (training data measurements).

- 'train/y_train.txt': Training labels (activity label).

- 'train/subject_train.txt': Subject number row labels for training data.

- 'test/X_test.txt': Test set (test data measurements).

- 'test/y_test.txt': Test labels (activity label).

- 'train/subject_train.txt': Subject number row labels for training data.


The files in the "Test/Intertial Signals" and "Train/Intertial Signals" are not required for the assignment.

##Data Import
The data was imported from each respective folders using a custom function "collecttxt" which imports eachs txt file within the working directory to a variable of the same name. The function was applied to the following working directories:

- "~/RStudio/Getting and Cleaning Data Assignment/UCI HAR Dataset"

- "~/RStudio/Getting and Cleaning Data Assignment/UCI HAR Dataset/train"

- "~/RStudio/Getting and Cleaning Data Assignment/UCI HAR Dataset/test"

##Data Manipulation
1. Assign activity varible using "activity_label.txt" data to each data set "y_test.txt" and "y_train.txt"
2. Assign variabke names to "X_test.txt" and "y_test.txt" from "features.txt".
3. Assign varible name "subject" to "subject_test.txt" and "subject_train.txt".
4. Merge, using cbind, "subject_train.txt" (subject number),"y_train.txt[2]" (activity) and "X_train.txt" (feauture measurements). Repeat for test data equivilent.
5. Merge, using rbind, the test and training data sets from point 4, assign to "combined"
6. Subset "combined" for only standard deviation and mean features using subset (square brackets) and assign to "meanstd".
7. Re-attach (merge) the activity and subject column using rbind and assign to "finaldata".
8. Group "finaldata" data set by "activity" and "subject" variables with "group_by" function
9. Summarise data by groups in point 9 using "summarise_each" and "mean" function then assign to "subject summary"
10. Write "subjectsummary" to "tidydata.txt" using "write.table" function.

##Tidy dataset
The tidy dataset comprises the mean of each std and mean feature, broken down by subject and activity.

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean of mean(): Mean value
mean of std(): Standard deviation

