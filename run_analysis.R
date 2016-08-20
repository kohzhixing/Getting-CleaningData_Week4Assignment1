##Getting and Cleaning Data Assignment Week 4 
# Using data from UCI Machine Learning Repository on human body activity recognition

setwd("C:/Users/NUS/Desktop/rdata/UCI HAR Dataset/test")
#test is subject number in the test data set
test<-read.table("subject_test.txt")
# xtest is  561-feature vector with time and frequency domain variables in the test data set
xtest<-read.table("X_test.txt")
#ytest contains number from 1-6, with each representing 1 of the six activities performed by volunteers in the test data set
ytest<-read.table("Y_test.txt")

setwd("C:/Users/NUS/Desktop/rdata/UCI HAR Dataset/train")
#test is subject number in the training data set
train<-read.table("subject_train.txt")
# xtest is  561-feature vector with time and frequency domain variables in the training data set
xtrain<-read.table("X_train.txt")
ytrain<-read.table("Y_train.txt")

# binding the subject, activity and 561 vector features into one data frame for both test and training datasets
test1<-cbind(test,ytest,xtest)
train1<-cbind(train,ytrain,xtrain)

# Step 1 appending the training and test datasets together into one combined data frame 
combined<-rbind(train1, test1)

setwd("C:/Users/NUS/Desktop/rdata/UCI HAR Dataset")

#Step 4 using the names from the features.txt to label the 561 columns
features<-read.csv("features.txt",header=FALSE,sep=" ",stringsAsFactors=F)
names(combined)<-c("subject","activity",features$V2)

# Step 2 extracts only the measurements on the mean and standard deviation for each measurement, only mean and std values were included, but meanFreq values were excluded
# Alternatively, meanFreq values can be included as well, but the code below assumes that only mean and std dev values are required 
combined1<-combined[,grep ("mean|std", names(combined))]->combined1
combined1<-cbind(combined[,1:2],combined1)
combined1[,-grep("freq",tolower(names(combined1)))]->combined1

#Step 3 Using descriptive activity names to name the activities in the data set
combined1$activity[combined1$activity==1]<-"walking"
combined1$activity[combined1$activity==2]<-"walking upstairs"
combined1$activity[combined1$activity==3]<-"walking downstairs"
combined1$activity[combined1$activity==4]<-"sitting"
combined1$activity[combined1$activity==5]<-"standing"
combined1$activity[combined1$activity==6]<-"laying"

library(dplyr)
combined1<-arrange(combined1,subject)
combined1$activity<-as.factor(combined1$activity)

# Step 5 create a second, independent tidy data set with the average of each variable for each activity and each subject.
by_subject_activity<-group_by(combined1,subject,activity)
combined2<-summarise_each(by_subject_activity,funs(mean))

# include the expression "meanof_" to imply that values in this second dataset refers are all average values of each variable by subject and activity.
names(combined2)[-1:-2]<-paste("meanof_",names(combined2)[-1:-2],sep="")

# export tidy dataset into a txt file
write.table(combined2,"Getting&CleaningData_Week4Assignment_dataset.txt")

