# Getting and Cleaning Data Course Project

The purpose of this course project is to read in, clean and tidy  a dataset. Here, we read in a dataset created by UCI, where they have recorded the results from a research to recognize human activity using smartphone sensors.

Link to the reseasrch : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Link to the dataset used for this assignment: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

** Files in this project:
1. README.md - this file
2. CodeBook.md - a file describing all input files and the output 'tidy_skinny_dataset.csv' file
3. run_analysis.R - R script that reads in input files and creates a tidy skinny dataset
4. tidy_skinny_dataset.csv - Output file created duing my testing

** Steps to run:
1. Download the dataset from above link
2. Unzip the dataset to a folder named "UCI HAR Dataset"
3. Place the run_analysis.R file in the same folder as the folder "UCI HAR Dataset"
4. Run run_analysis.R file. It will output a file named 'tidy_skinny_dataset.csv' containing a tidy skinny dataset. More details about this can be found in CodeBook.md file same project