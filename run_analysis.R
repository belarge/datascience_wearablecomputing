# Run_Analysis - Data Science Getting and Cleaning Data Assignment
# Read in Activity Codes
library(plyr)
library(dplyr)
ActivityCodes <- read.table("UCI HAR Dataset/activity_labels.txt",col.names = c("ActivityNumber","Activity"))
FeatureCodes <- read.table("UCI HAR Dataset/features.txt",col.names = c("FeatureIndex","FeatureName"), stringsAsFactors=FALSE)

#Read in Test Data Set
testData <- read.table("UCI HAR Dataset/test/X_test.txt",col.names=FeatureCodes$FeatureName)
testDataSubject <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names="SubjectID")
testDataActNum <- read.table("UCI HAR Dataset/test/y_test.txt",col.names="ActivityNumber")
testDataCombined <- cbind(testDataSubject,testDataActNum,testData)
dim(testDataCombined)


#read in Train Data Set
trainData <- read.table("UCI HAR Dataset/train/X_train.txt",col.names=FeatureCodes$FeatureName)
trainDataSubject <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names="SubjectID")
trainDataActNum <- read.table("UCI HAR Dataset/train/y_train.txt",col.names="ActivityNumber")
trainDataCombined <- cbind(trainDataSubject,trainDataActNum,trainData)
#testDataWithActNum <- cbind(testDataSubject,testDataActNum,testData)
dim(trainDataCombined)



combinedData <- rbind(testDataCombined,trainDataCombined)
combinedData <- join(ActivityCodes,combinedData)

#

combinedDataCleaned <- select(combinedData,matches("subjectid|mean|std|Activity$"))
names(combinedDataCleaned)
aTidyDataSet <- ddply(combinedDataCleaned,.(SubjectID,Activity),summarise,tBodyAcc_Mean_X=mean(tBodyAcc.mean...X),tBodyAcc_Mean_Y=mean(tBodyAcc.mean...Y),tBodyAcc_Mean_Z=mean(tBodyAcc.mean...Z))
write.table(aTidyDataSet,row.name=FALSE,file="wearableComputingCleanDataOutput.txt")