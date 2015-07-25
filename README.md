# datascience_wearablecomputing 
#Coursera Getting and Cleaning Data - Wearable Computing Assignment

This script reads in the UCI HAR Dataset to perform analytics regarding Wearable Computing. 

The data required for this script can be found from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
An Explanation of the original data can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The output variables are:

SubjectID - Number from 1 to 30       
Activity - String with Values [LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS]

Mean (_Mean) and Standard Deviations (_StDev) for the below Time Domain Variables

 tBodyAccMag

 tGravityAccMag

 tBodyAccJerkMag

 tBodyGyroMag

 tBodyGyroJerkMag

Mean (_Mean) and Standard Deviations (_StDev) for the below Frequency Domain Variables

 fBodyAccMag

 fBodyBodyAccJerkMag

 fBodyBodyGyroMag_Mean

 fBodyBodyGyroJerkMag
 
 The script combines together a number of data sources to create a data output structure that includes all the relevant information. The script then uses ddply to apply mean operations to the variables of interest. 