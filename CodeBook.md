Processed Data 
==============
Extracts only the measurements on the mean and standard deviation for each of the measurements described in the 
Feature Selection of the original data set. For each of the extracted measurements the average is calculated using the 
mean() function in R. 

Table Structure 
===============
Columns 1 to 6 are for each of the activity types. Columns 7 to 36 are for each of the subjects:
```
 [1] "LAYING"             "SITTING"            "STANDING"           "WALKING"            "WALKING_DOWNSTAIRS" "WALKING_UPSTAIRS"  
 [7] "1"                  "2"                  "3"                  "4"                  "5"                  "6"                 
[13] "7"                  "8"                  "9"                  "10"                 "11"                 "12"                
[19] "13"                 "14"                 "15"                 "16"                 "17"                 "18"                
[25] "19"                 "20"                 "21"                 "22"                 "23"                 "24"                
[31] "25"                 "26"                 "27"                 "28"                 "29"                 "30"          
```

The 79 means are stored in rows, which have been renamed to make more human readable:
```
 [1] "tBodyAccMeanX"                "tBodyAccMeanY"                "tBodyAccMeanZ"                "tBodyAccStdX"                
 [5] "tBodyAccStdY"                 "tBodyAccStdZ"                 "tGravityAccMeanX"             "tGravityAccMeanY"            
 [9] "tGravityAccMeanZ"             "tGravityAccStdX"              "tGravityAccStdY"              "tGravityAccStdZ"             
[13] "tBodyAccJerkMeanX"            "tBodyAccJerkMeanY"            "tBodyAccJerkMeanZ"            "tBodyAccJerkStdX"            
[17] "tBodyAccJerkStdY"             "tBodyAccJerkStdZ"             "tBodyGyroMeanX"               "tBodyGyroMeanY"              
[21] "tBodyGyroMeanZ"               "tBodyGyroStdX"                "tBodyGyroStdY"                "tBodyGyroStdZ"               
[25] "tBodyGyroJerkMeanX"           "tBodyGyroJerkMeanY"           "tBodyGyroJerkMeanZ"           "tBodyGyroJerkStdX"           
[29] "tBodyGyroJerkStdY"            "tBodyGyroJerkStdZ"            "tBodyAccMagMean"              "tBodyAccMagStd"              
[33] "tGravityAccMagMean"           "tGravityAccMagStd"            "tBodyAccJerkMagMean"          "tBodyAccJerkMagStd"          
[37] "tBodyGyroMagMean"             "tBodyGyroMagStd"              "tBodyGyroJerkMagMean"         "tBodyGyroJerkMagStd"         
[41] "fBodyAccMeanX"                "fBodyAccMeanY"                "fBodyAccMeanZ"                "fBodyAccStdX"                
[45] "fBodyAccStdY"                 "fBodyAccStdZ"                 "fBodyAccMeanFreqX"            "fBodyAccMeanFreqY"           
[49] "fBodyAccMeanFreqZ"            "fBodyAccJerkMeanX"            "fBodyAccJerkMeanY"            "fBodyAccJerkMeanZ"           
[53] "fBodyAccJerkStdX"             "fBodyAccJerkStdY"             "fBodyAccJerkStdZ"             "fBodyAccJerkMeanFreqX"       
[57] "fBodyAccJerkMeanFreqY"        "fBodyAccJerkMeanFreqZ"        "fBodyGyroMeanX"               "fBodyGyroMeanY"              
[61] "fBodyGyroMeanZ"               "fBodyGyroStdX"                "fBodyGyroStdY"                "fBodyGyroStdZ"               
[65] "fBodyGyroMeanFreqX"           "fBodyGyroMeanFreqY"           "fBodyGyroMeanFreqZ"           "fBodyAccMagMean"             
[69] "fBodyAccMagStd"               "fBodyAccMagMeanFreq"          "fBodyBodyAccJerkMagMean"      "fBodyBodyAccJerkMagStd"      
[73] "fBodyBodyAccJerkMagMeanFreq"  "fBodyBodyGyroMagMean"         "fBodyBodyGyroMagStd"          "fBodyBodyGyroMagMeanFreq"    
[77] "fBodyBodyGyroJerkMagMean"     "fBodyBodyGyroJerkMagStd"      "fBodyBodyGyroJerkMagMeanFreq"
```
