**Codebook.R**


This document describes the variables that will be produced by the R script (run_analysis.R) in the repository

**Signals/Data collected from study on smartphone-based recognition of human activity**

tAcc_XYZ and tGyro_XYZ refers to the  3-axial linear acceleration in the x, y and z axes captured by the accelerometer and gyroscope respectively.

These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 

Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Also, the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

**Variables**

The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

for each signal that was described above.

As such, the suffix of "mean" and "std" that are added to the variables described above refers to the mean value and standard deviation respectively for each corresponding signal described above.'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The addition of the expression "meanof_" for variable 3 - 68 refers to the average of each variable for each activity and each subject. For example, the variable 3 ["meanof_tBodyAcc-mean()-X"] is the average of the mean values of the accelerometer signals in the x-axis.

The first two columns of the dataset produced using the R script consist of the human subject identifier column and the human activity identifier column.

The "subject"" column is number coded from 1 - 30, with each representing a unique subject/person involved in the study. There are 30 human subjects involved in the study. 

The "activity" columns refers to one of six activities, "walking", "walking upstairs","walking downstairs", "sitting", "standing", "laying"

Dataset shows the average of each variable for each activity and each subject.The variables that are found in the dataset produced by the R script are:

1. "subject"                           
2. "activity"                          
3. "meanof_tBodyAcc-mean()-X"           
4. "meanof_tBodyAcc-mean()-Y"          
5. "meanof_tBodyAcc-mean()-Z"           
6. "meanof_tBodyAcc-std()-X"           
7. "meanof_tBodyAcc-std()-Y"           
8. "meanof_tBodyAcc-std()-Z"           
9. "meanof_tGravityAcc-mean()-X"        
10. "meanof_tGravityAcc-mean()-Y"       
11. "meanof_tGravityAcc-mean()-Z"        
12. "meanof_tGravityAcc-std()-X"        
13. "meanof_tGravityAcc-std()-Y"        
14. "meanof_tGravityAcc-std()-Z"        
15. "meanof_tBodyAccJerk-mean()-X"       
16. "meanof_tBodyAccJerk-mean()-Y"      
17. "meanof_tBodyAccJerk-mean()-Z"       
18. "meanof_tBodyAccJerk-std()-X"       
19. "meanof_tBodyAccJerk-std()-Y"        
20. "meanof_tBodyAccJerk-std()-Z"       
21. "meanof_tBodyGyro-mean()-X"          
22. "meanof_tBodyGyro-mean()-Y"         
23. "meanof_tBodyGyro-mean()-Z"          
24. "meanof_tBodyGyro-std()-X"          
25. "meanof_tBodyGyro-std()-Y"           
26. "meanof_tBodyGyro-std()-Z"          
27. "meanof_tBodyGyroJerk-mean()-X"      
28. "meanof_tBodyGyroJerk-mean()-Y"     
29. "meanof_tBodyGyroJerk-mean()-Z"      
30. "meanof_tBodyGyroJerk-std()-X"      
31. "meanof_tBodyGyroJerk-std()-Y"       
32. "meanof_tBodyGyroJerk-std()-Z"      
33. "meanof_tBodyAccMag-mean()"          
34. "meanof_tBodyAccMag-std()"          
35. "meanof_tGravityAccMag-mean()"       
36. "meanof_tGravityAccMag-std()"       
37. "meanof_tBodyAccJerkMag-mean()"      
38. "meanof_tBodyAccJerkMag-std()"      
39. "meanof_tBodyGyroMag-mean()"         
40. "meanof_tBodyGyroMag-std()"         
41. "meanof_tBodyGyroJerkMag-mean()"     
42. "meanof_tBodyGyroJerkMag-std()"     
43. "meanof_fBodyAcc-mean()-X"           
44. "meanof_fBodyAcc-mean()-Y"          
45. "meanof_fBodyAcc-mean()-Z"           
46. "meanof_fBodyAcc-std()-X"           
47. "meanof_fBodyAcc-std()-Y"            
48. "meanof_fBodyAcc-std()-Z"           
49. "meanof_fBodyAccJerk-mean()-X"       
50. "meanof_fBodyAccJerk-mean()-Y"      
51. "meanof_fBodyAccJerk-mean()-Z"       
52. "meanof_fBodyAccJerk-std()-X"       
53. "meanof_fBodyAccJerk-std()-Y"        
54. "meanof_fBodyAccJerk-std()-Z"       
55. "meanof_fBodyGyro-mean()-X"          
56. "meanof_fBodyGyro-mean()-Y"         
57. "meanof_fBodyGyro-mean()-Z"          
58. "meanof_fBodyGyro-std()-X"          
59. "meanof_fBodyGyro-std()-Y"           
60. "meanof_fBodyGyro-std()-Z"          
61. "meanof_fBodyAccMag-mean()"          
62. "meanof_fBodyAccMag-std()"          
63. "meanof_fBodyBodyAccJerkMag-mean()"  
64. "meanof_fBodyBodyAccJerkMag-std()"  
65. "meanof_fBodyBodyGyroMag-mean()"     
66. "meanof_fBodyBodyGyroMag-std()"     
67. "meanof_fBodyBodyGyroJerkMag-mean()" 
68. "meanof_fBodyBodyGyroJerkMag-std()"


