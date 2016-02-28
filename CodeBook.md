# Code Book for Getting and Cleaning Data, Final Project #

The run_analysis.r script produces a wide tidy dataframe with 68 columns. The first two columns identify the subject and activity. The remaining 66 columns represent a subset of the 561 feature variables contained in the original dataset, namely those that contain a mean or standard deviation.<br>
The columns are defined as follows (values in brackets are column numbers):

[1] <b>subject</b><br>
Integer value representing the code for the subject performing the activity.<br>                                              
[2] <b>activity</b><br>
character variable denoting the activity. The Possible values are:<br>
'walking'<br>
'walkingupstairs'<br>
'walkingdownstairs'<br>
'sitting'<br>
'standing'<br>
'laying'<br>

Each of the remaining columns contain floating point values. Each value in the column represents the mean of all the measurements of that feature in the combined test and training datasets for the given subject and activity.

<p>                                             
[3-5] <b>BodyAcceleration_Mean_X,Y,Z_axis</b><br/>  
Mean 3-axis time domain body acceleration derived from the total acceleration by a 0.3Hz low-pass Butterworth filter.<br>                        
[6-8] <b>BodyAcceleration_Std_Dev_X,Y,Z_axis</b><br>                      
Standard Deviations of the 3-axis body acceleration.<br>                     
[9-11] <b>GravityAcceleration_Mean_X,Y,Z_axis</b><br>
Mean Gravity component of the total 3-axis acceleration derived from the total acceleration using a 0.3 Hz low-pass Butterworth filter.<br>                        
[12-14]<b>GravityAcceleration_Std_Dev_X,Y,Z_axis</b><br>
Standard deviations of the 3-axis Gravity acceleration.<br>                   
[15-17] <b>BodyAccelerationJerk_Mean_X,Y,Z_axis</b><br>                      
[18-20]<b>BodyAccelerationJerk_Std_Dev_X,Y,Z_axis</b><br>
Mean and standard deviation of the 3-axis Body Acceleration Jerk (time derivative of acceleration)<br>                  
[21-23] <b>BodyGyro_Mean_X,Y,Z_axis</b><br>                                  
[24-26]<b>BodyGyro_Std_Dev_X,Y,Z_axis</b><br>
Mean and standard deviation for the 3-axis gyroscope measurements.<br>                              
[27-29] <b>BodyGyroJerk_Mean_X,Y,Z_axis</b><br>                              
[30-32]<b>BodyGyroJerk_Std_Dev_X,Y,Z_axis</b><br>
Mean and Standard Deviations for the 3-axis gyroscope jerk measurements.<br>                          
[33] <b>BodyAccelerationMagnitude_Mean</b><br>                        
[34]<b>BodyAccelerationMagnitude_Std_Dev</b><br>
Mean and Standard deviation of the vector magnitude of the body acceleration.<br>                    
[35] <b>GravityAccelerationMagnitude_Mean</b><br>                     
[36]<b>GravityAccelerationMagnitude_Std_Dev</b><br>
Mean and Standard deviation of the vector magnitude of the gravity acceleration.<br>                 
[37] <b>BodyAccelerationJerkMagnitude_Mean</b><br>                    
[38]<b>BodyAccelerationJerkMagnitude_Std_Dev</b><br>
Mean and Standard deviation of the vector magnitude of the body acceleration jerk.<br>                
[39] <b>BodyGyroMagnitude_Mean</b><br>                                
[40]<b>BodyGyroMagnitude_Std_Dev</b><br>                            
Mean and Standard deviation of the vector magnitude of the gyroscope reading.<br>
[41] <b>BodyGyroJerkMagnitude_Mean</b><br>                            
[42]<b>BodyGyroJerkMagnitude_Std_Dev</b><br>                        
Mean and Standard deviation of the vector magnitude of the gyroscope jerk.<br>
<br>The remaining columns are frequency domain versions of the already listed time domain variables calculated with a Fast Fourier Transform<br> <br>

[43-45]<b>Freq_Domain_BodyAcceleration_Mean_X,Y,Z_axis</b><br>              
[46-48]<b>Freq_Domain_BodyAcceleration_Std_Dev_X,Y,Z_axis</b><br>          
[49-51] <b>Freq_Domain_BodyAccelerationJerk_Mean_X,Y,Z_axis</b><br>          
[52-54]<b>Freq_Domain_BodyAccelerationJerk_Std_Dev_X,Y,Z_axis</b><br>      
[55-57] <b>Freq_Domain_BodyGyro_Mean_X,Y,Z_axis</b><br>                      
[58-60]<b>Freq_Domain_BodyGyro_Std_Dev_X,Y,Z_axis</b><br>                  
[61] <b>Freq_Domain_BodyAccelerationMagnitude_Mean</b><br>            
[62]<b>Freq_Domain_BodyAccelerationMagnitude_Std_Dev</b><br>        
[63] <b>Freq_Domain_BodyBodyAccelerationJerkMagnitude_Mean</b><br>    
[64]<b>Freq_Domain_BodyBodyAccelerationJerkMagnitude_Std\_Dev</b><br>
[65] <b>Freq_Domain_BodyBodyGyroMagnitude_Mean</b><br>                
[66]<b>Freq_Domain_BodyBodyGyroMagnitude_Std_Dev</b><br>            
[67] <b>Freq_Domain_BodyBodyGyroJerkMagnitude_Mean</b><br>            
[68]<b>Freq_Domain_BodyBodyGyroJerkMagnitude_Std_Dev</b><br> 
</p>