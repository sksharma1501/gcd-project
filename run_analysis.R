# Getting and Cleaning Data
# Course Project


# helper function to find Mean of all coulmns except the factor columns

meanList <- function(df) {
  datCols <- ncol(df) - 2
  df <- df[, 3:datCols]
  colMeans(df)
}

# Read Train data and label it
train_df <- read.table("./train/subject_train.txt")
act_df <- read.table("activity_labels.txt")
#head(train_df)
#nrow(train_df)
train_df[,2] <- read.table("./train/y_train.txt")
train_df[,2] <- tolower(act_df[train_df[,2],2])
train_df[,3:563] <- read.table("./train/X_train.txt")
#head(train_df,1)
feat_df1 <- read.table("features.txt")
feat_vector <- as.vector(feat_df1$V2)
names(train_df) <- c("subject","activity",feat_vector)
#head(train_df[,1:5])

# Read Test data and label it
test_df <- read.table("./test/subject_test.txt")
test_df[,2] <- read.table("./test/y_test.txt")
test_df[,2] <- tolower(act_df[test_df[,2],2])
test_df[,3:563] <- read.table("./test/X_test.txt")
names(test_df) <- c("subject","activity",feat_vector)
#head(test_df[,1:5])

# Merge data
train_test_df <- rbind(test_df, train_df)
#dim(train_test_df)
#head(train_test_df)

# Extract mean and standard deviation measurements only
#names(train_test_df) 
extractCols <- grep("mean[(]|std[(]", names(train_test_df))  
#extractCols
train_test_df.reduce <- cbind(train_test_df[,1:2], train_test_df[, extractCols])

# Tidy up variable names
names(train_test_df.reduce)  <- gsub("\\(","",names(train_test_df.reduce))
names(train_test_df.reduce)  <- gsub("\\)","",names(train_test_df.reduce))
names(train_test_df.reduce)  <- gsub("-",".",names(train_test_df.reduce))
names(train_test_df.reduce)  <- tolower(names(train_test_df.reduce))
#names(train_test_df.reduce)
#ndatcol <- ncol(train_test_df.reduce) - 2 # How many data columns?
#head(train_test_df.reduce[,1:6])


# Split based on subject 
train_test_df.subj <- split(train_test_df.reduce, train_test_df$subject)
#str(train_test_df.subj)


# Split based on activity
train_test_df.subj.act <- lapply(train_test_df.subj, function(x) {split(x, x$activity)}) 
#str(train_test_df.subj.act)

# Apply helper function to find columns means for all sub-lists
train_test_df.subj.act.mean <- lapply(train_test_df.subj.act, function(x) {lapply(x, meanList)})
#str(train_test_df.subj.act.mean)

# Write tidy data into intermediate output file
write.csv(train_test_df.subj.act.mean, "output.csv")

# Transform from rows to columns
csv_df <- read.csv("output.csv")
colnames <- as.vector(csv_df[,1])
rownames <- as.vector(names(csv_df))
rownames <- rownames[-1]
csv_df <- csv_df[,-1]
#csv_df[1:4,1:4]
rows <- nrow(csv_df)
cols <- ncol(csv_df)
new_csv_df <- matrix(nrow=cols,ncol=rows)
colnames(new_csv_df) <- colnames
rownames(new_csv_df) <- rownames
for (i in 1:cols)
{
  new_csv_df[i,] <- csv_df[,i]
}

#new_csv_df[1:4,1:4]
write.csv(new_csv_df,"tidyoutput.csv")

