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
colnames(activityData) <- c("Subject ID", featureMappings, "Activity")

# Use descriptive activity names to name the activities in the data set
activityMappings <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
activityMappings <- as.character(activityMappings[,2])
for (index in seq_along(activityMappings)) {
    activityData[activityData[, "Activity"] == index, "Activity"] <- activityMappings[[index]]
}


# Extract only the measurements on the mean and standard deviation for each measurement

# Create a second, independent tidy data set with the average of each variable for each activity and each subject

# TODO print out result (with write.table to text file)
