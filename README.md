Description
===========
The orginal data set is the Human Activity Recognition Using Smartphones Dataset Version 1.0 described in 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

and downloaded from 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This repo contains files for merging the training and test sets to create one data set, averaging each variable per
each activity and each subject.

Included Files
==============
The data set includes the following files:
- 'averaged.txt': The mean of the extracted measurements calculated using the mean() function in R. 79 rows X 36 columns.

See the code book for a full description of the measurements and table structure. Also additional comments in the R file.

How To Generate the Data Set
============================
The file run_analysis.R can be in the same directory as the unzipped directory UCI HAR Dataset. Optionally
pass the path to this directory. 

To get a txt file containing the data frame of the merged and averaged data set call 
```
writeOutput(filename="test.txt") 
```
or if the path to the files is another then
```
writeOutput(yourPath="C:\\Users\\path\\to\\files", filename="test.txt")
``` 
