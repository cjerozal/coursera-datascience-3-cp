activityColumnName <- "Activity"
subjectIdColumnName <- "Subject ID"

# Read in relevant data
subjectTestData <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
xTestData <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
yTestData <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
subjectTrainData <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
xTrainData <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
yTrainData <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)

# Merge the training and the test sets to create one data set
testData <- cbind(subjectTestData, xTestData, yTestData)
trainingData <- cbind(subjectTrainData, xTrainData, yTrainData)
activityData <- rbind(testData, trainingData)

# Appropriately label the data set with descriptive variable names
featureMappings <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
featureMappings <- as.character(featureMappings[,2])
colnames(activityData) <- c(subjectIdColumnName, featureMappings, activityColumnName)

# Use descriptive activity names to name the activities in the data set
activityMappings <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
activityMappings <- as.character(activityMappings[,2])
for (index in seq_along(activityMappings)) {
    activityData[activityData[, activityColumnName] == index, activityColumnName] <- activityMappings[[index]]
}

# Extract only the measurements on the mean and standard deviation for each measurement
meanAndStdData <- data.frame(activityData[, subjectIdColumnName], activityData[, activityColumnName])
colnames(meanAndStdData) <- c(subjectIdColumnName, activityColumnName)
for (featureName in featureMappings) {
    if(grepl("std", featureName) |
       (grepl("mean", featureName) & !grepl("meanFreq", featureName))) {
            meanAndStdData[, featureName] <- activityData[, featureName]
    }
}

# Create a second, independent tidy data set with the average of each variable for each activity and each subject
subject <- vector(mode = "numeric")
activity <- vector(mode = "character")
dataSplitBySubject <- split(meanAndStdData, meanAndStdData[, subjectIdColumnName])
for (subjectDF in dataSplitBySubject) {
    dataSplitByActivity <- split(subjectDF, subjectDF[, activityColumnName])
    for (activityDF in dataSplitByActivity) {
        # TODO take avg of all cols of activityDF, and put result in a matrix or something (rbind?)
    }
}
tidyData <- data.frame(subject, activity)


# TODO print out result (with write.table to text file)

# TODO fill out readme and code book
