#
# This program is a solution for 'Getting and Cleaning Data Course Project' requirements.
# It reads fitness data sets and creates a tidy data set for further analysis.
#

# Root directory where data files are stored
sourceDirectory <- "./UCI HAR Dataset"

#
# Common functions used in this analysis
#
filename <- function (type, prefix) { paste(prefix, "_", type, ".txt", sep = "") }

readFile <- function (dir, fileName) {
     read.csv(file = paste(sourceDirectory, dir, fileName, sep = "/"), header = FALSE, sep = "",  stringsAsFactors = FALSE)     
}

# Create a data frame merging multiple files for each type of data set (train or test)
createDataFrame <- function (type) {
     data.frame(readFile(type, filename(type, "y")), 
                readFile(type, filename(type, "subject")), 
                readFile(type, filename(type, "X")))
} 
 
activityName <- function (number) { activityLabels[ activityLabels == number, 2] }

#
# End Common functions used in this analysis
#

########################################################################
# Solution steps
########################################################################

## Step 1: Merge the training and the test sets to create one data set. 
fullData <- rbind(createDataFrame("test"), createDataFrame("train"))

## Step 2: Use descriptive activity names to name the activities in the data set
activityLabels <- read.csv(paste(sourceDirectory, "activity_labels.txt", sep = "/") , sep="", header = FALSE, stringsAsFactors = FALSE)
colnames(activityLabels) <- c("number", "ActivityName")
fullData$V1 <-  sapply(fullData$V1, activityName)

## Step 3: Label the data set with descriptive variable names. 
features <- read.csv(paste(sourceDirectory, "features.txt", sep = "/") , sep="", header = FALSE, stringsAsFactors = FALSE)[, 2]
colnames(fullData) <- c("ActivityName", "Subject", features)

## Step 4: Extract only the measurements on the mean and standard deviation for each measurement.
fullData <- fullData[, grepl(colnames(fullData), pattern = "*mean*|*std*|ActivityName|Subject")]

## Step 5 : Create and dump tidy data set to a file
tidyDataSet <- group_by_(fullData, "ActivityName", "Subject") %>% summarise_all(.funs = c("mean"))
write.table(tidyDataSet, file = 'tidyDataSet.txt', row.names = FALSE, quote = FALSE)
