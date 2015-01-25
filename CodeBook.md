###Getting and Cleaning Data Course Project

##This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.
===================================================
Source of data:
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data description:
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The run_analysis.R script performs the following steps to clean the data:
        
* Merge the train and test dataset to create one data set. Namely,
        train/X\_train.txt and test/X\_test.txt merged and resulting data set stored in a variable "X" of dimension 10299x561("Number of instance":10299 and "Number of attributes": 561). train/subject_train.txt and test/subject\_test.txt are merged and resultind data set stored in variable "Y" of dimension 10299x1. train/y\_train.txt and test/y\_test.txt merged and resulting data set stored in variable "Y".
       
* Read the features.txt file from the "/data" folder and store the data in a variable called features. We only extract the measurements on the mean and standard deviation. This results in a 66 indices list.Since, 66 out of 561 attributes have measures of mean and standard deviation. We get a subset of X with the 66 corresponding columns. 
        Clean the column names of the subset. We remove the "()" and "-" symbols in the names.

* To provide descriptive names to the activities, read the activity_labels.txt file from the "./data"" folder and store the data in a variable called activities.
        Clean the activity names in the second column of activity. We first make all names to lower cases. If the name has an underscore between letters, we remove the underscore.
* Transform the values of Y according to the activity data frame.
* Combine the X, Y and S by column to get a new cleaned 10299x68 data frame, cleanedData. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.
* Write the cleanedData out to "merged_labbelled.txt" file in current working directory.
* Finally, generate an independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the result data frame and performing the two for-loops, we get a 180x68 data frame.
Write the result out to "tidy\_dataset\_with\_the\_averages\_by\_act\_sbjct.txt" file in current working directory.
