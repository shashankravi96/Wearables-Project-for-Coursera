require(dplyr)
runanalysis<-function(folder_path){ #Input argument is the path to the UCI HAR Data folder
  setwd(folder_path) #Sets folder path to the right folder
  setwd("./test") #Goes to test
  X_test<-read.table("X_test.txt") #Reads X_test and y_test
  y_test<-read.table("y_test.txt")
  names(y_test)[1]<-"Activity" #Renaming y_test from V1 to Activity
  sub_test<-read.table("subject_test.txt") #Reading the subjects' numbers 
  names(sub_test)[1]<-"Subject" #Renaming like y_test
  test<-tbl_df(cbind(sub_test,y_test,X_test)) #Binding sub_test, y_test, and X_test, by the columns, 
                                              #in that order to form the testing data set
  setwd("../train") #Goes to train from test
  X_train<-read.table("X_train.txt") #Similar process for train as in test
  y_train<-read.table("y_train.txt")
  names(y_train)[1]<-"Activity"
  sub_train<-read.table("subject_train.txt")
  names(sub_train)[1]<-"Subject"
  train<-tbl_df(cbind(sub_train,y_train,X_train)) #Binds sub_train, y_train, and X_train by the columns 
                                                  #to form the training data set
  wear<-rbind(test,train) #Binds the testing and training sets by the rows to form the 
                          #total amount of data for the 30 subjects
  wear<-arrange(wear,Subject) #Arranges wear by subject from 1 to 30
  setwd("../")
  feat<-read.table("features.txt")
  mean_std_num<-grep("(mean|std)",feat$V2) #Extracts the relevant feature numbers with mean or std in their variable names
  mean_std_num<-c(1,2,mean_std_num+2) #Adjusts the numbers to accomodate for the columns #Subject" and "Activity"
  mean_std<-grep("(mean|std)",feat$V2,value = T) #Extracts relevant title names
  mean_std<-c("Subject","Activity",mean_std) #Adjusts for the first 2 columns
  wear<-select(wear,mean_std_num) #Selects the relevant columns with mean and std
  names(wear)<-mean_std #Renames the variable names with more descriptive names
  act<-read.table("activity_labels.txt") #The next few lines changes the activity names by usingthe 
                                         # activity labels text file, converting the activity column in the table 
                                         # wear to that of type factor and then releveling the factors with the 
                                         # apporpriate activity names
  wear$Activity<-as.factor(wear$Activity)
  l<-levels(act$V2)
  levels(wear$Activity)<-c(l[4],l[6],l[5],l[2],l[3],l[1])
  wear<-group_by(wear,Subject,Activity) #Grouping the table wear by subject first and then activity
  wear_sum<-summarise_all(wear,mean) #Summarising all the columns per activity for each subject
  return(wear_sum)
}