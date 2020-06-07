
=================================
Getting and Cleaning Data Project
=================================

Instructions
	The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

	One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	
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

* Tidy dataset: `tidy.txt`


Code Book

`CodeBook.md`: describes the variables, the data, and any transformations or work that you performed to clean up the data

