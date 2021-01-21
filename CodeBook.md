# Getting and Cleaning Data Course Project

## download data
# I downloaded the data directly from the link and the zip I saved in a folder. I created a project in R.


## Description of variables and design


# The files are "train" and "test", each of them has associated "subject", "activity" and "features" files. For this reason you have to download these three sets of files. On the other hand, "features" are all the measures denoted with "X" and activity is all the measures denoted with "Y"

# Load files

# Subject Files

# Activiti files

# Feature files

## 1.	Merges the training and the test sets to create one data set.

# Now we merge the data of "train" and "test" joining the data tables by the rows

# Let's name the variables

# Merge of totals the columns to create the data frame, for the total data

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# Extract the mean and standard deviation of each variable

# Name of subset of "Feature" measures with mean and standard deviation. What will be done is to select the variables that have mean and deviation

# Extract a Subset of the data from the data frame by selected feature names


## 3.Uses descriptive activity names to name the activities in the data set


# For setnames load data.table


## 4. Appropriately label your data set with descriptive variable names.

# Variable names are abbreviated, for example, 
# t = time
# Acc = Accelerometer
# Gyro = Gyroscope
# f = frequency
# Mag = Magnitude
# BodyBody = Body
# What is asked is to replace them with the full names in the data frame


## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

# Load the package dplyr

# A new data set is created grouping by subject and activity, then a summary is requested with the funs function, finally a new table is written with the write.table function.


