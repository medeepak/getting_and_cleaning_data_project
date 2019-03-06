library(plyr)
library(tidyr)

#Read features and activity Labels
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

#Read train and test data
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")

#Read train and test labels
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

#Read train and test subjects
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge labels and subjects from train and test sets
labels <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

#1. Merge training and test sets to create one data set
merged_data_set <- rbind(train_data, test_data)

#2. Extract only columns that contain information of mean and standard deviation
cols_with_mean_std_data <- grep("mean\\(\\)|std\\(\\)", features[,2])
mean_std_data_alone <- merged_data_set[, cols_with_mean_std_data]

#Merge subjects, labels with measurement set
complete_data_set <- cbind(subject, labels, mean_std_data_alone)

#3. Replace ids for activities column with descriptive labels
complete_data_set[,2] <- sapply(complete_data_set[,2], function(x) {activity_labels[x,2]})

#4. Give Names to Columns. First Column is subject and second column is activity. Other column names are fetched from features table
names(complete_data_set)[1] <-  "subject"
names(complete_data_set)[2] <-  "activity"
names(complete_data_set)[-(1:2)] <- grep("mean\\(\\)|std\\(\\)", features[,2], value = TRUE)

#Rename columns to remove braces
names(complete_data_set) <- sapply(names(complete_data_set), function(x) { tolower(gsub("[()]", "", x)) })

#5. Creating a tidy skinny dataset from complete_data_set by
# first converting measurment columns to key value pairs and then finding average of each measurement for each subject and each activity
# Thus formed tidy skinny dataset contains subject,activity, measurement and average value of that measurement for given subject and activity
tidy_skinny_dataset <- gather(complete_data_set, measurement, value, -c('subject', 'activity')) %>% ddply(.(subject, activity, measurement), summarize, avg = mean(value))
write.table(tidy_skinny_dataset, "tidy_skinny_dataset.txt")