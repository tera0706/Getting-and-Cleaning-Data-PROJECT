# Getting-and-Cleaning-Data-PROJECT
Project made for course: Getting and Cleaning Data

This is script merging and sorting data. Data are provided under this link:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

To perform analysis you have to unzip data to your working directory. At the end you should have a folder named "UCI HAR Dataset".  It is important to not change any names because it will cause problems with reading data from directory!
Do not change anything from files you abtained. 

You also need to put the script to your working directory to perform analysis. 

Since you've don previous steps you can run analysis using comand:
source("run_analysis.R")
run_analysis()

Note that any initial values are required. 

As the result you will obtain tidy data set with the average of each variable for each activity and each subject. If you wish to obtain the merged data without calculating averages you have to change the data name at the least code line from "tidy_data" to "data".


