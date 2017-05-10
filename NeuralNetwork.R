library("neuralnet")


setwd("C:/Users/Arvind/Desktop/NEU/Semester 2/Advanced Data Science/Datasets")
mydata <- read.csv("Sample_Data.csv",header=TRUE,strip.white = TRUE)


# Creating a dataset for the data
train <- mydata[1:65,]

#Creating a test dataset
test <- mydata[66:89,]

#Train the Neural Network based on the most probably input parameters which have been
# detected from the randomForest algorithm

creditnet <- neuralnet(class ~ credit_usage + property_magnitude,train,hidden=4,lifesign = "minimal",linear.output = FALSE, threshold = 0.1)

# Plotting of the neural networkbased on the predicted values
plot(creditnet, rep = "best")

# 
temp_test <- subset(test, select = c("credit_usage", "property_magnitude"))

creditnet.results <- compute(creditnet, temp_test)

head(temp_test)

results <- data.frame(actual = test$class, prediction = creditnet.results$net.result)
results


results$prediction <- round(results$prediction)

results

results


