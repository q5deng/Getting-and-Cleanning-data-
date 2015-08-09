# Getting-and-Cleanning-data-project-CodeBook

## This file describes the variables, the data, and any transformations or work that performed.

  * Data Source:
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 
  * Data Download Source:
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
   
  * The run_analysis.R script description:

     - Read features.txt activity_labels.txt from "UCI HAR Dataset" folder and named as "features" and actlabels" respectively.
     - Read all the dataset from "UCI HAR Dataset/train" folder and named as "trainset","trainlabel" and "triansubj" respectively.
     - Read all the dataset from "UCI HAR Dataset/test" folder and named as "testset","testlabel" and "testsubj" respectively.
     - Merge dataset "trainlabel","testlabel".Merge "trainsubj","testsubj". Merge "trainset","testset".
     - Combine the the three merged dataset and build a new dataset named "newdata".
     - Extract only the measurements on the mean and standard deviation for each measurement, and build a new dataset called "newdata2".
     - Name the activitis correctly using the names from "actlabels" and saved the newdataset in "newdata2" dataset. And Appropriately labels the data.   
     - Save the dataset, which named as "Jointdata" in a ".txt" format.
     - Create an independent tidy data set with the average of each variable for each activity and each subject.And save the dataset called "Tidydata" in a ".txt" format. 
 
