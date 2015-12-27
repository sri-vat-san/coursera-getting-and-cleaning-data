# R program to get the desired analysis on the data set from UCI Machine Learning Repository.
# A full description is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
# For the tidy data set, set your working directory as the path to the unzipped Samsung data set and execute 'run_analysis()'.

library(plyr)

step1_merge = function() {
    # step 0: Read data
    message("reading X_train.txt")
    X_train <- read.table("./train/X_train.txt")
    message("reading X_test.txt")
    X_test <- read.table("./test/X_test.txt")
    message("reading y_train.txt")
    y_train <- read.table("./train/y_train.txt")
    message("reading y_test.txt")
    y_test <- read.table("./test/y_test.txt")
    message("reading subject_train.txt")
    subject_train <- read.table("./train/subject_train.txt")
    message("reading subject_test.txt")
    subject_test <- read.table("./test/subject_test.txt")
    
    message("reading activity_labels.txt")
    activity_labels <- read.table("activity_labels.txt")
    colnames(activity_labels) <- c("V1", "Activity")

    # Step 1: Merge the training and the test sets
    merge_features <- rbind(X_train, X_test)
    merge_subjects <- rbind(subject_train, subject_test)
    merge_activity <- rbind(y_train, y_test)

    # rename columns as appropriate features, 'activity', and 'subject'
    names(merge_features) <- features$V2
    names(merge_subjects) <- c('subject')
    names(merge_activity) <- c('activity')

    # combine everything into 1 data set
    merge_df <- cbind(merge_features, merge_subjects, merge_activity)
    merge_df
}

step2_get_mean_std = function(merge_df) {
    # Step 2: Extract only the mean and standard deviation on each measurement
    message("reading features.txt")
    features <- read.table("features.txt")
    features_subset_1 <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
    
    # subset data frame by selected features
    features_subset_2 <- c(as.character(features_subset_1), 'subject', 'activity')
    merge_df <- subset(merge_df, select = features_subset_2)
    merge_df
}

step3_name_activities = function(merge_df) {
    # Step 3: Use descriptive activity names to name the activities in the data set
    merge_df$activity[merge_df$activity == 1] = "WALKING"
    merge_df$activity[merge_df$activity == 2] = "WALKING_UPSTAIRS"
    merge_df$activity[merge_df$activity == 3] = "WALKING_DOWNSTAIRS"
    merge_df$activity[merge_df$activity == 4] = "SITTING"
    merge_df$activity[merge_df$activity == 5] = "STANDING"
    merge_df$activity[merge_df$activity == 6] = "LAYING"
    merge_df
}

step4_set_descriptive_labels = function(merge_df) {
    # Step 4: Appropriately labels the data set with descriptive variable names
    names(merge_df) <- gsub("^t", "time", names(merge_df))
    names(merge_df) <- gsub("^f", "frequency", names(merge_df))
    names(merge_df) <- gsub("Acc", "Acceleration", names(merge_df))
    names(merge_df) <- gsub("Gyro", "Gyroscope", names(merge_df))
    names(merge_df) <- gsub("Mag", "Magnitude", names(merge_df))
    names(merge_df) <- gsub("BodyBody", "Body", names(merge_df))
    merge_df
}

step5_create_tidy_dataset = function(merge_df) {
    # Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject.
    tidy <- ddply(merge_df, .(subject, activity), function(x) colMeans(x[,1:66]))
    tidy
}

run_analysis = function() {
    # merge training and test datasets, this function returns a combined df
    merged <- step1_merge()
    # Extract only the mean and standard deviation for each measurement, this function return a subset of the original df
    merged <- step2_get_mean_std(merged)
    # Name activities
    merged <- step3_name_activities(merged)
    # Set descriptive names to columns
    merged <- step4_set_descriptive_labels(merged)
    # Create tidy dataset
    tidy <- step5_create_tidy_dataset(merged)
    # Write tidy dataset as txt/csv
    message("writing tidy data set to PC")
    write.table(tidy, file = "UCI_HAR_tidy.txt", row.name = FALSE)
    write.csv(tidy, "UCI_HAR_tidy.csv", row.names=FALSE)
}
