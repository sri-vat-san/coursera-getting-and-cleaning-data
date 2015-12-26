
## Class Project for "Getting and Cleaning Data"

The purpose of this project is to showcase our learnings towards preparing a tidy data set for later analysis. The raw data is data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**Before running the R script ([run_analysis.R](run_analysis.R)) for analysis, here are the steps that must be performed:**

1. Download the zip file from this URL (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip the file and retain the default folder structure.
3. Place the R script under the working directory i.e. `/UCI HAR Dataset`. The files used for our analysis are:
  * Data relating to the features collected from the accelerometer and gyroscope
    * `X_train.txt`
    * `X_test.txt`
    * `features.txt`
  * Data relating to the types of activity for which the measurements were taken
    * `y_train.txt`
    * `y_test.txt`
    * `activity_labels.txt`
  * Data relating to the 30 subjects who participated in this study
    * `subject_train.txt`
    * `subject_test.txt`
    
After completing these steps, you can run the R script and call the **run_analysis()** function from the console. This would in turn, call the ingredient functions which process the data set and outputs the desired tidy data set. 

**Note:** This script requires the [plyr package](https://cran.r-project.org/web/packages/plyr/index.html), which can be downloaded from CRAN.

For reference, this repository also carries the output of the R script, UCI_HAR_tidy in .txt and .csv formats.

Please refer to the code book for further details regarding the analysis performed. 
