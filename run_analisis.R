#Getting and Cleaning Data Course Project

#I downloaded the data directly from the link and the zip I saved in a folder. I created a project in R.


datosruta <- file.path(path = "C:/Users/Mayida El Souki/Documents/CIENCIADEDATOS/CURSODATASCIENCEUJH/Curso 3 Getting and Cleaning Data/proyecto GCD 3/proyecto getting 3", "UCI HAR Dataset")
archivos<-list.files(datosruta, recursive=TRUE)
archivos


#The files are "train" and "test", each one of them has associated files of "Subject", "Activity" and "Features". For this reason you have to download these three sets of files. On the other hand, characteristics is everything denoted with "X" and activity is all variables denoted with "Y"

#Upload files

#Subject Files

datosSujetoTrain <- read.table(file.path(datosruta, "train", "subject_train.txt"),header = FALSE)
datosSujetoTest  <- read.table(file.path(datosruta, "test" , "subject_test.txt"),header = FALSE)


#Activiti files

datosactividadTest  <- read.table(file.path(datosruta, "test" , "Y_test.txt" ),header = FALSE)
datosactividadTrain <- read.table(file.path(datosruta, "train", "Y_train.txt"),header = FALSE)


#Features files


datoscaracTest  <- read.table(file.path(datosruta, "test" , "X_test.txt" ),header = FALSE)
datoscaracTrain <- read.table(file.path(datosruta, "train", "X_train.txt"),header = FALSE)



##1. Merge the train and test sets to create one data set.

#Now we merge the data of "train" and "test" joining the data tables by the rows


datossujeto <- rbind(datosSujetoTrain, datosSujetoTest)
datosactividad<- rbind(datosactividadTrain, datosactividadTest)
datoscarac<- rbind(datoscaracTrain, datoscaracTest)


#Let's name the variables

names(datossujeto)<-c("subject")
names(datosactividad)<- c("activity")
datoscaracnombres <- read.table(file.path(datosruta, "features.txt"),head=FALSE)
names(datoscarac)<- datoscaracnombres$V2


#Merge of totals the columns to create the data frame, for the total data


datoscombinados <- cbind(datossujeto, datosactividad)
Datos <- cbind(datoscarac, datoscombinados)


## 2. Extract only measurements from the mean and standard deviation of each measurement.

#Extract the mean and standard deviation of each variable

#Name of subset of "Feature" measures with mean and standard deviation. What will be done is to select the variables that have mean and deviation


subdatoscaracnombres<-datoscaracnombres$V2[grep("mean\\(\\)|std\\(\\)", datoscaracnombres$V2)]


#Extract a Subset of the data from the data frame by selected feature names


nombreseleccionados<-c(as.character(subdatoscaracnombres), "subject", "activity")
Datos<-subset(Datos,select=nombreseleccionados)
str(Datos)



##3.Uses descriptive activity names to name the activities in the data set


library(data.table)


etiquetasactividad <- read.table(file.path(datosruta, "activity_labels.txt"),header = FALSE)
setnames(etiquetasactividad, names(etiquetasactividad), c("activity","activityName"))


#For setnames load data.table


Datos <- merge(etiquetasactividad, Datos, by="activity", all.x = TRUE)
Datos$activityName <- as.character(Datos$activityName)

head(Datos$activityName,30)



##4.Appropriately labels the data set with descriptive variable names.

#Variable names are abbreviated, for example, 
#t = time
#Acc = Accelerometer
#Gyro = Gyroscope
#f = frequency
#Mag = Magnitude
#BodyBody = Body
#What is asked is to replace them with the full names in the data frame


names(Datos)<-gsub("^t", "time", names(Datos))
names(Datos)<-gsub("^f", "frequency", names(Datos))
names(Datos)<-gsub("Acc", "Accelerometer", names(Datos))
names(Datos)<-gsub("Gyro", "Gyroscope", names(Datos))
names(Datos)<-gsub("Mag", "Magnitude", names(Datos))
names(Datos)<-gsub("BodyBody", "Body", names(Datos))


names(Datos)


##5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

#Load the package dplyr

library(dplyr)

Datos2 <- Datos %>%
  group_by(subject, activityName) %>%
  summarise_all(funs(mean))
write.table(Datos2, "Datos2.txt", row.name=FALSE)
str(Datos2)

