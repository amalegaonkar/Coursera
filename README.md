Coursera
========
The attached R script (run_analysis.R) performs the following to clean up the data:

The file assumes the data is located test/* and train/* wherever it is run.

Logic of the code:

1. Merges the training and test sets to create one data set.

2. Reads file features.txt and extracts only the measurements on the mean and standard deviation for each measurement.

3. Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:
walking/walkingupstairs/walkingdownstairs/sitting/standing/laying

4.Label the data set with descriptive names: all feature names (attributes) and activity names are converted to lower case, underscores and brackets () are removed.
The result is saved as mergedCleanData.txt (ATTACHED)
tbodyacc-mean-x/tbodyacc-mean-y/tbodyacc-mean-z/tbodyacc-std-x/tbodyacc-std-y/tbodyacc-std-z/tgravityacc-mean-x/tgravityacc-mean-y

5. Atlast the tidy data set with the average of each measurement for each activity and each subject.
The result is saved as tidyDataSet.txt (ATTACHED)
