setwd("C:/Users/Arvind/Desktop/NEU/Semester 2/Advanced Data Science/Datasets")
mydata <- read.csv("Sample_Data.csv",header=TRUE,strip.white = TRUE)

# Creating a dataset for the data
train <- mydata[1:65,]

#Creating a test dataset
test <- mydata[66:89,]

#Fitting a Model for the logistic regression
model <- glm(class ~ credit_usage + property_magnitude + Annual_Sal + Avg_Salary + balance + age + credit_score,family=binomial(link='logit'),data=mydata)

#Plotting the model
plot(model)

