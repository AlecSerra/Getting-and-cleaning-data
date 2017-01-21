CodeBook for the tidy dataser


Data Source:
This Data Set has been recollected from the accelerometers from the Samsung Galaxy S smartphone.
The descripcion of the site where the data was obtained is:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Also, the link where the data can be found is the following one:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



Feature Selection:

I refer you to the README and features.txt files in the original dataset to learn more about the feature selection for this dataset. 
And there you will find the follow description:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).


The reasoning behind my selection of features is that the assignment explicitly states "Extracts only the measurements on the mean and standard deviation for each measurement." 
To be complete, I included all variables having to do with mean or standard deviation.
Also, as requested in the assignement, I added the Subject and the Activity. All together creates a Data Set with the following variables:

activity
: (chr) Definition of the activity made, between "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS".
Subject:  (int) Identifier of the Subject submitted to the activity, between 1 and 30.
avg_tBodyAcc_mean: (num) the mean of the Acceleration of the Body in three axial (XYZ), grouped by subject and activity, normalized. Rang values [-1,1].
avg_tBodyAcc_std: (num) the standard deviation of the Acceleration of the Body in three axial (XYZ), grouped by subject and activity, normalized. Rang values [-1,1].
avg_tGravityAcc_mean: (num) the mean of the Gravity Acceleration in three axial (XYZ), grouped by subject and activity, normalized. Rang values [-1,1].
avg_tGravityAcc_std: (num) the standard deviation of the Gravity Acceleration in three axial (XYZ), grouped by subject and activity, normalized. Rang values [-1,1].
avg_tBodyAccJerk_mean: (num) the mean of the Body Linear Acceleration, grouped by subject and activity, normalized. Rang values [-1,1].
avg_tBodyAccJerk_std: (num) the standard deviation of the Body Linear Acceleration, grouped by subject and activity, normalized. Rang values [-1,1].
avg_tBodyGyro_mean: (num) the mean of the Gyroscope 3-axial raw, grouped by subject and activity, normalized. Rang values [-1,1].
avg_tBodyGyro_std: (num) the standard deviation of the Gyroscope 3-axial raw, grouped by subject and activity, normalized. Rang values [-1,1].
avg_tBodyGyroJerk_mean: (num) the mean of the Angular Velocity, grouped by subject and activity, normalized. Rang values [-1,1].
avg_tBodyGyroJerk_std: (num) the standard deviation of the Angular Velocity, grouped by subject and activity, normalized. Rang values [-1,1].
avg_tBodyAccMag_mean: (num) the mean of the Euclidean Transformation of Body Acceleration, grouped by subject and activity, normalized. Rang values [-1,1].
avg_tBodyAccMag_std: (num) the standard deviation of the Euclidean Transformation of Body Acceleration, grouped by subject and activity, normalized. Rang values [-1,1].
avg_tGravityAccMag_mean: (num) the mean of the Euclidean Transformation of Gravity Acceleration, grouped by subject and activity, normalized. Rang values [-1,1].
avg_tGravityAccMag_std: (num) the standard deviation of the Euclidean Transformation of Gravity Acceleration, grouped by subject and activity, normalized. Rang values [-1,1].
avg_tBodyAccJerkMag_mean: (num) the mean of the Euclidean Transformation of the Body Linear Acceleration, grouped by subject and activity, normalized. Rang values [-1,1].
avg_tBodyAccJerkMag_std:  (num) the standard deviation of the Euclidean Transformation of the Body Linear Acceleration, grouped by subject and activity, normalized. Rang values [-1,1].
avg_tBodyGyroMag_mean: (num) the mean of the Euclidean Transformation of the Gyroscope 3-axial raw, grouped by subject and activity, normalized. Rang values [-1,1].
avg_tBodyGyroMag_std: (num) the standard deviation of the Euclidean Transformation of the Gyroscope 3-axial raw, grouped by subject and activity, normalized. Rang values [-1,1].
avg_tBodyGyroJerkMag_mean: (num) the mean of the Euclidean Transformation of the Angular Velocity, grouped by subject and activity, normalized. Rang values [-1,1].
avg_tBodyGyroJerkMag_std: (num) the standard deviation of the Euclidean Transformation of the Angular Velocity, grouped by subject and activity, normalized. Rang values [-1,1].
avg_fBodyAcc_mean: (num) the mean of the Fourier Transformation of the Acceleration of the Body in three axial (XYZ), grouped by subject and activity, normalized. Rang values [-1,1].
avg_fBodyAcc_std: (num) the standard deviation of the Fourier Transformation of the Acceleration of the Body in three axial (XYZ), grouped by subject and activity, normalized. Rang values [-1,1].
avg_fBodyAccJerk_mean: (num) the mean of the Fourier Transformation of the Body Linear Acceleration, grouped by subject and activity, normalized. Rang values [-1,1].
avg_fBodyAccJerk_std: (num) the standard deviation of the Fourier Transformation of the Body Linear Acceleration, grouped by subject and activity, normalized. Rang values [-1,1].
avg_fBodyGyro_mean: (num) the mean of the Fourier Transformation of the Gyroscope 3-axial raw, grouped by subject and activity, normalized. Rang values [-1,1].
avg_fBodyGyro_std: (num) the standard deviation of the Fourier Transformation of the Gyroscope 3-axial raw, grouped by subject and activity, normalized. Rang values [-1,1].
avg_fBodyAccMag_mean: (num) the mean of the Fourier Transformation of the Euclidean Transformation of Body Acceleration, grouped by subject and activity, normalized. Rang values [-1,1].
avg_fBodyAccMag_std: (num) the standard deviation of the Fourier Transformation of the Euclidean Transformation of Body Acceleration, grouped by subject and activity, normalized. Rang values [-1,1].
avg_fBodyBodyAccJerkMag_mean:  (num) the mean of the Fourier Transformation of the Euclidean Transformation of Body Linear Acceleration, grouped by subject and activity, normalized. Rang values [-1,1].
avg_fBodyBodyAccJerkMag_std: (num) the standard deviation of the Fourier Transformation of the Euclidean Transformation of Body Linear Acceleration, grouped by subject and activity, normalized. Rang values [-1,1].
avg_fBodyBodyGyroMag_mean: (num) the mean of the Fourier Transformation of the Euclidean Transformation of the Gyroscope 3-axial raw, grouped by subject and activity, normalized. Rang values [-1,1].
avg_fBodyBodyGyroMag_std: (num) the standard deviation of the Fourier Transformation of the Euclidean Transformation of the Gyroscope 3-axial raw, grouped by subject and activity, normalized. Rang values [-1,1].
avg_fBodyBodyGyroJerkMag_mean: (num) the mean of the Fourier Transformation of the Euclidean Transformation of the Angular Velocity, grouped by subject and activity, normalized. Rang values [-1,1].
avg_fBodyBodyGyroJerkMag_std: (num) the standard deviation of the Fourier Transformation of the Euclidean Transformation of the Angular Velocity, grouped by subject and activity, normalized. Rang values [-1,1].
