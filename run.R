run_analysis<-function() {
        
        
        features<-read.table("UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)
        features<-features[,2]
        
        ## working with test data
        dataXtest<-read.table("UCI HAR Dataset/test/X_test.txt")
        dataYtest<-read.table("UCI HAR Dataset/test/y_test.txt")
        subiect_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
        
        names(dataXtest)<-features
        names(subiect_test)<-"subiect"
        names(dataYtest)<-"test label"
        test<-cbind(subiect_test,dataYtest,dataXtest)
        
        ## working with train data
        dataXtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
        dataYtrain<-read.table("UCI HAR Dataset/train/y_train.txt")
        subiect_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
        
        names(dataXtrain)<-features
        names(subiect_train)<-"subiect"
        names(dataYtrain)<-"test label"
        train<-cbind(subiect_train,dataYtrain,dataXtrain)
        
        ##merging  data
        data<-rbind(test,train)
        
        ##Extracts only the measurements on the mean and standard deviation for each measurement.
        filtr<-c(-1,0,1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,294:296,345:350,373:375,424:429,503,504,516,517,526,529,530,542,543,552)
        filtr<-filtr+2
        data<-data[,filtr]
        
        ##Uses descriptive activity names to name the activities in the data set
        label<-read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors = FALSE)
        name<-data.frame()
        for (i in 1:nrow(data)){
                if(data[i,2]==1){name[i,1]=label[1,2]}
                else if(data[i,2]==2){name[i,1]=label[2,2]}
                else if(data[i,2]==3){name[i,1]=label[3,2]}
                else if(data[i,2]==4){name[i,1]=label[4,2]}
                else if(data[i,2]==5){name[i,1]=label[5,2]}
                else if(data[i,2]==6){name[i,1]=label[6,2]}
                else {
                        name[i,1]="NA"
                }
        }
        
        data[,2]<-name[,1]
        
        ##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        
        tidy_data<-data.frame()
        list<-split(data,data[,c(1,2)])
        for(i in 1:length(list)){
                tidy_data[i,1]<-list[[i]][1,1]
                tidy_data[i,2]<-list[[i]][1,2]
                for(j in 3:length(list[[i]])){
                        tidy_data[i,j]<-mean(list[[i]][,j])
                        
                }
                
        }
        names(tidy_data)<-c("subiect","test lable",features[c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,294:296,345:350,373:375,424:429,503,504,516,517,526,529,530,542,543,552)])
        
        
        tidy_data
}