
# 1. Merges the training and the test sets to create one data set.
X <- rbind(read.table("train/X_train.txt"),  read.table("test/X_test.txt")) ## combine X data from train and test by rows
Y <- rbind(read.table("train/y_train.txt"), read.table("test/y_test.txt")) ## combine y data from train and test by rows
S <- rbind(read.table("train/subject_train.txt"), read.table("test/subject_test.txt")) ## combine subject data from train and test by rows

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
feat<- read.table("features.txt")
Z <- grep("-mean\\(\\)|-std\\(\\)", read.table("features.txt")[, 2]) ## searching mean and std from features data in the second column
X <- X[, Z] # take the columns from the X measurements, interested only on the mean and std of this data set
names(X) <- tolower(gsub("\\(|\\)", "", feat[Z, 2]))# fixing character vector with tolower()

# 3. Uses descriptive activity names to name the activities in the data set
act <- read.table("activity_labels.txt")
act[, 2] = gsub("_", "", tolower(as.character(act[, 2]))) # fixing character vecotr, removing "_" from names
Y[,1] = act[Y[,1], 2] #replacing Y[,1] with the new names
names(Y) <- "act" #renames the colum with act

# 4. Appropriately labels the data set with descriptive activity names.
names(S) <- "subject"
cleaned <- cbind(S, Y, X)
write.table(cleaned, "cleanws_data.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uniqueSub = unique(S)[,1]
numSub = length(unique(S)[,1])
numAct = length(act[,1])
numCols = dim(cleaned)[2]
data_tidy = cleaned[1:(numSub*numAct), ]
row_num = 1 ## initializing row_num
for (s in 1:numSub) { ## loop that computes the average of each variable for each activity
        for (a in 1:numAct) {
                data_tidy[row_num, 1] = uniqueSub[s]
                data_tidy[row_num, 2] = act[a, 2]
                temp <- cleaned[cleaned$subject==s & cleaned$act==act[a, 2], ]
                data_tidy[row_num, 3:numCols] <- colMeans(temp[, 3:numCols])
                row_num = row_num+1
        }
} ## extract the results
write.table(result, "dataset_averages.txt")