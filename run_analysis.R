##Getting and Cleaning Data Assignment Week 4 
# Using data from UCI Machine Learning Repository on human body activity recognition

setwd("C:/Users/NUS/Desktop/rdata/UCI HAR Dataset/test")
#test is subject number in the test data set
test<-read.table("subject_test.txt")
# xtest is  561-feature vector with time and frequency domain variables in the test data set
xtest<-read.table("X_test.txt")
#ytest contains number from 1-6, with each representing 1 of the six activities performed by volunteers in the test data set
ytest<-read.table("Y_test.txt")

setwd("C:/Users/NUS/Desktop/rdata/UCI HAR Dataset/test/Inertial Signals")
#body_acc_xtest, body_acc_ytest and body_acc_ztest represents the 3 axes of activity captured by the accelerometer in the test data set
body_acc_xtest<-read.table("body_acc_x_test.txt")
body_acc_ytest<-read.table("body_acc_y_test.txt")
body_acc_ztest<-read.table("body_acc_z_test.txt")

#body_gyro_xtest, body_gyro_ytest and body_gyro_ztest represents the 3 axes of activity captured by the accelerometer in the test data set
body_gyro_xtest<-read.table("body_gyro_x_test.txt")
body_gyro_ytest<-read.table("body_gyro_y_test.txt")
body_gyro_ztest<-read.table("body_gyro_z_test.txt")

#total_acc_xtest, total_acc_ytest and total_acc_ztest represents sensor acceleration signal for the 3 axes of activity in the test data set
total_acc_xtest<-read.table("total_acc_x_test.txt")
total_acc_ytest<-read.table("total_acc_y_test.txt")
total_acc_ztest<-read.table("total_acc_z_test.txt")

setwd("C:/Users/NUS/Desktop/rdata/UCI HAR Dataset/train")
#test is subject number in the training data set
train<-read.table("subject_train.txt")
# xtest is  561-feature vector with time and frequency domain variables in the training data set
xtrain<-read.table("X_train.txt")
ytrain<-read.table("Y_train.txt")

setwd("C:/Users/NUS/Desktop/rdata/UCI HAR Dataset/train/Inertial Signals")
#body_acc_xtest, body_acc_ytest and body_acc_ztest represents the 3 axes of activity captured by the accelerometer in the training data set
body_acc_xtrain<-read.table("body_acc_x_train.txt")
body_acc_ytrain<-read.table("body_acc_y_train.txt")
body_acc_ztrain<-read.table("body_acc_z_train.txt")

#body_gyro_xtest, body_gyro_ytest and body_gyro_ztest represents the 3 axes of activity captured by the accelerometer in the training data set
body_gyro_xtrain<-read.table("body_gyro_x_train.txt")
body_gyro_ytrain<-read.table("body_gyro_y_train.txt")
body_gyro_ztrain<-read.table("body_gyro_z_train.txt")

#total_acc_xtest, total_acc_ytest and total_acc_ztest represents sensor acceleration signal for the 3 axes of activity in the training data set
total_acc_xtrain<-read.table("total_acc_x_train.txt")
total_acc_ytrain<-read.table("total_acc_y_train.txt")
total_acc_ztrain<-read.table("total_acc_z_train.txt")

#binding all the columns of the test dataset into a dataframe
combinetest<-cbind(test, ytest,xtest,body_acc_xtest,body_acc_ytest,body_acc_ztest,body_gyro_xtest,body_gyro_ytest,body_gyro_ztest,total_acc_xtest,total_acc_ytest,total_acc_ztest)

#binding all the columns of the training dataset into a dataframe
combinetrain<-cbind(train,ytrain,xtrain,body_acc_xtrain,body_acc_ytrain,body_acc_ztrain,body_gyro_xtrain,body_gyro_ytrain,body_gyro_ztrain,total_acc_xtrain,total_acc_ytrain,total_acc_ztrain)

#appending the two dataframes into one single dataframe
combined<-rbind(combinetest,combinetrain)

#generating column names for each of the columns in the single combined data frame 
feature<-paste("feature",1:561, sep="")
x_accelerator<-paste("x_acc_reading", 1:128,sep="")
y_accelerator<-paste("y_acc_reading", 1:128,sep="")
z_accelerator<-paste("z_acc_reading", 1:128,sep="")
x_gyroscope<-paste("x_gyro_reading",1:128,sep="")
y_gyroscope<-paste("y_gyro_reading",1:128,sep="")
z_gyroscope<-paste("z_gyro_reading",1:128,sep="")
x_accelerator_signal<-paste("x_acc_signal", 1:128,sep="")
y_accelerator_signal<-paste("y_acc_signal", 1:128,sep="")
z_accelerator_signal<-paste("z_acc_signal", 1:128,sep="")
names(combined)<-c("subject","activity",feature,x_accelerator,y_accelerator,z_accelerator,x_gyroscope,y_gyroscope,z_gyroscope,x_accelerator_signal,y_accelerator_signal,z_accelerator_signal)


# by Subject AND by Activity
library(dplyr)
#sort by ascending order for subject column and activity column
combined<-arrange(combined,subject,activity)
#using the group_by function, group combined data frame by both subject and by activity
by_subject_activity<-group_by(combined,subject,activity)

# generate mean and standard deviation by subject and activity 
data2<-summarise_each(by_subject_activity,funs(mean))
data3<-summarise_each(by_subject_activity,funs(sd))

# generating names for the columns of mean and standard deviation values
name2<-paste("mean_",names(data2)[-1:-2],sep="")
name3<-paste("sd_",names(data3)[-1:-2],sep="")
names(data2)<-c("subject","activity",name2)
names(data3)<-c("subject","activity",name3)

#merge the two dataframes containing mean and standard deviation values from the two dataframes(data2 and data3)
newtable<-merge(data2,data3,by=c("subject","activity"))
#rearranging the columns so that mean and standard deviation values for each variable is side by side in the dataframe
a<-3:1715
b<-1716:3428
g<-c(rbind(a,b))
g<-c(1,2,g)
newtable1<-newtable[,g]
#sort dataframe with mean and standard deviation values by subject and activity in ascending order
# mean and standard deviation values for each subject and activity i.e. 30subjects x 6 activities = 180 rows
newtable1<-arrange(newtable1,subject,activity)
#writing the dataset to a txt file for submission
write.table(newtable1,file="Getting&CleaningData_Week4Assignment.txt", row.names=F,sep=";")


###Only by Subject
#sort by only subject using the dplyr/group_by function
by_subject<-group_by(combined,subject)
#generate mean and standard deviation for each variable
data4<-summarise_each(by_subject,funs(mean))
data5<-summarise_each(by_subject,funs(sd))
#generating names for the columns in dataframe
name4<-paste("mean_",names(data4)[-1:-2],sep="")
name5<-paste("sd_",names(data5)[-1:-2],sep="")
names(data4)<-c("subject","activity",name4)
names(data5)<-c("subject","activity",name5)
#removing unwanted columns
data4[,2]<-NULL
data5[,2]<-NULL
#merging the mean and standard deviation values from the two dataframes (data 4 and data5)
newtable2<-merge(data4,data5,by="subject")
#rearranging the columns so that the mean and standard deviation columns for each variable are side by side in the dataframe.
x<-2:1714
y<-1715:3427
z<-c(rbind(x,y))
z<-c(1,z)
newtable2<-newtable2[,z]



###Only by Activity
#sort by only activity using the dplyr/group_by function
by_activity<-group_by(combined,activity)
#generate mean and standard deviation for each variable
data6<-summarise_each(by_activity,funs(mean))
data7<-summarise_each(by_activity,funs(sd))
#generating names for the columns in dataframe
name6<-paste("mean_",names(data6)[-1:-2],sep="")
name7<-paste("sd_",names(data7)[-1:-2],sep="")
names(data6)<-c("activity","subject",name6)
names(data7)<-c("activity","subject",name7)
#removing unwanted columns
data6[,2]<-NULL
data7[,2]<-NULL
#merging the mean and standard deviation values from the two dataframes (data 6 and data7)
newtable3<-merge(data6,data7,by="activity")
#rearranging the columns so that the mean and standard deviation columns for each variable are side by side in the dataframe.
x<-2:1714
y<-1715:3427
z<-c(rbind(x,y))
z<-c(1,z)
newtable3<-newtable3[,z]

