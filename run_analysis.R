library(data.table)

# Source of data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# This R script does the following:
# 1. Merges the training and the test sets to create one data set.
## Read in all the raw data, including the label
setwd('/Users/ashutosh/Documents/src/R/coursera/dataclean/data')


#X test and Train
xTestDataSet <- read.table("test/X_test.txt")
xTrainingDataSet <- read.table("train/X_train.txt")
XCombined <- rbind(xTestDataSet, xTrainingDataSet)


subjectTestDataSet <- read.table("test/subject_test.txt")
subjectTrainDataSet <- read.table("train/subject_train.txt")
SCombined <- rbind(subjectTestDataSet, subjectTrainDataSet)

#Y test and train
yTestDataSet <- read.table("test/Y_test.txt")
yTrainingDataSet <- read.table("train/Y_train.txt")
YCombined <- rbind(yTestDataSet, yTrainingDataSet)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
XCombined <- XCombined[, indices_of_good_features]
names(XCombined) <- features[indices_of_good_features, 2]
names(XCombined) <- gsub("\\(|\\)", "", names(XCombined))


# 3. Uses descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
YCombined[,1] = activities[YCombined[,1], 2]
names(YCombined) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(SCombined) <- "subject"
cleaned <- cbind(SCombined, YCombined, XCombined)
write.table(cleaned, "MergedCleanData.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(SCombined)[,1]
numSubjects = length(unique(SCombined)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
    for (a in 1:numActivities) {
        result[row, 1] = uniqueSubjects[s]
        result[row, 2] = activities[a, 2]
        tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
        result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
        row = row+1
    }
}
write.table(result, "tidyDataSet.txt")