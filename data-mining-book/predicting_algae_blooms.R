library(DMwR)
head(algae)
#data visualization and summarization
summary(algae)
hist(algae$mxPH, probability = T) #prob for each interval of values

#install.packages("car", dependencies=TRUE)
library(car)
par(mfrow = c(1,2))
hist(algae$mxPH, prob = T, xlab = "",
     main = "Histogram of maximum pH value", ylim =0:1)
lines(density(algae$mxPH, na.rm = T))
rug(jitter(algae$mxPH))
qqPlot(algae$mxPH, main = "Normal QQ plot of maximum pH")
par(mfrow=c(1,1))
