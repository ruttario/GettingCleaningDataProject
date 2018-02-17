
# Code Book of Tidy Data Set of Human Activity Recognition Using Smartphones

## Subject
  Subject ID
  + 1
  + 2
  + 3
  + 4
  + 5
  + 6
  + 7
  + 8
  + 9
  + 10
  + 11
  + 12
  + 13
  + 14
  + 15
  + 16
  + 17
  + 18
  + 19
  + 20
  + 21
  + 22
  + 23
  + 24
  + 25
  + 26
  + 27
  + 28
  + 29
  + 30

## Activity
  Activity Name
  + WALKING
  + WALKING_UPSTAIRS
  + WALKING_DOWNSTAIRS
  + SITTING
  + STANDING
  + LAYING
 
## Measurement
  79 measurement type, related to only mean and standard deviation, as a subset of 561 in the original data set
  + tBodyAcc.mean...X               
  + tBodyAcc.mean...Y              
  + tBodyAcc.mean...Z               
  + tGravityAcc.mean...X           
  + tGravityAcc.mean...Y            
  + tGravityAcc.mean...Z           
  + tBodyAccJerk.mean...X           
  + tBodyAccJerk.mean...Y          
  + tBodyAccJerk.mean...Z           
  + tBodyGyro.mean...X             
  + tBodyGyro.mean...Y              
  + tBodyGyro.mean...Z             
  + tBodyGyroJerk.mean...X          
  + tBodyGyroJerk.mean...Y         
  + tBodyGyroJerk.mean...Z          
  + tBodyAccMag.mean..             
  + tGravityAccMag.mean..           
  + tBodyAccJerkMag.mean..         
  + tBodyGyroMag.mean..             
  + tBodyGyroJerkMag.mean..        
  + fBodyAcc.mean...X               
  + fBodyAcc.mean...Y              
  + fBodyAcc.mean...Z               
  + fBodyAcc.meanFreq...X          
  + fBodyAcc.meanFreq...Y           
  + fBodyAcc.meanFreq...Z          
  + fBodyAccJerk.mean...X           
  + fBodyAccJerk.mean...Y          
  + fBodyAccJerk.mean...Z           
  + fBodyAccJerk.meanFreq...X      
  + fBodyAccJerk.meanFreq...Y       
  + fBodyAccJerk.meanFreq...Z      
  + fBodyGyro.mean...X              
  + fBodyGyro.mean...Y             
  + fBodyGyro.mean...Z              
  + fBodyGyro.meanFreq...X         
  + fBodyGyro.meanFreq...Y          
  + fBodyGyro.meanFreq...Z         
  + fBodyAccMag.mean..              
  + fBodyAccMag.meanFreq..         
  + fBodyBodyAccJerkMag.mean..      
  + fBodyBodyAccJerkMag.meanFreq.. 
  + fBodyBodyGyroMag.mean..         
  + fBodyBodyGyroMag.meanFreq..    
  + fBodyBodyGyroJerkMag.mean..     
  + fBodyBodyGyroJerkMag.meanFreq..
  + tBodyAcc.std...X                
  + tBodyAcc.std...Y               
  + tBodyAcc.std...Z                
  + tGravityAcc.std...X            
  + tGravityAcc.std...Y             
  + tGravityAcc.std...Z            
  + tBodyAccJerk.std...X            
  + tBodyAccJerk.std...Y           
  + tBodyAccJerk.std...Z            
  + tBodyGyro.std...X              
  + tBodyGyro.std...Y               
  + tBodyGyro.std...Z              
  + tBodyGyroJerk.std...X           
  + tBodyGyroJerk.std...Y          
  + tBodyGyroJerk.std...Z           
  + tBodyAccMag.std..              
  + tGravityAccMag.std..            
  + tBodyAccJerkMag.std..          
  + tBodyGyroMag.std..              
  + tBodyGyroJerkMag.std..         
  + fBodyAcc.std...X                
  + fBodyAcc.std...Y               
  + fBodyAcc.std...Z                
  + fBodyAccJerk.std...X           
  + fBodyAccJerk.std...Y            
  + fBodyAccJerk.std...Z           
  + fBodyGyro.std...X               
  + fBodyGyro.std...Y              
  + fBodyGyro.std...Z               
  + fBodyAccMag.std..              
  + fBodyBodyAccJerkMag.std..       
  + fBodyBodyGyroMag.std..         
  + fBodyBodyGyroJerkMag.std..

## Avg.Value
  Average measurement value by subject, activity, and measurement

## Notes
  + This narrow/long tidy data set is a subset in terms of measurements (columns), using *grep* function to search and keep those containing terms *'mean'* and *'std'*; however, in terms of observations (rows), it's originally a complete combination of training and test sets of the original data set, prior to being summarized to keep only an average measurement value for each combination of Subject, Activity, and Measurement
  + The measurement names in this data set are processed by *make.names* function and thus different than original data set's.
  + Activity goes by name, by joining *activity_labels.txt* file on activity numeric ID, as opposed to numeric IDs in the original data set.
  + Acv.Value is calculated by *ave* function (grouped by Subject, Activity, and Measurement)
  + The data was exported by *write.table* function, in tab-delimited format.
