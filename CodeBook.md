# CodeBook for the dataset wear_sum_mean.csv

The final product is a tidy data set summarising certain physical quantities in the [UCI HAR dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and the following codebook is in reference to that data set. 

The observations, labels of the activity and the subject numbers from 1-30 are combined first for both the testing and training data respectively, for example, subject_test, y_test, and X_test. 

The testing and training data are then combined to form the dataset wear. Which is arranged according to the subject number. 

After which, the activity labels have been changed from numbers 1-6, to that in activity_labels.txt, and only the columns that represent the mean or standard deviation of a particular physical quantity are selected, and these variables are given their appropriate names, as in variables_wear.txt.

Then, the final product is a tidy dataset with means of all the remaining columns grouped first by activity and then by subject. The final data set is wear_sum_mean.csv. 
