Getting and Cleaning Data Peer Assessment Codebook
========================================================
# Purpose
The codebook is written as a part of the assignment of Coursera - John Hopkins' Getting and Cleaning Data course to demonstrate the ability of the students taking the course in collecting, working with, and cleaning a data set using R language. The data source was taken from Human Activity Recognition Using Smartphones Data Set which recorded 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Reference: [Human Activity Recognition Using Smartphones Data Set ] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
  

# Variables

Following are the variables that can be found on both dataset1 and dataset2:
## activity
- The name of the activity that the volunteers performed. 
- The list of the values are: STANDING, SITTING, LAYING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS.

## subjectNumber
- The number to identify the volunteers who took the activities.
- In total, there are 30 individuals being identified for the project.

## others
The other variables have been labelled to convey the following meaning:

1. The first letter in the variable indicates whether it is time (denotes by "t" prefix) or frequency (denotes by "f" prefix) domain. For example: **f**BodyGyro-meanFreq()-Z
2. The second part is either "Body" or "Gravity" to indicate the body or gravitational motion components in The sensor acceleration signal. For example: t**Gravity**Acc-min()-X
3. The third part consists of the abbreviations to indicate the instruments used, such as "Acc" (the body linear acceleration measured by accelerometer) and "Gyro" (the angular velocity measured by gyroscope). For example: tBody**Gyro**-std()-Z 
4. The fourth part contains "Jerk" and "Mag" (the magnitude of three-dimensional signals). For example: tGravityAcc**Mag**-energy()
5. The fifth part indicates the function being used to calculate the measurement; this part comes after dash punctuation ("-"). For example: tBodyAcc-**mean()**-Y
6. The last part tells us about the X, Y, Z direction. For example: fBodyAccJerk-meanFreq()-**Z**

The following are the list of functions (as listed from the original source):
* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window
* angle(): Angle between to vectors.


   
# Data
## First Data Set: 
The first dataset contains all the mean and standard deviation of features measurement variables with additional variable of activity.

## Second Data Set:
The second dataset contains the mean of all features measurement variables with additional variables on the activity and the subject number.
  
  
# Transformation
The source of the data was taken from [the course zipped file] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) which then was extracted. The extracted files contain two folders, which are test (for test dataset) and train (for training dataset). There are four files, three of which have the master data of activity and features.

For the first assignment, the following are the procedures to create one tidy dataset:  

1. Subset the data from both test and training datasets into selected variables which contains the mean and standard deviation. The files are named as "X_test.txt" and "x_train.txt" on the respective folders.
2. Combine the variables on "y_test.txt" to the subset of "X_test.txt" file and "y_train.txt" to the subset of "y_train.txt" to get the activity data mapped into the measurement of features data.
3. Merge the rows between test and training datasets.
4. Rename the variables with more descriptive labels.
5. Update the values on activity variable based on the activity master data.  

For the second assignment, the following are the procedures to create another tidy dataset:

1. Combine the columns on "x_test.txt"", "y_test.txt", and "z_test.txt" as test dataset and "x_train.txt"", "y_train.txt", and "z_train.txt" as training dataset.
2. The subsequent steps are quite similar to the first assignment, starting from the merging, variables renaming, and values updating.
3. The final step is aggregating all the measurement variables, groupped by activity and subject.


