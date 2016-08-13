# Getting-CleaningData_Week4Assignment1
##Codebook
**subject** 

subject refers to subject in the human activity recognition experiments carried out with 30 volunteers. subject is coded 1-30 as there are 30 volunteers. Each number refers to a unique volunteer

**activity**

activity refers to 1 of 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
activity is coded 1-6, with each number representing one unique human activity.

**mean_feature**

mean_feature refers to the mean for each of the 561 vector features capturing by calculating variables from the time and frequency domain for each subject and each activity

**sd_feature**

sd_feature refers to the standard deviation for ach of the 561 vector features capturing by calculating variables from the time and frequency domain for each subject and each activity


**mean_x_acc_reading and sd_x_acc_reading**

mean_x_acc_reading and sd_x_acc_reading refers respectively to the mean and standard deviation of each accelerator reading along the x-axis.

**mean_y_acc_reading and sd_y_acc_reading**

mean_y_acc_reading and sd_y_acc_reading refers respectively to the mean and standard deviation of each accelerator reading along the y-axis.

**mean_z_acc_reading and sd_z_acc_reading**

mean_z_acc_reading and sd_z_acc_reading refers respectively to the mean and standard deviation of each accelerator reading along the z-axis.

**mean_x_gyro_reading and sd_x_gyro_reading**

mean_x_acc_reading and sd_x_acc_reading refers respectively to the mean and standard deviation of each gyroscope reading along the x-axis.

**mean_y_gyro_reading and sd_y_gyro_reading**

mean_y_acc_reading and sd_y_acc_reading refers respectively to the mean and standard deviation of each gyroscope reading along the y-axis.

**mean_z_gyro_reading and sd_z_gyro_reading**

mean_z_acc_reading and sd_z_acc_reading refers respectively to the mean and standard deviation of each gyroscope reading along the z-axis.

**mean_x_acc_signal and sd_x_acc_signal**

mean_x_acc_signal and sd_x_acc_signal refers respectively to the mean and standard deviation of each sensor acceleration signal reading along the x-axis.

**mean_y_acc_signal and sd_y_acc_signal**

mean_y_acc_signal and sd_y_acc_signal refers respectively to the mean and standard deviation of each sensor acceleration signal reading along the y-axis.

**mean_z_acc_signal and sd_z_acc_signal**

mean_z_acc_signal and sd_z_acc_signal refers respectively to the mean and standard deviation of each sensor acceleration signal reading along the z-axis.


##data manipulation
Each column of data from the test and training dataset are loaded into R and binded together.
The binded test dataset and the binded training dataset are then appended together.
Using the dplyr/summarize function, the mean and standard deviation of each variable in the dataset are computed by both subject and activity and then assembled into a tidy dataset.
