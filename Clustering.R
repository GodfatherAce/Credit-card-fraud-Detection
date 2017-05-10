getwd();
setwd("C:/Users/Arvind/Desktop/NEU/Semester 2/Advanced Data Science/Datasets")
mydata <- read.csv("Sample_Data.csv",header=TRUE,strip.white = TRUE)
head(mydata)
nrow(mydata)
str(mydata)


#Trying to plot the data
#Relation between credit score and age
plot(credit_score ~ age,mydata)
with (mydata,(text(credit_score ~ age,labels=credit_history,pos=4,cex=.3)))


#Normalization
#Clustering requires only quantative data

#Removing the 8th column from dataset that is credit history
z <- mydata[,-c(8,8)]

z$property_magnitude=NULL
z$credit_history=NULL
head(z)

##Now the dataset only contains quantitative variables
#It can be also checked by the output of the following code
str(z)

#### NORMALIZING THE DATASET
#Normalizing is required as the dataset is in a wide variety or range
#We can noramlize by calculating the mean, standard Deviation of the whole dataset.
#After that we can apply that on the full dataset
#We will perform it on the test sample dataset that is z
#Calculating the mean
mean <- apply(z,2,mean)
standardDeviation <- apply(z,2,sd)
z <- scale(z,mean,standardDeviation)


#Calculating the Eucledian Distance
distance <- dist(z)

print(distance)

#Cluster Dendogram
hc.c <- hclust(distance)

#Plotting between credit history data and the cluster dendogram
plot(hc.c,labels=mydata$credit_history,pos=4,cex=.5)

#Using Hang to make the values aligned to one another
plot(hc.c,labels=mydata$credit_history,hang=-1)


#Cluster Dendogram with average Linkage
hc.a <- hclust(distance,method = "average")

plot(hc.a,labels=mydata$credit_history,hang=-1)


#Cluster Membership
member.c <- cutree(hc.c,3)
member.a <- cutree(hc.a,3)

##Creating a table to segregating between different segregations
table(member.c,member.a)


##Based on the result of the table
##Cluster 1 has a good match with 66 being the same
##Cluster 2 has 19 from c and 3 from a
##3 were listed as cluster 3 by average linkage and 2 by complete linkage 

#Cluster Means
aggregate(z,list(member.c),mean)



res <- kmeans(mydata,2)

res

res$size

res$cluster

plot(mydata[c("credit_score","age")],col=res$cluster)

plot(mydata[c("credit_score","age")],col=mydata$credit_score)

table(mydata$credit_score,res$cluster)
