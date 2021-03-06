# Getting and Cleaning Data Project Code Book
This document describes run_analysis.R

## Helper Functions
+ filename : Create a file name based on different parts of it
+ readFile : Reads a file from disk
+ createDataFrame : Creates a data frame for each type of data set 
+ activityName : Returns an activity name based on Subject number

## Main Flow of the program
There are five steps in the code.
1. Merge the training and the test sets to create one data set. 
2. Use descriptive activity names to name the activities in the data set
3. Label the data set with descriptive variable names. 
4. Extract only the measurements on the mean and standard deviation for each measurement.
5. Create and dump tidy data set to a file

## Variables
+ fullData: This includes both training and test data sets from orignal source
+ tidyDataSet : This is the tidy data set with average for each group by activity and subject. It has 180 observations (6 activities * 30 subjects) and 81 variables (mean and standard deviation variables from original data set)

