#import the library
library(randomForest)

#Change the Working Directory to modify the working Directory
## Modify the home directory to your home directory
getwd();
setwd("C:/Users/Arvind/Desktop/NEU/Semester 2/Advanced Data Science/Datasets")
mydata <- read.csv("Sample_Data.csv",header=TRUE,strip.white = TRUE)



#Setting the Data into a dataframe, so that the main data can stay intact
x <- data.frame(mydata)


#Bind the data
xBind <- cbind(x)

#Fit the model
## Fitting the model through randomForest based on Credit Score.
fit <- randomForest(class ~ ., data=xBind,ntree=500,proximite=TRUE)

#Check the summary of the fit model
summary(fit)

#Predicted model between the credit score and fitted model using Random Forest
predicted <-  predict(fit,x)

#Summary of the predicted value
summary(predicted)

#The correct recommended values for the classification based on credit score and 
#fitted value 
fit$predicted
fit$proximity
fit$importance

#Plot the datato find the right attributes for the information
varImpPlot(fit)

####### OUTPUT ANALYSIS###############
#Random Forest Algorithm is such that it can identify the most significant elements.
#In our case study we can clearly see that factors such as Age, Annual_Sal,
#Avg_Salary and balance are significant in predicting the Fraud Analysis.
#Based on this result we can clearly say that 
#Age
#Annual_Sal 
#Avg_Salary
#balance
#credit_usage
#are the important parameters in predicting credit card fraud based on the given dataset



