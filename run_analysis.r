##Read and identify the activity labels and measurements for test and train data sets

activitylabels<-read.table("~/UCI HAR Dataset/activity_labels.txt", col.names=c("activityID", "activityName"))
variablenames<-read.table("~/UCI HAR Dataset/features.txt")
measurements<-variablenames[,2]


##Create intermediary table for test data

subjecttest <-read.table("~/UCI HAR Dataset/test/subject_test.txt", col.names="subjectID")
ytest <-read.table("~/UCI HAR Dataset/test/y_test.txt", col.names="activityID")
xtest <-read.table("~/UCI HAR Dataset/test/X_test.txt", col.names=measurements)


##Create intermediary table for train data

subjecttrain <-read.table("~/UCI HAR Dataset/train/subject_train.txt", col.names="subjectID")
ytrain <-read.table("~/UCI HAR Dataset/train/y_train.txt", col.names="activityID")
xtrain <-read.table("~/UCI HAR Dataset/train/X_train.txt", col.names=measurements)


##Created new table from combined test and train data, inclusive of descriptive activity names in conjunction with the activityID

alltest<-cbind(subjecttest,ytest,xtest)
alltrain<-cbind(subjecttrain,ytrain,xtrain)
combineddata<-rbind(alltest,alltrain)

                     
                     for (i in 1:6){
                       combineddata$TestLabel[combineddata$TestLabel ==i] <- activitylabels[i,2]}
                     
                     write.table(combineddata,file="MergedData.txt",sep=" ",append=FALSE)
                     
                     
                     ##Identify measurements on the mean and standard deviation
                     
                     meanMeasurements<-grep("mean()",measurements,fixed=TRUE)
                     stdMeasurements<-grep("std()",measurements,fixed=TRUE)
                     
                     
                     ## Extract the mean and standard deviation measurements
                     
                     measurementExtract<-c(-1,0,meanMeasurements,stdMeasurements)
                     MeanStdData<-combineddata[,measurementExtract+2]
                     
                     
                     ## Create new Tidy table with measurements that relate to mean and std
                     
                     write.table(MeanStdData,file="TidyData.txt",sep=" ",append=FALSE)