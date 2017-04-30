# Getting and Cleaning Data Project Solution
This document describes run_analysis.R

## Helper Functions
filename : Create a file name based on different parts of it
readFile : Reads a file from disk
createDataFrame : Creates a data frame for each type of data set 
activityName : Returns an activity name based on Subject number

## Main Flow of the program
There are five steps in the code.
Step 1: Merge the training and the test sets to create one data set. 
Step 2: Use descriptive activity names to name the activities in the data set
Step 3: Label the data set with descriptive variable names. 
Step 4: Extract only the measurements on the mean and standard deviation for each measurement.
Step 5 : Create and dump tidy data set to a file

