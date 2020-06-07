################################### Install package 
install.packages("data.table")

################################### Load library
library(data.table) 

################################### Set URL and download data
fileurl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists('./UCI HAR Dataset.zip')){
  download.file(fileurl,'./UCI HAR Dataset.zip', mode = 'wb')
  unzip("UCI HAR Dataset.zip", exdir = getwd())
}

################################### Extract features
read_features <- read.csv('./UCI HAR Dataset/features.txt', header = FALSE, sep = ' ')
read_features <- as.character(read_features[,2])

################################### Gather Train Data
data.train.x <- read.table('./UCI HAR Dataset/train/X_train.txt')
data.train.activity <- read.csv('./UCI HAR Dataset/train/y_train.txt', header = FALSE, sep = ' ')
data.train.subject <- read.csv('./UCI HAR Dataset/train/subject_train.txt',header = FALSE, sep = ' ')

data.train <-  data.frame(data.train.subject, data.train.activity, data.train.x)
names(data.train) <- c(c('subject', 'activity'), read_features)

################################### Gather Test Data
data.test.x <- read.table('./UCI HAR Dataset/test/X_test.txt')
data.test.activity <- read.csv('./UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ')
data.test.subject <- read.csv('./UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = ' ')

data.test <-  data.frame(data.test.subject, data.test.activity, data.test.x)
names(data.test) <- c(c('subject', 'activity'), read_features)

############################ Merge test & train data
data.all <- rbind(data.train, data.test)

############################ Extract mean and standard daviation for each measurement
mean_std.select <- grep('mean|std', read_features)
data.sub <- data.all[,c(1,2,mean_std.select + 2)]
  
############################ name the activity
activity.labels <- read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)
activity.labels <- as.character(activity.labels[,2])
data.sub$activity <- activity.labels[data.sub$activity]

############################ Label data set with variable name
names.new <- names(data.sub)
names.new <- gsub("[(][)]", "", names.new)
names.new <- gsub("^t", "TimeDomain_", names.new)
names.new <- gsub("^f", "FrequencyDomain_", names.new)
names.new <- gsub("Acc", "Accelerometer", names.new)
names.new <- gsub("Gyro", "Gyroscope", names.new)
names.new <- gsub("Mag", "Magnitude", names.new)
names.new <- gsub("-mean-", "_Mean_", names.new)
names.new <- gsub("-std-", "_StandardDeviation_", names.new)
names.new <- gsub("-", "_", names.new)
names(data.sub) <- names.new

############################ Create tidy data set to data_tidy.txt
data.tidy <- aggregate(data.sub[,3:81], by = list(activity = data.sub$activity, subject = data.sub$subject),FUN = mean)
write.table(x = data.tidy, file = "data_tidy.txt", row.names = FALSE)









