library(reshape2)
library(plyr)

# step 0: read data files
setwd("/Users/anirutw/Google Drive/DataScience/3 - Getting and Cleaning Data/Project/UCI HAR Dataset")
xtrain <- read.table("train/X_train.txt", header=F, sep="", stringsAsFactors = F)
ytrain <- read.table("train/y_train.txt", header=F, stringsAsFactors = F)
xtest <- read.table("test/X_test.txt", header=F, sep="", stringsAsFactors = F)
ytest <- read.table("test/y_test.txt", header=F, stringsAsFactors = F)

# step 1: merge train & test sets
xdata <- rbind(xtrain, xtest)
ydata <- rbind(ytrain, ytest)
xydata <- cbind(xdata, ydata)

# step 2: extract mean and SD for each measurement
features <- read.table("features.txt", header=F, sep="", stringsAsFactors = F)
columns2keep <- c(grep(".*mean.*", features$V2), grep(".*std.*", features$V2))
xydata <- xydata[,c(columns2keep, ncol(xydata))]

# step 3: name activities
activities <- read.table("activity_labels.txt", header=F, sep="", stringsAsFactors = F)
col_name_act_id <- colnames(xydata)[ncol(xydata)]
colnames(activities)[1] <- col_name_act_id
xydata <- join(xydata, activities, by=col_name_act_id)
# drop activity ID column
xydata <- xydata[,colnames(xydata) != col_name_act_id]

# step 4: label data set with descriptive variable names
features <- read.table("features.txt", header=F, sep="", stringsAsFactors = F)
colnames(xydata)[1:ncol(xydata)-1] <- make.names(features$V2[columns2keep])

# step 5: From data set in step 4, create a second, independent tidy data set
# with the average of each variable for each activity and each subject.
subjtrain <- readLines("train/subject_train.txt")
subjtest <- readLines("test/subject_test.txt")
subjdata <- c(subjtrain, subjtest)
xydata2 <- cbind(xydata, subjdata)
col_name_act_lbl <- colnames(xydata2)[length(xydata2)-1]
col_name_subj <- colnames(xydata2)[length(xydata2)]
xydata2 <- melt(xydata2, id=c(col_name_subj, col_name_act_lbl), measure.vars=make.names(features$V2[columns2keep]))
xydata2 <- ddply(xydata2, c(col_name_subj, col_name_act_lbl, "variable"), summarize, avg=ave(value))
xydata2 <- xydata2 %>% distinct()
colnames(xydata2) <- c("Subject", "Activity", "Measurement", "Avg.Value")
write.table(xydata2, "HAR_tidy_AW.txt", sep="\t", quote = F, row.names=F)

# to read the file back in
# datain <- read.table("HAR_tidy_AW.txt", header = TRUE)
# View(datain)
