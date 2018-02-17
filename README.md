
# Tidy Data Set of Human Activity Recognition Using Smartphones

## Description

This data set is the product of course 3''s project of Johns Hopkins University''s Data Science Specialization on Cousera.


---

## Details of Data Processing

The project contains the following 5 steps of data processing of the original data set here available on UCI website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


---

## Data Set Structure

The tidy data set was created based on Hadley Wickham''s tidy data set principle that each row should be an observation, each column should be an a variable (reference: http://vita.had.co.nz/papers/tidy-data.pdf). Per project requirement 5, making subject, activity, and measurement variables yields a tidy data set with the following structure (showing the first 6 records):

| Subject | Activity | Measurement | Avg.Value |
| ------- | -------- | ----------- | --------- |
| 1 | LAYING | tBodyAcc.mean...X | 0.27995645 |
| 1 | LAYING | tBodyAcc.mean...Y | -0.01591905 |
| 1 | LAYING | tBodyAcc.mean...Z | -0.10786256 |
| 1 | LAYING | tGravityAcc.mean...X | 0.94355044 |
| 1 | LAYING | tGravityAcc.mean...Y | -0.18421941 |
| 1 | LAYING | tGravityAcc.mean...Z | -0.05996729 |


## Using this data set

In order to read the data file back into R, use the following code:

    library(dplyr)
    data <- read.table("HAR_tidy_AW.txt", header = TRUE)
    View(data)
