library(data.table)


## Read in all the raw data, including the label
setwd('/Users/ashutosh/Documents/src/R/coursera/dataclean')

#X test and Train
xTestDataSet <- read.table("data/test/X_test.txt")
xTrainingDataSet <- read.table("data/train/X_train.txt")

#Y test and train
yTestDataSet <- read.table("data/test/Y_test.txt")
yTrainingDataSet <- read.table("data/train/Y_train.txt")

# activity, subject labels
activityLabel <- read.table("data/activity_labels.txt")
subjectTestLabel <- read.table("data/test/subject_test.txt")
subjectTrainLabel <- read.table("data/train/subject_train.txt")

yTrainingDataSet <- read.table("data/train/Y_train.txt")
