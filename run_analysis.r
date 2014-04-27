setwd("~/R/UCI HAR Dataset")
getwd()


xtest <-read.table("~/R/UCI HAR Dataset/test/X_test.txt")
ytest <-read.table("~/R/UCI HAR Dataset/test/y_test.txt")
ytrain <-read.table("~/R/UCI HAR Dataset/train/y_train.txt")
xtrain <-read.table("~/R/UCI HAR Dataset/train/X_train.txt")
