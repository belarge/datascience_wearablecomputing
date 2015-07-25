# Run_Analysis - Data Science Getting and Cleaning Data Assignment
# Read in Activity Codes
library(plyr)
library(dplyr)
#Read in Activity Codes Keys and Descriptions
ActivityCodes <- read.table("UCI HAR Dataset/activity_labels.txt",col.names = c("ActivityNumber","Activity"))
#Read in Feature Codes Keys and Descriptions
FeatureCodes <- read.table("UCI HAR Dataset/features.txt",col.names = c("FeatureIndex","FeatureName"), stringsAsFactors=FALSE)

#Read in Test Data Set
testData <- read.table("UCI HAR Dataset/test/X_test.txt",col.names=FeatureCodes$FeatureName)
testDataSubject <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names="SubjectID")
testDataActNum <- read.table("UCI HAR Dataset/test/y_test.txt",col.names="ActivityNumber")
#combine together all test data with Subject ID and Activity Names
testDataCombined <- cbind(testDataSubject,testDataActNum,testData)
#dim(testDataCombined)


#read in Train Data Set
trainData <- read.table("UCI HAR Dataset/train/X_train.txt",col.names=FeatureCodes$FeatureName)
trainDataSubject <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names="SubjectID")
trainDataActNum <- read.table("UCI HAR Dataset/train/y_train.txt",col.names="ActivityNumber")
#combine together all train data with Subject ID and Activity Names
trainDataCombined <- cbind(trainDataSubject,trainDataActNum,trainData)

#dim(trainDataCombined)

combinedData <- rbind(testDataCombined,trainDataCombined)
combinedData <- join(ActivityCodes,combinedData)

#

combinedDataCleaned <- select(combinedData,matches("subjectid|mean|std|Activity$"))
names(combinedDataCleaned)

aTidyDataSet <- ddply(combinedDataCleaned,.(SubjectID,Activity),summarise,
                      tBodyAccMag_Mean=mean(tBodyAccMag.mean..),tBodyAccMag_StDev=mean(tBodyAccMag.std..),
                      tGravityAccMag_Mean=mean(tGravityAccMag.mean..),tGravityAccMag_StDev=mean(tGravityAccMag.std..),
                      tBodyAccJerkMag_Mean=mean(tBodyAccJerkMag.mean..),tBodyAccJerkMag_StDev=mean(tBodyAccJerkMag.std..),
                      tBodyGyroMag_Mean=mean(tBodyGyroMag.mean..),tBodyGyroMag_StDev=mean(tBodyGyroMag.std..),
                      tBodyGyroJerkMag_Mean=mean(tBodyGyroJerkMag.mean..),tBodyGyroJerkMag_StDev=mean(tBodyGyroJerkMag.std..),
                  
                      fBodyAccMag_Mean=mean(fBodyAccMag.mean..),fBodyAccMag_StDev=mean(fBodyAccMag.std..),
                      fBodyBodyAccJerkMag_Mean=mean(fBodyBodyAccJerkMag.mean..),fBodyBodyAccJerkMag_StDev=mean(fBodyBodyAccJerkMag.std..),
                      fBodyBodyGyroMag_Mean=mean(fBodyBodyGyroMag.mean..),fBodyBodyGyroMag_StDev=mean(fBodyBodyGyroMag.std..),
                      fBodyBodyGyroJerkMag_Mean=mean(fBodyBodyGyroJerkMag.mean..),fBodyBodyGyroJerkMag_StDev=mean(fBodyBodyGyroJerkMag.std..)
)
write.table(aTidyDataSet,row.name=FALSE,file="wearableComputingCleanDataOutput.txt")