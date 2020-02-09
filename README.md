# Wearables Project
### A project for the course Getting and Cleaning Data. A part of the Data Science Specialization by John Hopkins University.
 
The script runanalysis.R has a function by the same name that takes in the folder path to the [UCI HAR dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) on your computer, and performs some basic structural analysis that cleans up the data to generate a tidy dataset. The following repo assumes that you've had a look at the README file in that folder. 

* We first combine the testing and training data sets, and add in the subject and activity numbers for each observation. 
* Second, select the variables that only convey the mean or standard deviation of a physical quantity that was measured. 
* Third, give the variables the aprropriate names as in the file features.txt. 
* Fourth, group the data set according to subject and activity. 
* Fifth, summarise the combined test and training datasets, by subject and activity, to display the mean of all extracted variables. 

Commentary on how it does so is provided in more detail in the script itself. 
 

