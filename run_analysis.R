# Dataset 1
# Download the data
dataSource <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataFile <- "UCI HAR Dataset.zip"

if (!file.exists(dataFile)){
  setInternet2(TRUE)
  download.file(dataSource, dataFile)
  library(utils)
  unzip(dataFile)
}

# Get activity dataset
activityFile <- "./UCI HAR Dataset/activity_labels.txt"
activityTable <- read.table(activityFile)


# Set filter for Dataset 1
featureFile <- "./UCI HAR Dataset/features.txt"
featureTable <- read.table(featureFile)
filterCol <- featureTable[grep(c("mean\\(\\)|std\\(\\)"), featureTable$V2), ]


# Get feature test dataset
testFeatureFile <- "./UCI HAR Dataset/test/X_test.txt"
testFeatureTable <- read.table(testFeatureFile)

# Get activity test dataset
testActivityFile <- "./UCI HAR Dataset/test/y_test.txt"
testActivityTable <- read.table(testActivityFile)

# Subset features dataset on test dataset
testData <- subset(testFeatureTable[, filterCol$V1])

# Bind test dataset with activity
testData <- cbind(testActivityTable, testData)


# Get feature training dataset
trainingFeatureFile <- "./UCI HAR Dataset/train/X_train.txt"
trainingFeatureTable <- read.table(trainingFeatureFile)

# Get activity training dataset
trainingActivityFile <- "./UCI HAR Dataset/train/y_train.txt"
trainingActivityTable <- read.table(trainingActivityFile)


# Subset features dataset on training dataset
trainingData <- subset(trainingFeatureTable[, filterCol$V1])

# Bind training dataset with activity
trainingData <- cbind(trainingActivityTable, trainingData)


# Merge the rows of test and training datasets
mergedData <- rbind(testData, trainingData)


# Rename columns
colnames(mergedData)[1] <- "activity"

for (i in 2:ncol(mergedData)){
  colName <- colnames(mergedData[i])
  colName <- substr(colName, 2, nchar(colName))
  colnames(mergedData)[i] <- as.vector(filterCol[filterCol$V1 == colName, 2])
}


# Update activity values
for(i in 1:nrow(activityTable)){
  mergedData[mergedData$activity == activityTable[i, 1], 1] <- as.vector(activityTable[i, 2])
}


# Save the data table into txt file
write.table(mergedData, file = "dataset1.txt", sep = ",")



# Dataset 2
# Get subject test dataset
testSubjectFile <- "./UCI HAR Dataset/test/subject_test.txt"
testSubjectTable <- read.table(testSubjectFile)


# Merge columns of feature, activity, and subject test dataset
testData2 <- cbind(testActivityTable, testSubjectTable, testFeatureTable)


# Get subject training dataset
trainingSubjectFile <- "./UCI HAR Dataset/train/subject_train.txt"
trainingSubjectTable <- read.table(trainingSubjectFile)


# Merge columns of feature, activitiy, and subject training dataset
trainingData2 <- cbind(trainingActivityTable, trainingSubjectTable, trainingFeatureTable)


# Merge the rows of test and training datasets
mergedData2 <- rbind(testData2, trainingData2)


# Rename columns
colnames(mergedData2)[1] <- "activity"
colnames(mergedData2)[2] <- "subjectNumber"

for (i in 3:ncol(mergedData2)){
  colName <- colnames(mergedData2[i])
  colName <- substr(colName, 2, nchar(colName))
  colnames(mergedData2)[i] <- as.vector(featureTable[featureTable$V1 == colName, 2])
}


# Update activity values
for(i in 1:nrow(activityTable)){
  mergedData2[mergedData2$activity == activityTable[i, 1], 1] <- as.vector(activityTable[i, 2])
}


# Aggregate all variables by activity and subject
finalData <- aggregate(. ~ activity + subjectNumber, data = mergedData2, FUN = "mean")


# Save the data table into txt file
write.table(finalData, file = "dataset2.txt", sep = ",")