### Creating a Regression Tree 
library(rpart)


setwd("C:/Users/Arvind/Desktop/NEU/Semester 2/Advanced Data Science/Datasets")
mydata <- read.csv("Sample_Data.csv",header=TRUE,strip.white = TRUE)

#Trying to fit the regression Tree information
fit <- rpart(class ~ credit_usage + property_magnitude + Annual_Sal + Avg_Salary + balance + age + credit_score,method = "anova",data = mydata)

printcp(fit)
plotcp(fit)

summary(fit)

plot(fit, uniform=TRUE, main="Regression Tree for Credit Class ")
text(fit, use.n=TRUE, all=TRUE, cex=.8)
