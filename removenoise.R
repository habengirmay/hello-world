#removing all the previous var in this env
rm(list=ls())
# Import the file in R by using selecting the from the menu or inserting the directory
SCONES_test <- read.delim(file.choose(),header=T,sep = '\t')
#SCONES_test <- read.delim("~/R/data/SCONES_test.tsv")
head(SCONES_test)  # To see the top 6 rows data
plot(SCONES_test$testSample1, type="l")

plot(SCONES_test$testSample2, type="l")

min(SCONES_test$testSample1)
# -Inf
min(SCONES_test$testSample2)
# -1.056828

max(SCONES_test$testSample1)
# 2.1056

max(SCONES_test$testSample2)
# Inf

summary(SCONES_test$testSample1)
summary(SCONES_test$testSample2)

SCONES_test[SCONES_test$testSample1 == -Inf, ] # getting the row number with -inf value
# 428

SCONES_test[SCONES_test$testSample2 == Inf, ]  # getting the row number with inf value
# 4229

# remove -infinite observation
SCONES_test <- SCONES_test[-428, ] 


#the same is true for sample two by removing the infinite observation
#SCONES_test <- SCONES_test[-4229, ]


#From now on wards let me do for the first sample b/c the same is true for sample2
summary(SCONES_test$testSample1)


n <- nrow(SCONES_test)

install.packages("seewave") # Sound Analysis and Synthesis package for the rmnoise function
#Functions for analysing, manipulating, displaying, editing and synthesizing time waves (particularly sound)
library(seewave)

#removing the noise with rmnoise function
SCONES_test$Smooth1 <- rmnoise(SCONES_test$testSample1, f=n)



summary(SCONES_test$Smooth1)

summary(SCONES_test$testSample1)


win.graph(800,600,10)
plot(SCONES_test$testSample1, type="l", col="red")

win.graph(800,600,10)
plot(SCONES_test$Smooth1, type="l", col="blue")



n2 <- n # we can change n2 for making a zoom in the first value

x1 <- seq(1,n2)
sample1 <- SCONES_test$testSample1[1:n2]
smooth1 <- SCONES_test$Smooth[1:n2]

# on the same graph
windows(800, 600, 10)
plot(x1, sample1, col="blue", type="l",lwd=1, ylim=range(c(sample1,smooth1)))
par(new=TRUE)
plot(x1, smooth1, col="red", type="l",lwd=1, ylim=range(c(sample1,smooth1)))

n2 <- 500 # we can change n2 for making a zoom in the first value

x1 <- seq(1,n2)
sample1 <- SCONES_test$testSample1[1:n2]
smooth1 <- SCONES_test$Smooth[1:n2]

# on the same graph
windows(800, 600, 10)
plot(x1, sample1, col="blue", type="l",lwd=1, ylim=range(c(sample1,smooth1)))
par(new=TRUE)
plot(x1, smooth1, col="red", type="l",lwd=1, ylim=range(c(sample1,smooth1)))






