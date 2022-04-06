library(reshape2)


# Read dataset

fileName <- "getdata_projectfiles_UCI HAR Dataset.zip"

if (!file.exists(fileName)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, fileName, method="curl")
}

if (!file.exists("UCI HAR Dataset")){
  unzip(fileName)
}


# Load activity labels

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])


# Load features

features <- read.table("UCI HAR Dataset/features.txt") 
features[,2] <- as.character(features[,2])


# Extract mean and standard deviation

f_mean_std <- grep(".*mean.*|.*std.*", features[,2])
f_mean_std.names <- features[f_mean_std,2]
f_mean_std.names <- gsub('[-()]', '', f_mean_std.names)


# Load training sets

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")[f_mean_std]
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- cbind(subject_train, y_train, X_train)


# Load test sets

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")[f_mean_std]
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- cbind(subject_test, y_test, X_test)


# Merge training and test sets

combinedData <- rbind(X_train, X_test)
colnames(combinedData) <- c("subject", "activity", f_mean_std.names)


# Create tidy dataset with the average of each variable for each activity and each subject.

combinedData$activity <- factor(combinedData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
combinedData$subject <- as.factor(combinedData$subject)

combinedData.melted <- melt(combinedData, id = c("subject", "activity"))
combinedData.mean <- dcast(combinedData.melted, subject + activity ~ variable, mean)


# Write new tidy dataset

write.table(combinedData.mean, "tidyDataset.txt", row.names = FALSE, quote = FALSE)
