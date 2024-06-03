## read in raw data
data_root <- "getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset"
test <- read.table(file.path(data_root, "test", "X_test.txt"))
test_activities <- read.table(file.path(data_root, "test", "y_test.txt"))
test_subjects <- read.table(file.path(data_root, "test", "subject_test.txt"))
train <- read.table(file.path(data_root, "train", "X_train.txt"))
train_activities <- read.table(file.path(data_root, "train", "y_train.txt"))
train_subjects <- read.table(file.path(data_root, "train", "subject_train.txt"))
data_names <- read.table(file.path(data_root, "features.txt"))
activity_labels <- read.table(file.path(data_root, "activity_labels.txt"))

## add activity and subject labels to test and train data sets
combined_test <- mutate(test, activity = test_activities[,1], subject = test_subjects[,1])
combined_train <- mutate(train, activity = train_activities[,1], subject = train_subjects[,1])

## merge test and train
data <- bind_rows(combined_test, combined_train)

## relabel columns
colnames(data) <- c(data_names[,2], "activity", "subject")

## drop columns that do not contain mean, std, activity, or subject
##   note there are some duplicate column names, but they are dropped in this step
abbreviated_data <- data[,grepl("mean|std|activity|subject", colnames(data))]

## rename activity labels
abbreviated_data$activity <- activity_labels[abbreviated_data$activity, 2]

## create summary of averages per activity
data_summary <- abbreviated_data %>%
group_by(activity, subject) %>%
summarize(across(everything(), mean), .groups = "drop")

## output file
write.table(data_summary, "summarized data.txt", row.name = FALSE)
