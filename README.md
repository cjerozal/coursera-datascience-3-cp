## Introduction

The script in run_analysis.R creates a tidy version of data collected by researchers from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is the specific data used by the script:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Reads in relevant data

First the script reads in relevant data from these locations in the original dataset:
* train/subject_train.txt and test/subject_test.txt - Contains IDs of the 30 subjects in order of the observations in other (below-described) files
* train/y_train.txt and test/y_test.txt - Contains IDs of the activity types (mappings to activity names are in activity_labels.txt) for the observations
* train/X_train.txt and test/X_test.txt - Contains 561 feature measurements per observation. The feature names are listed in features.txt

## Merges the training and the test sets

Then the script uses cbind() to combine the three files for training data and for test data into two sets of observations, for training and test data. The training and test data are then combined into one set of observations.

## Appropriately labels the data set with descriptive variable names

The feature names are read in from the features.txt file in the original data set, and they are assigned to the column names in the activity data frame.

## Uses descriptive activity names to name the activities in the data set

The activity IDs in the activity data frame are replaced with the activity descriptions, from the original activity_labels.txt file. 1 becomes "WALKING" and so on.

## Extracts only the measurements on the mean and standard deviation

The variable names are searched for "mean" (but not "meanFreq", as that is not a true mean) and "std", and only those columns are kept in the overall data set.

## Creates a second, independent tidy data set with the average of each variable for each activity and each subject

TODO: Something happens

