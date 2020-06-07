
Getting and Cleaning Data Project


Input

Data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Analysis Script

`run_analysis.R`: this script takes the input data, and creates the output file 

1. Install package data.table
2. Load libraries
3. Set URL, download and unzip data
4. Extract features from headers of data
5. Gather Train Data
6. Gather Test Data
7. Merge test & train data to generate on dataset
8. Extracts only the measurements on the mean and standard deviation for each measurement for each measurement
9. Use descriptive activity names to name the activities in data
10.Label data set with variable name
11.Clean and create tidy data set to data_tidy.txt


Output

* Tidy dataset: `data_tidy.txt`


Code Book

`CodeBook.md`: describes the variables, the data, and any transformations or work that you performed to clean up the data

