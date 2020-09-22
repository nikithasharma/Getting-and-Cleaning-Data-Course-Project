xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
X <- rbind(xtrain, xtest)

ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
Y <- rbind(ytrain, ytest)

subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
subtest <- read.table("UCI HAR Dataset/test/subject_test.txt")
Subject <- rbind(subtrain, subtest)

features <- read.table("UCI HAR Dataset/features.txt")
index_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, index_of_good_features]
names(X) <- features[index_of_good_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))


activity <- read.table("UCI HAR Dataset/activity_labels.txt")
activity[, 2] = gsub("_", "", tolower(as.character(activity[, 2])))
Y[, 1] = activity[Y[ , 1], 2]
names(Y) <- "activity"

names(Subject) <- "subject"
clean <- cbind(Subject, Y, X)
write.table(clean, "new_data.txt")


uniqueSubjects <- unique(Subject)[, 1]
numSubjects <- length(unique(Subject)[, 1])
numActivities <- length(activity[, 1])
numColumns <- dim(clean)[2]
result <- clean[1:(numSubjects*numActivities), ]

row <- 1
for (s in 1:numSubjects){
  for (a in 1:numActivities){
    result[row, 1] <- uniqueSubjects[s]
    result[row, 2] <- activity[a, 2]
    temp <- clean[clean$subject == s & clean$activity == activity[a, 2], ]
    result[row, 3:numColumns] <- colMeans(temp[, 3:numColumns])
    row <- row + 1
  }
}
write.table(result, "new_averages.txt")
