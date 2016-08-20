# Getting-CleaningData_Week4Assignment1


The following submission consists of the

1. README.md file (this file)
2. An R script (run_analysis.R file)
3. A Codebook.md file 

The README file aims to briefly explains the different parts of the submission in the github repository.

**CodeBook.md**

The codebook explains the various variables produced by the dataset. The codebook explains the variables in the raw dataset, as well the transformed variables that are produced in the dataset that is produced by the R script.

**run_analysis.R**

The run_analysis.R file contains the R script that will download the raw dataset on smartphone-based recognition of human activites from the UCI machine learning repository.The R script will: 

1. Merge the training and the test sets to create one data set.The R script downloads the test subject, human activity identifier number and a vector of 561 features captured in the study for both the training and test datasets and combines them using the rbind (binding of rows) and cbind (binding of columns) commands.   

2. Extract the columns from the 561 columns that provide the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set; i.e. replaces the human activity identified number with string descriptions for e.g. "walking" or "walking upstairs etc"

4. Appropriately labels the data set with descriptive variable names.The R script uses the column labels provided by the UCI database to appropriately name the columns in the dataset.  

5. Export the newly transformed dataset to a .txt file, where this new dataset consists of the average of each variable for each activity and each subject.This is done using the dplyr package, which provides the summarize and group_by functions to allow for quick computation of the average of each variable by subject and by activity.

The final dataset should consists of 180 observations and 68 variables, of which the first two columns are the subject and activity columns, and 66 columns containing the average of the standard deviation and mean of each measurement collected in the study on smartphone recognition of human activity.



 
