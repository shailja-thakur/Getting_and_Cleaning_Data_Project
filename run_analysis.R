packages <- c("data.table", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)
library(dplyr)
tmp1 <- read.table("./data/train/X_train.txt")
tmp2 <- read.table("./data/test/X_test.txt")
X <- rbind(tmp1, tmp2)
tmp1 <- read.table("./data/train/subject_train.txt")
tmp2 <- read.table("./data/test/subject_test.txt")
S <- rbind(tmp1, tmp2)
tmp1 <- read.table("./data/train/y_train.txt")
tmp2 <- read.table("./data/test/y_test.txt")
Y <- rbind(tmp1, tmp2)
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./data/features.txt")
mean_std_indices <- grep("mean\\(\\)|std\\(\\)", features[,2])
#mean_std_indices <- mean_std[, 2]
X <- select(X, mean_std_indices)
names(X) <- features[mean_std_indices, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))
# 3. Uses descriptive activity names to name the activities in the data set.
activities <- read.table("./data/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower((activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"
# 4. Appropriately labels the data set with descriptive activity names.
names(S) <- "subject"
merged_labelled <- cbind(S, Y, X)
write.table(merged_labelled, "merged_labelled_dataset.txt")
# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
uniqueSubjects = unique(S)[,1]
numSubjects = length(uniqueSubjects)
numActivities = length(activities[,1])
numCols = dim(merged_labelled)[2]
tidy_dataset = merged_labelled[1:(numSubjects*numActivities), ]
row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    tidy_dataset[row, 1] = uniqueSubjects[s]
    tidy_dataset[row, 2] = activities[a, 2]
    cond1 = merged_labelled$subject==s
    cond2 = merged_labelled$activity==activities[a, 2]
    row_idx = cond1 & cond2
    tidy_val <- merged_labelled[row_idx, ]
    tidy_dataset[row, 3:numCols] <- colMeans(tidy_val[, 3:numCols])
    row = row+1
  }
}
write.table(tidy_dataset, "tidy_dataset_with_the_averages_by_act_sbjct.txt",row.name=FALSE)