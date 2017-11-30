library(plyr)
library(dplyr)


setwd("//sanuk.santanderuk.corp/ANDFS/Homedirs/13/E1187273/Home/Data Science Course/Getting and Cleaning Data/Assignment/")

# read in features

Var_Names <- read.table("features.txt")
Var_Names$V1 <- NULL

# read in activity

Activity_Labels <- read.table("activity_labels.txt")
Activity_Labels<- rename(Activity_Labels, Activity = V1)

# Merge train and test sets


# read in training set and merge, and add descriptive names
X_Train <- read.table("train/X_train.txt")
Y_Train <- read.table("train/y_train.txt")
Sub_Train <- read.table("train/subject_train.txt")
colnames(X_Train) <- Var_Names$V2
colnames(Y_Train) <- "Activity"
colnames(Sub_Train) <- "Subject"
X_Mergex <- cbind(X_Train, Y_Train)
X_Merge  <- cbind(X_Mergex, Sub_Train)


# read in test set and merge,  and add descriptive names

X_Test <- read.table("test/X_test.txt")
Y_Test <- read.table("test/y_test.txt")
Sub_Test <- read.table("test/subject_test.txt")
colnames(X_Test) <- Var_Names$V2
colnames(Y_Test) <- "Activity"
colnames(Sub_Test) <- "Subject"
X_MergexT <- cbind(X_Test, Y_Test)
X_MergeT  <- cbind(X_MergexT, Sub_Test)

# merge into 1 dataset

Full_Set <- rbind(X_Merge, X_MergeT)

# Extract only mean and SD measurements

MeanSD <- grep("mean|std",  names(Full_Set))
Full_Set_MeanSD <- Full_Set[ ,MeanSD]  # gives a data frame with only columns relating to mean or SD

# Use Activity description to name activity in data set

a<- as.factor(Full_Set$Activity)
a<- as.data.frame(a)
class(a$a)
a<- rename(a, Activity = a)  
b<- merge(a,Activity_Labels, by = "Activity", all.x = TRUE)
b <- rename(b, ActivityName = V2)
Full_Set_MeanSD$ActivityName <- b$ActivityName

# add subject back into new dataset

Full_Set_MeanSD$Subject <- Full_Set$Subject

#  Create new dataset with average of each variable for activity and subject

Tidyset <- aggregate(Full_Set_MeanSD, list(Full_Set_MeanSD$ActivityName, Full_Set_MeanSD$Subject), mean)
Tidyset$ActivityName <- NULL
Tidyset$Subject <- NULL
write.table(Tidyset, "tidyset.txt", row.name = FALSE)



