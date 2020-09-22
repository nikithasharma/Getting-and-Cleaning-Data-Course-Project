# Getting-and-Cleaning-Data-Course-Project

## The main R script is the run_analysis.R. 
This file contains the code used to merge the training and test datasets. It then extracts only the measurements for the mean and standard deviation of the datasets and uses descriptive activity names to name them, like Walkingdownstairs,sitting,walkingupstairs etc. 

## The output of 4th step is new_data.txt. 
This is the dataset obtained after correctly naming the descriptive activity names with the measurements. 

## The output of 5th step is new_averages.txt. 
From new_data.txt, a second, tidy data set with the average of each variable for each activity and each subject is created. 
