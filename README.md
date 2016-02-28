# GetClean Final Project
*Final Project for Coursera Getting and Cleaning Data Course*

----------
### Overview ###

### Repository Contents ###
1. <b>README.md</b> This readme file explaining the contents of the repository, instructions for restoring the tidy data set, verifying the operation of the script, and an explanation of how the script works.
2. <b>tidy\_data.txt</b>  Text file which contains the tidy data set. To restore the tidy\_data dataframe use the command:<br> tidy\_data\_repo <- read.table("tidy_data.txt", header=T)
3. <b>run\_analysis.R</b> R script which performs the data cleaning and transformation. To use it, run the commands:<br>source("run\_analysis.R")<br>tidy_data <- run\_analysis()
4. <b>CodeBook.md</b> Markdown file containing a description of the variables in the tidy data set.
<br>
### Running the Script ###
The run\_analysis.R script is designed to be run from the same base directory as the the data files. The expected directory structure is:<br>
<b>.(working folder)</b><br>
....run\_analysis.R<br>
....features.txt<br>
....activity\_labels.txt<br>
....<b>test folder</b><br>
........subject\_test.txt<br>
........X\_test.txt<br>
........y\_test.txt<br>
....<b>train folder</b><br>
........X\_train.txt<br>
........y\_train.txt<br>
<br>
To use the script to create a tidy dataframe use:<br>
    source("run\_analysis.R") <br>
    mytidydata <- run_analysis()

The resulting dataframe, mytidydata, can be then compared with the data that was uploaded to the repository. To restore the uploaded datadframe use the command:<br>
    uploadeddata <- read.table("tidy_data.txt",header=T)

Note that the dataframe returned by the script is <b>Wide Tidy Data</b>. Each row represents the measurements for a single subject and activity. Each Column corresponds to one of the features in the original dataset that represents a mean or standard deviation. The values in the columns represent the mean of all the measurements of that feature for the given subject and activity in both the test and training datasets.
### Theory of Operation for run\_analysis.r ###
The script first loads the require libraries and checks for the existence of all required data files. The next step is to read the activity labels and merge the activity labels with both the test and training activity files so that they contain human readable activity labels. Finally, each of these tables is merged with the corresponding subject files creating two data frames, subj\_act\_train and subj\_act\_test, each of which contain the the subject and activity label for the feature dataset.<br>
Next we read in "features.txt" which contains the raw feature names. We identify only those columns corresponding to mean and standard deviation measurements with grep and select only those columns to create a smaller set of features, "our\_features" and go through some text processing to create more meaningful, human readable column names.<br>
We then use our\_features to select only the required columns from the main feature datasets, X\_test.txt and X\_train.txt. These files are merged with corresponding subject activity dataframes using cbind, and finally the test and training final datasets are merged with rbind.<br>
The last step is to use the dplyr "group\_by" function to group the combined dataframe by subject and activity. And finally we use summarize\_each to apply the mean function and create our final dataframe which contains the mean of all the feature measurements for a given subject and activity.