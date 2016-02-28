run_analysis <- function() {
    ################################################################
    # run_analysis.R  
    #
    # final project for "Getting and Cleaning Data"
    #
    # This script produces a tidy data set containing the mean of measurements on the
    # mean and standard deviation of the merged original test and training 
    # data sets grouped by subject and activity. 
    #
    # see README.md for details on the operation of the script and instructions for
    # verifying operation
    #
    # see CodeBook.md for a description of the variables
    
    
    #load required libraries
    library(dplyr)
    library(data.table)
    
    #check for the existence of all required files
    print("Checking files....")
    if (!file.exists(file.path("activity_labels.txt"))) 
    {stop("Cannot Find Activity Labels")}
    if (!file.exists(file.path("train","y_train.txt"))) 
    {stop("Cannot Find Training Activity File")}
    if (!file.exists(file.path("train","subject_train.txt"))) 
    {stop("Cannot Find Training Subject File")}
    if (!file.exists(file.path("test","y_test.txt"))) 
    {stop("Cannot Find Test Activity File")}
    if (!file.exists(file.path("test","subject_test.txt"))) 
    {stop("Cannot Find Test Subject File")}
    if (!file.exists("features.txt"))
    {stop("Cannot Find Features File")}
    if (!file.exists(file.path("train","X_train.txt")))
    {stop("Cannot Find Training Feature Data File")}
    if (!file.exists(file.path("test","X_test.txt")))
    {stop("Cannot Find Test Feature Data File")}
    
    print("All required Data Files Found...")
    
    ###################################################################
    #read the activity label data and clean it up a bit by
    #removing underscores and putting into lower case
    activity <- fread("activity_labels.txt")
    names(activity) = c("actno", "activity")
    activity$activity = tolower(activity$activity)
    activity$activity = sub("_","",activity$activity)
    
    ###################################################################
    #read the training set activity and subject data
    train_activity <- fread(file.path("train","y_train.txt"))
    names(train_activity) <- "actno"
    #now create a data frame that includes the activity labels
    lbl_train_activity <- mutate(train_activity, lblactivity = activity$activity[actno])
    #read the training subject data and name it
    train_subj = fread(file.path("train","subject_train.txt"))
    names(train_subj) = "subject"
    #merge the subject and activity training data frames
    subj_act_train = cbind(train_subj,lbl_train_activity)
    
    #now repeat for the test activity and subject data
    
    ###################################################################
    #read the test set activity and subject data
    test_activity <- fread(file.path("test","y_test.txt"))
    names(test_activity) <- "actno"
    #now create a data frame that includes the activity labels
    lbl_test_activity <- mutate(test_activity, lblactivity = activity$activity[actno])
    #read the test subject data and name it
    test_subj <- fread(file.path("test","subject_test.txt"))
    names(test_subj) = "subject"
    #merge the subject and activity training data frames
    subj_act_test = cbind(test_subj,lbl_test_activity)
    
    ###################################################################
    # get appropriate feature columns
    # see CodeBook.md for a discussion of selected feature columns and names
    features<-fread("features.txt")
    names(features)=c("featno","feature")
    our_features = filter(features, grepl("mean[(][)]|std[(][)]",feature))
    
    # Make our variable names descriptive and human readable 
    our_features$feature <- sub("^t","",our_features$feature)
    our_features$feature <- sub("^f","Freq_Domain_",our_features$feature)
    our_features$feature <- sub("-mean[(][)]","_Mean",our_features$feature)
    our_features$feature <- sub("-std[(][)]","_Std_Dev",our_features$feature)
    our_features$feature <- sub("-X","_X_axis",our_features$feature)
    our_features$feature <- sub("-Y","_Y_axis",our_features$feature)
    our_features$feature <- sub("-Z","_Z_axis",our_features$feature)
    our_features$feature <- sub("Acc","Acceleration",our_features$feature)
    our_features$feature <- sub("Mag","Magnitude",our_features$feature)
    
    ###################################################################
    # create the training dataframe
    # read the training measurement data
    train1 <- fread(file.path("train","X_train.txt"))
    # select the required measurement columns
    train2 <- select(train1,unlist(our_features$featno))
    # name the variables with descriptive names
    names(train2) <- unlist(our_features$feature)
    # and merge the feature values with the subject/activity data
    train_final <- cbind(subj_act_train, train2)
    
    ###################################################################
    # create the test data frame
    # read the test measurement feature data
    test1 <- fread(file.path("test","X_test.txt"))
    # select the required measurement columns
    test2 <- select(test1,unlist(our_features$featno))
    # name the variables with descriptive names
    names(test2) <- unlist(our_features$feature)
    # and merge the feature values with the subject/activity data
    test_final <- cbind(subj_act_test, test2)
    
    ##################################################################
    # finally, merge the test and training data frames by rows
    testtrain <- rbind(test_final,train_final)
    # and arrange it by subject, activity
    testtrain <- arrange(testtrain,subject,lblactivity)
    #we no longer need the "activity number" column
    testtrain <- select(testtrain,-actno)
    # and lets rename the activity column to a more descriptive name
    names(testtrain)[2] = "activity"
    
    ##################################################################
    # and now we're ready to create our final tidy data set
    by_subj_act <- group_by(testtrain,subject,activity)
    print("Conversion Complete!")
    # and summarize by the mean function
    finaltidy <- summarize_each(by_subj_act,funs(mean))
}




