#Set de libray used#
library(dplyr)

#Input in a vector all the txt files to read #
file <- c("UCI HAR Dataset\\test\\X_test.txt","UCI HAR Dataset\\test\\Y_test.txt","UCI HAR Dataset\\test\\subject_test.txt","UCI HAR Dataset\\train\\X_train.txt","UCI HAR Dataset\\train\\Y_train.txt","UCI HAR Dataset\\train\\subject_train.txt")

#load the txt files in the R enviromment #
X_test <- read.table(file[1],header=FALSE,dec=".")
Y_test <- read.table(file[2],header=FALSE,dec=".")
subject_test <- read.table(file[3],header=FALSE,dec=".")
X_train <- read.table(file[4],header=FALSE,dec=".")
Y_train <- read.table(file[5],header=FALSE,dec=".")
subject_train <- read.table(file[6],header=FALSE,dec=".")

#Rename the column of Y_xxxx for the merge and the subject just in case"
Y_test <- rename(Y_test, activity = V1)
Y_train <- rename (Y_train, activity = V1)
subject_test <- rename(subject_test, subject = V1)
subject_train <- rename(subject_train, subject = V1)

#For each state (test and train), clip the three datasets together#
test <- cbind(X_test,Y_test,subject_test)
train <- cbind(X_train,Y_train,subject_train)

#Merge the datasets#
pre_analysis <- rbind(train,test)

#Name the header#
features_file <- c("UCI HAR Dataset\\features.txt")
features <- read.table(features_file,header=FALSE)
features_name <- as.character(features$V2)
name <- c("activity","subject")
names <- c(features_name,name)
names(pre_analysis) <- names

#Extract the variables with mean and standard desviation#
mean <- grep("mean()",names(pre_analysis), value = TRUE)
mean <- mean[-grep("Freq",mean)]
std <- grep("std",names(pre_analysis), value = TRUE)
mean_std <- c(mean,std)
c_analysis <- mean_std
c_analysis[67:68] <- names(pre_analysis)[562:563]
analysis <- pre_analysis[,c_analysis]


#Naming the activity#
analysis$activity <- gsub("1","WALKING",analysis$activity)
analysis$activity <- gsub("2","WALKING_UPSTAIRS",analysis$activity)
analysis$activity <- gsub("3","WALKING_DOWNSTAIRS",analysis$activity)
analysis$activity <- gsub("4","SITTING",analysis$activity)
analysis$activity <- gsub("5","STANDING",analysis$activity)
analysis$activity <- gsub("6","LAYING",analysis$activity)

#Group by activity and subject
gb_analysis <- group_by(analysis,activity,subject)

#Obtaining the avg of each variable for each activity and each subject
avg_analysis <- summarize(gb_analysis,avg_tBodyAcc_mean =  mean(`tBodyAcc-mean()-X`), avg_tBodyAcc_mean =  mean(`tBodyAcc-mean()-Y`), avg_tBodyAcc_mean =  mean(`tBodyAcc-mean()-Z`), 
                          avg_tBodyAcc_std =  mean(`tBodyAcc-std()-X`), avg_tBodyAcc_std =  mean(`tBodyAcc-std()-Y`), avg_tBodyAcc_std =  mean(`tBodyAcc-std()-Z`), avg_tGravityAcc_mean =  mean(`tGravityAcc-mean()-X`), 
                          avg_tGravityAcc_mean =  mean(`tGravityAcc-mean()-Y`), avg_tGravityAcc_mean =  mean(`tGravityAcc-mean()-Z`), avg_tGravityAcc_std =  mean(`tGravityAcc-std()-X`), avg_tGravityAcc_std =  mean(`tGravityAcc-std()-Y`), 
                          avg_tGravityAcc_std =  mean(`tGravityAcc-std()-Z`), avg_tBodyAccJerk_mean =  mean(`tBodyAccJerk-mean()-X`), avg_tBodyAccJerk_mean =  mean(`tBodyAccJerk-mean()-Y`), avg_tBodyAccJerk_mean =  mean(`tBodyAccJerk-mean()-Z`), 
                          avg_tBodyAccJerk_std =  mean(`tBodyAccJerk-std()-X`), avg_tBodyAccJerk_std =  mean(`tBodyAccJerk-std()-Y`), avg_tBodyAccJerk_std =  mean(`tBodyAccJerk-std()-Z`), avg_tBodyGyro_mean =  mean(`tBodyGyro-mean()-X`), 
                          avg_tBodyGyro_mean =  mean(`tBodyGyro-mean()-Y`), avg_tBodyGyro_mean =  mean(`tBodyGyro-mean()-Z`), avg_tBodyGyro_std =  mean(`tBodyGyro-std()-X`), avg_tBodyGyro_std =  mean(`tBodyGyro-std()-Y`), 
                          avg_tBodyGyro_std =  mean(`tBodyGyro-std()-Z`), avg_tBodyGyroJerk_mean =  mean(`tBodyGyroJerk-mean()-X`), avg_tBodyGyroJerk_mean =  mean(`tBodyGyroJerk-mean()-Y`), avg_tBodyGyroJerk_mean =  mean(`tBodyGyroJerk-mean()-Z`), 
                          avg_tBodyGyroJerk_std =  mean(`tBodyGyroJerk-std()-X`), avg_tBodyGyroJerk_std =  mean(`tBodyGyroJerk-std()-Y`), avg_tBodyGyroJerk_std =  mean(`tBodyGyroJerk-std()-Z`), avg_tBodyAccMag_mean =  mean(`tBodyAccMag-mean()`), 
                          avg_tBodyAccMag_std =  mean(`tBodyAccMag-std()`), avg_tGravityAccMag_mean =  mean(`tGravityAccMag-mean()`), avg_tGravityAccMag_std =  mean(`tGravityAccMag-std()`), avg_tBodyAccJerkMag_mean =  mean(`tBodyAccJerkMag-mean()`), 
                          avg_tBodyAccJerkMag_std =  mean(`tBodyAccJerkMag-std()`), avg_tBodyGyroMag_mean =  mean(`tBodyGyroMag-mean()`), avg_tBodyGyroMag_std =  mean(`tBodyGyroMag-std()`), avg_tBodyGyroJerkMag_mean =  mean(`tBodyGyroJerkMag-mean()`), 
                          avg_tBodyGyroJerkMag_std =  mean(`tBodyGyroJerkMag-std()`), avg_fBodyAcc_mean =  mean(`fBodyAcc-mean()-X`), avg_fBodyAcc_mean =  mean(`fBodyAcc-mean()-Y`), avg_fBodyAcc_mean =  mean(`fBodyAcc-mean()-Z`), 
                          avg_fBodyAcc_std =  mean(`fBodyAcc-std()-X`), avg_fBodyAcc_std =  mean(`fBodyAcc-std()-Y`), avg_fBodyAcc_std =  mean(`fBodyAcc-std()-Z`), avg_fBodyAccJerk_mean =  mean(`fBodyAccJerk-mean()-X`), 
                          avg_fBodyAccJerk_mean =  mean(`fBodyAccJerk-mean()-Y`), avg_fBodyAccJerk_mean =  mean(`fBodyAccJerk-mean()-Z`), avg_fBodyAccJerk_std =  mean(`fBodyAccJerk-std()-X`), avg_fBodyAccJerk_std =  mean(`fBodyAccJerk-std()-Y`), 
                          avg_fBodyAccJerk_std =  mean(`fBodyAccJerk-std()-Z`), avg_fBodyGyro_mean =  mean(`fBodyGyro-mean()-X`), avg_fBodyGyro_mean =  mean(`fBodyGyro-mean()-Y`), avg_fBodyGyro_mean =  mean(`fBodyGyro-mean()-Z`), 
                          avg_fBodyGyro_std =  mean(`fBodyGyro-std()-X`), avg_fBodyGyro_std =  mean(`fBodyGyro-std()-Y`), avg_fBodyGyro_std =  mean(`fBodyGyro-std()-Z`), avg_fBodyAccMag_mean =  mean(`fBodyAccMag-mean()`), 
                          avg_fBodyAccMag_std =  mean(`fBodyAccMag-std()`), avg_fBodyBodyAccJerkMag_mean =  mean(`fBodyBodyAccJerkMag-mean()`), avg_fBodyBodyAccJerkMag_std =  mean(`fBodyBodyAccJerkMag-std()`), 
                          avg_fBodyBodyGyroMag_mean =  mean(`fBodyBodyGyroMag-mean()`), avg_fBodyBodyGyroMag_std =  mean(`fBodyBodyGyroMag-std()`), avg_fBodyBodyGyroJerkMag_mean =  mean(`fBodyBodyGyroJerkMag-mean()`), 
                          avg_fBodyBodyGyroJerkMag_std = mean(`fBodyBodyGyroJerkMag-std()`))

#Obtain avg_analysis table as a .txt
write.table(avg_analysis,"avg_analysis.txt",row.names = FALSE)