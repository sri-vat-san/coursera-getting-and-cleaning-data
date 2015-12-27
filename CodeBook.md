## Code Book

This code book will describe the data set, the files used in this project and the processing steps entailed in creating the tidy data set.

### Overview

As part of the Human Activity Recognition experiments, each person in a group of 30 volunteers performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, various measurements were captured. The obtained dataset had been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

### Data files

We used the following files:
* Data relating to the features collected from the accelerometer and gyroscope
  * `X_train.txt`: training data with 7352 observations of the 561 features from 70% of the volunteers.
  * `X_test.txt`: test data with 2947 observations of the 561 features from 30% of the 30 volunteers.
  * `features.txt`: names of the 561 features.

* Data relating to the types of activity for which the measurements were taken
  * `y_train.txt`: a vector of 7352 integers, denoting the activity ID related to each of the observations in `X_train.txt`.
  * `y_test.txt`: a vector of 2947 integers, denoting the activity ID related to each of the observations in `X_test.txt`.
  * `activity_labels.txt`: mapping information between the IDs and names of the 6 activities.

* Data relating to the 30 subjects who participated in this study
  * `subject_train.txt`: a vector of 7352 integers, denoting the subject ID related to each of the observations in `X_train.txt`.
  * `subject_test.txt`: a vector of 2947 integers, denoting the subject ID related to each of the observations in `X_test.txt`.

More information about the features measured is available in `features_info.txt`.

**Note:** The data files in the "Inertial Signals" folders were ignored. This analysis was performed using only the files above.

### Processing steps

To accomplish the 'getting and cleaning data' job, we call the run_analysis() function in the script [run_analysis.R](run_analysis.R). It consists of calls to other functions each of which performs a specific task as follows:

1. Reads all of the relevant data files into data frames, renames appropriate column headers and combines the training and test data sets (total 10299 observations, 563 columns including 'subject' and 'activity') into a single data set.
2. Subsets this data set, retaining only the desired columns corresponding to mean, standard deviation of each measurement. This results in 10299 observations, across 68 columns (66 features, 1 'subject' and 1 'activity' column).
3. Labels the 'activity' column with descriptive names.
4. Renames (using 'gsub()' function) the feature variable names to afford better readability.
5. Creates a tidy data set containing the average of each feature variable for each activity and each subject. This tidy data set has 180 rows (30 subjects, 6 activities each). Specifically, each row contains the mean value for each of the 66 features for that subject/activity combination. This tidy data set was output to a TXT and a CSV file.
