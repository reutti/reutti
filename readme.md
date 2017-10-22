final project in getting and cleaning data:


run_analysis.R does the following

downloads the dataset if it does not already downloaded to the working directory
unzip the files and extracts and load activity and features
load training and test datasets and sorting only the columnsrelate to features containing Mean and Standard Deviation which are the relevant for the project 
Merges the training and the test sets to create one data set.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
Converts the activity and subject columns into factors
From the data set creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The end result is shown in the file tidy.txt.