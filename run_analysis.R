library(dplyr)

#Defining the path for the files to be used
path_training <- "/Users/joaquinrodriguez/Desktop/Tarea getting data and cleaning/UCI HAR Dataset/train/X_train.txt"
path_training_activities <- "/Users/joaquinrodriguez/Desktop/Tarea getting data and cleaning/UCI HAR Dataset/train/Y_train.txt"
path_training_subjects <- "/Users/joaquinrodriguez/Desktop/Tarea getting data and cleaning/UCI HAR Dataset/train/subject_train.txt"
path_test <- "/Users/joaquinrodriguez/Desktop/Tarea getting data and cleaning/UCI HAR Dataset/test/X_test.txt"
path_test_activities <- "/Users/joaquinrodriguez/Desktop/Tarea getting data and cleaning/UCI HAR Dataset/test/Y_test.txt"
path_test_subjects <- "/Users/joaquinrodriguez/Desktop/Tarea getting data and cleaning/UCI HAR Dataset/test/subject_test.txt"
path_names <- "/Users/joaquinrodriguez/Desktop/Tarea getting data and cleaning/UCI HAR Dataset/features.txt"


#Reading both, training and test sets
Training_set <- read.table(path_training)
Test_set <- read.table(path_test)

#Merging the sets
data_set <- rbind(Training_set, Test_set)

#Reading the names of the columns
features <- read.table(path_names)
names_dataset <- c()

#Giving apropiate labels to the columns, with descriptive variable names
features <- features$V2
for(i in 1:length(features)){
  if(grepl("tBodyAcc-",features[i])){
    names_dataset <- c(names_dataset,paste("Total_Body_Acceleration","-", strsplit(as.character(features[i]),"-")[[1]][2],"-", strsplit(as.character(features[i]),"-")[[1]][3],sep=""))
  }
  if(grepl("tGravityAcc-",features[i])){
    names_dataset <- c(names_dataset,paste("Total_Gravity_Acceleration","-", strsplit(as.character(features[i]),"-")[[1]][2],"-", strsplit(as.character(features[i]),"-")[[1]][3],sep=""))
  }
  if(grepl("tBodyAccJerk-",features[i])){
    names_dataset <- c(names_dataset,paste("Total_Body_Acceleration_Jerk","-", strsplit(as.character(features[i]),"-")[[1]][2],"-", strsplit(as.character(features[i]),"-")[[1]][3],sep=""))
  }
  if(grepl("tBodyGyro-",features[i])){
    names_dataset <- c(names_dataset,paste("Total_Body_Angular_Velocity","-", strsplit(as.character(features[i]),"-")[[1]][2],"-", strsplit(as.character(features[i]),"-")[[1]][3],sep=""))
  }
  if(grepl("tBodyGyroJerk-",features[i])){
    names_dataset <- c(names_dataset,paste("Total_Body_Angular_Velocity_Jerk","-", strsplit(as.character(features[i]),"-")[[1]][2],"-", strsplit(as.character(features[i]),"-")[[1]][3],sep=""))
  }
  if(grepl("tBodyAccMag-",features[i])){
    names_dataset <- c(names_dataset,paste("Total_Body_Acceletarion_Magnitude","-", strsplit(as.character(features[i]),"-")[[1]][2],sep=""))
  }
  if(grepl("tGravityAccMag-",features[i])){
    names_dataset <- c(names_dataset,paste("Total_Gravity_Acceletarion_Magnitude","-", strsplit(as.character(features[i]),"-")[[1]][2],sep=""))
  }
  if(grepl("tBodyAccJerkMag-",features[i])){
    names_dataset <- c(names_dataset,paste("Total_Body_Acceletarion_Jerk_Magnitude","-", strsplit(as.character(features[i]),"-")[[1]][2],sep=""))
  }
  if(grepl("tBodyGyroMag-",features[i])){
    names_dataset <- c(names_dataset,paste("Total_Body_Velocity_Magnitude","-", strsplit(as.character(features[i]),"-")[[1]][2],sep=""))
  }
  if(grepl("tBodyGyroJerkMag-",features[i])){
    names_dataset <- c(names_dataset,paste("Total_Body_Velocity_Jerk_Magnitude","-", strsplit(as.character(features[i]),"-")[[1]][2],sep=""))
  }
  if(grepl("fBodyAcc-",features[i])){
    names_dataset <- c(names_dataset,paste("FFT_Body_Acceleration","-", strsplit(as.character(features[i]),"-")[[1]][2],"-", strsplit(as.character(features[i]),"-")[[1]][3],sep=""))
  }
  if(grepl("fBodyAccJerk-",features[i])){
    names_dataset <- c(names_dataset,paste("FFT_Body_Acceleration_Jerk","-", strsplit(as.character(features[i]),"-")[[1]][2],"-", strsplit(as.character(features[i]),"-")[[1]][3],sep=""))
  }
  if(grepl("fBodyGyro-",features[i])){
    names_dataset <- c(names_dataset,paste("FFT_Body_Velocity","-", strsplit(as.character(features[i]),"-")[[1]][2],"-", strsplit(as.character(features[i]),"-")[[1]][3],sep=""))
  }
  if(grepl("fBodyAccMag-",features[i])){
    names_dataset <- c(names_dataset,paste("FFT_Body_Acceleration_Magnitude","-", strsplit(as.character(features[i]),"-")[[1]][2],sep=""))
  }
  if(grepl("fBodyAccJerkMag-",features[i])){
    names_dataset <- c(names_dataset,paste("FFT_Body_Acceleration_Jerk_Magnitude","-", strsplit(as.character(features[i]),"-")[[1]][2],sep=""))
  }
  if(grepl("fBodyGyroMag-",features[i])){
    names_dataset <- c(names_dataset,paste("FFT_Body_Velocity_Magnitude","-", strsplit(as.character(features[i]),"-")[[1]][2],sep=""))
  }
  if(grepl("fBodyGyroJerkMag-",features[i])){
    names_dataset <- c(names_dataset,paste("FFT_Body_Velocity_Jerk_Magnitude","-", strsplit(as.character(features[i]),"-")[[1]][2],sep=""))
  }
}

#Naming the columns of the dataset
names(data_set) <-  names_dataset

#extracting only the measurements on the mean and std for each measurement
extracted_names <- names_dataset[grepl("mean()",names_dataset)|grepl("std()",names_dataset)]
data_set <- select(data_set, extracted_names)

#Reading  the activities for the data set
Training_set_activites <- read.table(path_training_activities)
Test_set_activites <- read.table(path_test_activities)

data_set_activity <- rbind(Training_set_activites,Test_set_activites)
names(data_set_activity) <- c("Activity")

#Changing the activities to descriptive names
data_set_activity[data_set_activity=="1"] <- "WALKING"
data_set_activity[data_set_activity=="2"] <- "WALKING_UPSTAIRS"
data_set_activity[data_set_activity=="3"] <- "WALKING_DOWNSTAIRS"
data_set_activity[data_set_activity=="4"] <- "SITTING"
data_set_activity[data_set_activity=="5"] <- "STANDING"
data_set_activity[data_set_activity=="6"] <- "LAYING"

#Merging to the data set
data_set <- cbind(data_set_activity,data_set)

#Reading  the subjects for the data set
Training_set_subjects <- read.table(path_training_subjects)
Test_set_subjects <- read.table(path_test_subjects)

#merging both training and test, and giving it the name
subjects <- rbind(Training_set_subjects,Test_set_subjects)
names(subjects) <- c("Subject")

#merging with the data set
data_set <- cbind(subjects,data_set)

#creating a new tidy dataset with the 
summary_data_set <- group_by(data_set,Subject, Activity)
summary_data_set <- summarise_all(summary_data_set, mean)

write.table(summary_data_set, "summary.txt", row.name=FALSE)

