# CodeBook

This code book will list and give a short description of files used for course assignment from UCI's research on predicting human activity from readings from smartphone sensors

** Information about the experiment performed:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

** Files used for the assignment
  * UCI HAR Dataset/features.txt : List of all features
  * UCI HAR Dataset/activity_labels.txt : Contains labels of activities performed
  * UCI HAR Dataset/train/subject_train.txt : Subjects who performed activities in training set
  * UCI HAR Dataset/train/y_train.txt : Activity performed by training subject
  * UCI HAR Dataset/train/X_train.txt : Measurements made from results on training set during corresponding activities
  * UCI HAR Dataset/train/subject_test.txt : Subjects who performed activities in test set
  * UCI HAR Dataset/train/y_test.txt : Activity performed by test subjects
  * UCI HAR Dataset/test/X_test.txt : Measurements made from results on test set during corresponding activities

** Steps performed by run_analysis.R
  * Reads in all the above mentioned files
  * Combines data from measurements of training and test sets
  * Filters columns to include only those that measure mean and standard deviation 
  * Further combines data about subjects from whom the measurements were collected and the corresponding activities they performed and creates one full dataset
  * Gives the dataset proper labels 
  * Creates a tidy, tall and skinny dataset which contains subject, activity performed, measurement and average value of the measurement in every row of dataset
  * Writes the tidy, tall and skinny dataset to a csv file