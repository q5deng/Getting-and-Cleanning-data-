 ##Create one R script called run_analysis.R that does the following. 

   # Merges the training and the test sets to create one data set.
   # Extracts only the measurements on the mean and standard deviation for each measurement. 
   # Uses descriptive activity names to name the activities in the data set
   # Appropriately labels the data set with descriptive variable names. 
   # From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


  ## code part:
library(plyr)
# part 1. Merge the training and the test sets to create one data set.

  # read datasets
     features <- read.table("C:/Users/Deng/Documents/UCI HAR Dataset/features.txt")
     actlabels <- read.table("C:/Users/Deng/Documents/UCI HAR Dataset/activity_labels.txt")

     trainset <- read.table("C:/Users/Deng/Documents/UCI HAR Dataset/train/X_train.txt")
     trainlabel <- read.table("C:/Users/Deng/Documents/UCI HAR Dataset/train/y_train.txt")
     trainsubj <- read.table("C:/Users/Deng/Documents/UCI HAR Dataset/train/subject_train.txt") 
   
     testset <- read.table("C:/Users/Deng/Documents/UCI HAR Dataset/test/X_test.txt")
     testlabel <- read.table("C:/Users/Deng/Documents/UCI HAR Dataset/test/y_test.txt")
     testsubj <- read.table("C:/Users/Deng/Documents/UCI HAR Dataset/test/subject_test.txt")

  # Merge datasets and build a new dataset
      newdatlabel<-rbind(trainlabel,testlabel)
      newdatsubj<-rbind(trainsubj,testsubj)
      newdatset<-rbind(trainset,testset)

      newdata<-cbind(newdatlabel,newdatsubj,newdatset)
      colnames(newdata)[1]<- 'Activity'
      colnames(newdata)[2]<- 'Subject'
      colnames(newdata)[3:ncol(newdata)]<- as.character(features[,2])

# part 2. Extracts only the measurements on the mean and standard deviation for each measurement

varind <- grep("[Mm]ean\\()|[Ss]td\\()", features$V2)
varname <- grep("[Mm]ean\\()|[Ss]td\\()", features$V2, value=TRUE)
collist <- c(1, 2, (varind+2))
colnames <- c("Subject", "Activity", varname)
newdata2<-newdata[,c(collist)]

# part 3. Uses descriptive activity names to name the activities in the data set

      is.character(newdata2$Activity)
      newdata2$Activity<-as.character(newdata2$Activity)
      actlabels[,2] <- as.character(actlabels[,2])
      for (i in 1:dim(actlabels)[1]) {
             newdata2$Activity[newdata2$Activity== i] = actlabels[i,2]
      end
       }
     newdata2$Activity <- as.character(newdata2$Activity)
     names(newdata2)<-colnames

# part 4. Appropriately labels the data set with descriptive variable names
   
     names(newdata2)<-gsub("Acc", "Accelerometer", names(newdata2))
     names(newdata2)<-gsub("Gyro", "Gyroscope", names(newdata2))
     names(newdata2)<-gsub("BodyBody", "Body", names(newdata2))
     names(newdata2)<-gsub("Mag", "Magnitude", names(newdata2))
     names(newdata2)<-gsub("^t", "Time", names(newdata2))
     names(newdata2)<-gsub("^f", "Frequency", names(newdata2))
     names(newdata2)<-gsub("tBody", "TimeBody", names(newdata2))
     names(newdata2)<-gsub("-mean()", "Mean", names(newdata2), ignore.case = TRUE)
     names(newdata2)<-gsub("-std()", "STD", names(newdata2), ignore.case = TRUE)
     names(newdata2)<-gsub("-freq()", "Frequency", names(newdata2), ignore.case = TRUE)
     names(newdata2)<-gsub("angle", "Angle", names(newdata2))
     names(newdata2)<-gsub("gravity", "Gravity", names(newdata2))
     
 #save the first data as required#
     write.table(newdata2, file = "Jointdata.txt", row.names = FALSE) 

# part 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
     newdata2$Subject <- as.factor(newdata2$Subject)
     newdata3 <- data.table(newdata2)

     tidydata <- aggregate(. ~Subject + Activity, newdata3, mean)
     tidydata <- tidydata[order(tidydata$Subject,tidydata$Activity),]
 #save the first data as required#
     write.table(tidydata, file = "Tidydata.txt", row.names = FALSE)




