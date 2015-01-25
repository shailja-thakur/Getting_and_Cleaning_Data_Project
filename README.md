###Getting and Cleaning Data Course Project

##This file describes how the script run_analysis.R works:
============================
*	First, unzip the dataset from link and rename the folder with "data".
*	"data" folder and run_analysis.R script should be in the same directory.
*	Seconf, use source("run_analysis.R") command in RStudio.
*	Third,You will find two output files generated in the current working directory namely: merged_labelled.txt, which contains a dataframe of dimension 10299x68 and tidy\_dataset\_with\_the\_averages\_by\_act\_sbjct.txt, which contains the resulting tidy dataframe of dimension 180x68.
*	Finally, use the read.table("tidy\_dataset\_with\_the\_averages\_by\_act\_sbjct.txt") RStudio command to read the file. Since there are 6 activities and 30 subjects and we need to have averages for each subject and each activity combination, thus there are a total of 180 rows for each combination of subject and activity.
