

# Tidy Data Set of Human Activity Recognition Using Smartphones

## Description

This data set is the product of course 3''s project of Johns Hopkins University''s Data Science Specialization on Cousera.


---

## Details of Data Processing

The project contains the following 5 steps of data processing of the original data set here available on UCI website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

1. Merges the training and the test sets to create one data set.
		First, in training and test data sets, data from y are appened column-wise to that from x using *cbind* function. Then, test set is appended to training set using *rbind* function.
	    
2. Extracts only the measurements on the mean and standard deviation for each measurement.
		*grep* function is used to find measurements containing terms *'mean'* and *'std'*, which results in 79 measurements, out of 561 in the original data set, being extracted.

3. Uses descriptive activity names to name the activities in the data set
		*join* function, from *plyr* package was used to join up activity master data read from *activity_labels.txt* file, in order to obtain activity descriptive labels. Due to the requirement of join function, name of the key column of the activity master data frame was set to be same as that in the main data set for the join to be possible. Lastly, the old activity column, containing numeric activity ID, was dropped.

4. Appropriately labels the data set with descriptive variable names.
		*make.names* function was used to change measurement names, read from *features.txt* file, proper, which were then assigned to the first 79 columns of the data set.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
		*readLines* function was used to read subject IDs from *subject_train.txt* and *subject_test.txt* files, which were combined row-wise and appended column-wise to the main data set.
		*melt* function, from *reshape2* package was used to create a narrow/long tidy data set, with subject and activity as IDs and measurement as variables.
		*ddply* function, from *plyr* package was then used to summarize the data to calculate an average value, using *ave* function, per combination of subject, activity, and measurement.
		*distinct* was required to drop duplicated rows and retain one row per combination of subject, activity, and measurement.
		Column names of the data set is now set with proper descriptive names.
		*write.table* function was used to export data as a tab-delimited text file, named **HAR_tidy_AW.txt**

---

## Data Set Structure

The tidy data set was created based on Hadley Wickham''s tidy data set principle that each row should be an observation, each column should be an a variable (reference: http://vita.had.co.nz/papers/tidy-data.pdf). Per project requirement 5, making subject, activity, and measurement variables yields a tidy data set with the following structure (showing the first 6 records):

| Subject | Activity | Measurement | Avg.Value |
| ------- | -------- | ----------- | --------- |
| 1 | LAYING | tBodyAcc.mean...X | 0.22159824 |
| 1 | LAYING | tBodyAcc.mean...Y | -0.04051395 |
| 1 | LAYING | tBodyAcc.mean...Z | -0.11320355 |
| 1 | LAYING | tGravityAcc.mean...X | -0.24888180 |
| 1 | LAYING | tGravityAcc.mean...Y | 0.70554977 |
| 1 | LAYING | tGravityAcc.mean...Z | 0.44581772 |


## Using this data set

In order to read the data file back into R, use the following code:

    library(dplyr)
    data <- read.table("HAR_tidy_AW.txt", header = TRUE)
    View(data)
