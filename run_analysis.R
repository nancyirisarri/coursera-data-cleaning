# Functions for merging test and training data sets. 

getPath <- function(yourPath) {
  # yourPath: optional variable if the unzipped directory containing the files 
  # to process is not in the same location as the .R file.
  #
  # Function to get the path to the files.
  #
  # Return character vector.
  
  path <- paste("UCI HAR Dataset", sep=.Platform$file.sep)
  
  if (!missing(yourPath)) {
    path <- paste(yourPath, "UCI HAR Dataset", sep=.Platform$file.sep)
  } 
  
  path
}

mergeSubjects <- function(yourPath) {
  # yourPath: optional variable if the unzipped directory containing the files 
  # to process is not in the same location as the .R file.
  #
  # Extracts the subject numbers from subject_test.txt and subject_train.txt 
  # into the column 'subject'. Then merges into one column.
  #
  # Return data.frame
  
  path <- getPath(yourPath)
  
  subject_test <- read.table(
    paste(path, "test", "subject_test.txt", sep=.Platform$file.sep), 
    col.names="subject")
  
  subject_train <- read.table(
    paste(path, "train", "subject_train.txt", sep=.Platform$file.sep), 
    col.names="subject")
  
  rbind(subject_test, subject_train, deparse.level=0)
}

renameFeatures <- function(yourPath) {
  # yourPath: optional variable if the unzipped directory containing the files 
  # to process is not in the same location as the .R file.
  #
  # Rename the rows in features.txt to make more human readable. Keep only the 
  # rows where the column has either 'mean' or 'std', and uppercase the first 
  # letter.
  #
  # Return data.frame
  
  path <- getPath(yourPath)
  
  features <- read.table(paste(path, "features.txt", sep=.Platform$file.sep), 
                         col.names = c("id", "feature"))

  features$feature <- sapply(features$feature, function(x) { 
    if (grepl("mean", x) | grepl("std", x)) {
      x <- sub("\\(\\)-", "", x) 
      x <- sub("-", "", x)
      x <- sub("\\(\\)", "", x)
      x <- sub("mean", "Mean", x)
      x <- sub("std", "Std", x)
    }
  })
  
  features[grepl("Mean", features$feature) | grepl("Std", features$feature),]
}

mergeObservations <- function(yourPath) {
  # yourPath: optional variable if the unzipped directory containing the files 
  # to process is not in the same location as the .R file.
  #
  # Extract the relevant columns from X_test.txt and X_train.txt. Name the 
  # columns using the names from renameFeatures(). Then merge into one data 
  # frame.
  #
  # Return data.frame
  
  path <- getPath(yourPath)
  
  observations_test <- read.table(
    paste(path, "test", "X_test.txt", sep=.Platform$file.sep), header = FALSE)

  observations_train <- read.table(
    paste(path, "train", "X_train.txt", sep=.Platform$file.sep), header = FALSE)

  # Extract the relevant columns using the indices from renameFeatures().
  features <- renameFeatures()
  observations_test <- observations_test[, features[,1]]
  observations_train <- observations_train[, features[,1]]
  
  observations <- data.frame(
    rbind(observations_test, observations_train, deparse.level = 0))
  
  colnames(observations) <- features$feature
  
  observations
}

mergeActivities <- function(yourPath) {
  # yourPath: optional variable if the unzipped directory containing the files 
  # to process is not in the same location as the .R file.
  #
  # Convert activity numbers in y_test.txt and y_train.txt into words using the 
  # mapping in activity_labels.txt. Name the column as 'activity'.
  #
  # Return data.frame

  path <- getPath(yourPath)
  
  # Store the labels.
  activity_labels <- read.table(
    paste(path, "activity_labels.txt", sep = .Platform$file.sep),
    col.names = c("id", "activity"))
  
  # Get the data.
  activities_train <- read.table(
    paste(path, "train", "y_train.txt", sep = .Platform$file.sep),
    col.names = c("activity"))
  
  activities_test <- read.table(
    paste(path, "test", "y_test.txt", sep = .Platform$file.sep), 
    col.names = c("activity"))
  
  # Do the mapping.
  for (i in 1:nrow(activity_labels)) {
    
    activities_train$activity <- sapply(
      activities_train$activity, 
      function(x) { x <- sub(activity_labels[i,1], activity_labels[i,2], x) })
    
    activities_test$activity <- sapply(
      activities_test$activity, 
      function(x) { x <- sub(activity_labels[i,1], activity_labels[i,2], x) })
  }
  
  rbind(activities_test, activities_train, deparse.level = 0)
}

mergeAll <- function(yourPath) {
  # Merge the test and training data. The upper rows contain the test data while 
  # the lower rows the training data.
  # Return data.frame
  
  subjects <- mergeSubjects(yourPath)
  activities <- mergeActivities(yourPath)
  observations <- mergeObservations(yourPath)

  cbind(subjects, activities, observations)
}

mergeAverages <- function(yourPath) {
  # From the merged data, creates an independent tidy data set with the average 
  # of each variable for each activity and each subject. The rows indicate the 
  # variables and the columns the activities and subjects.
  #
  # Return data.frame
  
  require(dplyr)
  
  observations <- mergeAll(yourPath)
  
  # Use these for the column names.
  activity_labels <- sort(unique(observations$activity))
  subject_labels <- sort(unique(observations$subject))
  
  variables <- colnames(observations)
  
  # Data frame to hold the object to return.
  averages <- data.frame(row.names=variables[3:ncol(observations)])
  
  for (i in 3:ncol(observations)) {
      
    for (j in seq_along(activity_labels)) {
      subobservations <- filter(observations, activity==activity_labels[j])
      averages[i-2,j] <- mean(subobservations[,i], na.rm=TRUE)
    }

    for (k in seq_along(subject_labels)) {
      subobservations <- filter(observations, subject==subject_labels[k])
      averages[i-2,k+length(activity_labels)] <- mean(subobservations[,i], 
                                                      na.rm=TRUE)
    }
    
  }
  
  colnames(averages) <- c(activity_labels, subject_labels)
  
  averages
}

writeOutput <- function(yourPath, filename) {
  # filename: name of file in which to write the data.
  
  # Function to write the merged and averaged data to a file.
  
  write.table(mergeAverages(yourPath), filename)
}