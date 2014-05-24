Create one R script called run_analysis.R that does the following. 
 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Instructions:

- Clone this repository and download the dataset
- Measurements are in X_train.txt and X_test.txt
- Subject info is in subject_train.txt and subject_test.txt
- Activities are present in y_train.txt and y_test.txt
- setwd("path_to_your_downloaded_folder/UCI HAR Dataset") Set current directory to the UCI HAR Dataset.
- Run the script called run_analysis.R > source("run_analysis.R")
- You will get a tidy data set called dataset_averages.txt in your working directory
- the columns are renamed to contain the mean and std
- read.table("dataset_averages.txt")  to open the file


comments on how the script works are written in the run_analysis.R

source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

