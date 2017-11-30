# Getting-and-Cleaning-Data-Course-Project

This repository holds the scripts, read me and code book for the end of course Assignment for Coursera's Getting and Cleaning Data Course

The run_analysis file does the following:

1. Reads in the test and training datasets, as well as the activity labels and column names
2. Merges the test and training datasets, ensuring that all column names are correctly and appropriately labelled.
3. Extracts only the columns relating to the mean and standard deviation measurements 
4. Uses the activity labels to appropriately label the activities within the merged dataset
5. Creates a new tidy dataset that shows the average of each variable by activity and subject
6. Writes this new table to a location in a shared folder

The outcome of the code is shown in the file tidyset.txt
