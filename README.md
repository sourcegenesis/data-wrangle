# Getting and Cleaning Data Project Solution

This repository inclides a script file, run_analysis.R, and data file that's result of running the script. The script loads the data from multiple files into a 
data frame so that it can be grouped as per Activity/Subject variables to create final tidy data set. It uses dplyr function summarise_all to calculaute
averge for each variable in the group.

Instructions to run the scirpt:
1) Download the zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2) Extract the zip file in current directory
3) Run run_analysis.R script from current directory

It produces tidyDataSet.txt file in current directory.

