# activityColumnName <- "Activity"
# subjectIdColumnName <- "Subject ID"
# 
# # Read in relevant data
# subjectTestData <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
# xTestData <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
# yTestData <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
# subjectTrainData <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
# xTrainData <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
# yTrainData <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
# 
# # Merge the training and the test sets to create one data set
# testData <- cbind(subjectTestData, xTestData, yTestData)
# trainingData <- cbind(subjectTrainData, xTrainData, yTrainData)
# activityData <- rbind(testData, trainingData)

# Appropriately label the data set with descriptive variable names, and
# Extract only the measurements on the mean and standard deviation for each measurement
cleanFeatureName <- function(featureName) {
    cleanFeatureName <- sub("()", "", featureName, fixed = TRUE)
    cleanFeatureName <- sub("BodyBody", "Body", cleanFeatureName)  # correct mistake in original data
    cleanFeatureName <- sub("^t", "time", cleanFeatureName)
    cleanFeatureName <- sub("^f", "freq", cleanFeatureName)
    cleanFeatureName
}
featureMappings <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
featureMappings <- as.character(featureMappings[,2])
colnames(activityData) <- c(subjectIdColumnName, featureMappings, activityColumnName)
meanAndStdData <- data.frame(activityData[, subjectIdColumnName], activityData[, activityColumnName])
colnames(meanAndStdData) <- c(subjectIdColumnName, activityColumnName)
for (featureName in featureMappings) {
    if(grepl("std", featureName) |
           (grepl("mean", featureName) & !grepl("meanFreq", featureName))) {
        cleandFeatureName <- cleanFeatureName(featureName)
        meanAndStdData[, cleandFeatureName] <- activityData[, featureName]
    }
}

# Use descriptive activity names to name the activities in the data set
activityMappings <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
activityMappings <- as.character(activityMappings[,2])
for (index in seq_along(activityMappings)) {
    meanAndStdData[meanAndStdData[, activityColumnName] == index, activityColumnName] <- activityMappings[[index]]
}

# Create a second, independent tidy data set with the average of each variable for each activity and each subject
numSubjects <- 30
tidyDataMatrix <- matrix(nrow = length(activityMappings)*numSubjects, ncol = ncol(meanAndStdData))
colnames(tidyDataMatrix) <- colnames(meanAndStdData)
# skip the subject and activity columns when calculating means
meanNames <- colnames(tidyDataMatrix)[3:ncol(tidyDataMatrix)]
dataSplitBySubject <- split(meanAndStdData, meanAndStdData[, subjectIdColumnName])
subjectNames <- names(dataSplitBySubject)

for (subjectIndex in seq_along(subjectNames)) {
    currentSubject <- subjectNames[subjectIndex]
    subjectDF <- dataSplitBySubject[[currentSubject]]
    dataSplitByActivity <- split(subjectDF, subjectDF[, activityColumnName])
    activityNames <- names(dataSplitByActivity)

    for (activityIndex in seq_along(activityNames)) {
        currentActivity <- activityNames[activityIndex]
        activityDF <- dataSplitByActivity[[currentActivity]]
        rowOfMeans <- vector(mode = "numeric")

        for (colIndex in seq_along(meanNames)) {
            colName <- meanNames[colIndex]
            rowOfMeans[colIndex] <- mean(activityDF[, colName], na.rm = TRUE)
        }
        currentRowIndex <- ((subjectIndex - 1) * 6) + activityIndex
        tidyDataMatrix[currentRowIndex, ] <- c(currentSubject, currentActivity, rowOfMeans)
    }
}

tidyData <- data.frame(tidyDataMatrix, stringsAsFactors = FALSE)
for (colIndex in 1:ncol(tidyData)) {
    # the second column is activity names, but all others should be numeric
    if (colIndex != 2) {
        tidyData[, colIndex] <- as.numeric(tidyData[, colIndex])
    }
}
write.table(tidyData, file = "tidydata.txt")
