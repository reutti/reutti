##download the data directory and unzip it
uRL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
file<-"getdata.zip"
if (!file.exists(file)){
download.file(uRL, file)
unzip(file)
}
##convert features and activity lables into readble dataframes
activity_Lables<-read.table("UCI HAR Dataset/activity_labels.txt")
features_Lables<-read.table("UCI HAR Dataset/features.txt")
activity_Lables$V2<-as.character(activity_Lables$V2)
features_Lables$V2<-as.character(features_Lables$V2)
##sort only the features containing "m/Mean" and "s/Std"features relevant for the project
relevant_F<-grepl(".*[mM]ean*.|.*[sS]td*.",features_Lables$V2)
features_Lables_n<-features_Lables[relevant_F,2]
##rename features better
features_good<-gsub("-std","std",features_Lables_n)
features_good<-gsub("-std","std",features_Lables_n)
features_good<-gsub("-mean","mean",features_Lables_n)
features_good<-gsub("[-()]","",features_Lables_n)
## dataset train
train <- read.table("UCI HAR Dataset/train/X_train.txt")[relevant_F]
trainactivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainsubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
traing <- cbind(trainsubjects, trainactivities, train)
##dataset test
test<- read.table("UCI HAR Dataset/test/X_test.txt")[relevant_F]
testactivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testsubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
testg <- cbind(testsubjects, testactivities, test)
##merge to one dataframe and proper column names
Data <- rbind(traing, testg)
colnames(Data) <- c("subject", "activity", features_Lables_n)

# turn activities and subjects to factors
Data$activity <- factor(Data$activity, levels = activity_Lables$V1, labels = activity_Lables$V2)
Data$subject <- as.factor(Data$subject)
## generate second table with means
Data.melt <- melt(Data, id = c("subject", "activity"))
Data.mean <- dcast(Data.melt, subject + activity ~ variable, mean)
##write table to file tidy.txt 
write.table(Data.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
