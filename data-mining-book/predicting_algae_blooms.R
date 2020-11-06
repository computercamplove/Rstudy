library(DMwR)
head(algae)
#data visualization and summarization
summary(algae)
hist(algae$mxPH,  probability = T) #prob for each interval of values

#install.packages("car", dependencies=TRUE)
library(car)
#par() to set several parametrs of the R graphic system
#here divide graphic output window to 1 line per 2 columns area
par(mfrow = c(1,2))
#hist
hist(algae$mxPH, prob = T, xlab = "",
     main = "Histogram of maximum pH value", ylim =0:1)
lines(density(algae$mxPH, na.rm = T))
rug(jitter(algae$mxPH))
#QQ
qqPlot(algae$mxPH, main = "Normal QQ plot of maximum pH")
par(mfrow=c(1,1))
#boxplot
boxplot(algae$PO4, ylab="Orthophosphate (oPO4)")
rug(jitter(algae$PO4), side=2)
#line of mean to compare with median of boxplot
abline(h=mean(algae$PO4, na.rm = T), lty=2) 

#inspecting the observations that have "strange" values
#1
plot(algae$NH, xlab = "")
abline(h = mean(algae$NH4, na.rm =TRUE), lty=1)
abline(h = mean(algae$NH4, na.rm =TRUE) + sd(algae$NH4, na.rm =TRUE), lty=2)
abline(h = median(algae$NH4, na.rm =TRUE), lty=3)
identify(algae$NH4)
#2
plot(algae$NH, xlab = "")
clicked.lines <- identify(algae$NH4)
algae[clicked.lines,]

#UNKNOWN VALUES
library(DMwR)
data(algae)
dim(algae)
#[1] 200  18

#removing the observations with unknown values

#CHECK FOR NA

#1. how many rows has at least 1 NA
algae[!complete.cases(algae),]
nrow(algae[!complete.cases(algae),])
#[1] 16
dim(algae[complete.cases(algae),])
#[1] 184  18

#2. shows in which row how many NA
apply(algae, 1, function(x) sum(is.na(x)))

#3. just shows number of NA in dataset
sum(is.na(algae)) 

#4. which row has too many NA (>20%) ( If no rows satisfy the 
# constraint indicated by the user, a warning is generated.)
manyNAs(algae, 0.2)
#62 199
algae[c(62,199),]
#    season  size  speed mxPH mnO2 Cl NO3 NH4 oPO4 PO4 Chla   a1   a2  a3 a4 a5  a6  a7
#62  summer small medium  6.4   NA NA  NA  NA   NA  14   NA 19.4  0.0 0.0  2  0 3.9 1.7
#199 winter large medium  8.0  7.6 NA  NA  NA   NA  NA   NA  0.0 12.5 3.7  1  0 0.0 4.9

# REMOVE NA
algae <- na.omit(algae)
nrow(algae)
# [1] 184

#CHECK AGAIN
sum(is.na(algae)) #0

# FILLING IN THE UV WITH MOST FREQUENT VALUES
# a) for normal distributions - mean
library(DMwR)
data(algae)
hist(algae$mxPH,  probability = T) 
mean(algae$mxPH, na.rm = TRUE)
#[1] 8.011734
sum(is.na(algae[,"mxPH"]))
#[1] 1
algae[48, "mxPH"]
#[1] NA
algae[48, "mxPH"] <- mean(algae$mxPH, na.rm = TRUE)

#check
sum(is.na(algae[,"mxPH"]))
mean(algae$mxPH)
#[1] 8.011734

# b) for skewed distributions or variables with outliers - median
par(mfrow = c(1,2))
hist(algae$Chla,  probability = T) 
median(algae$Chla, na.rm = TRUE)
#[1] 5.475
mean(algae$Chla, na.rm = TRUE)

algae[is.na(algae$Chla), "Chla"] <- median(algae$Chla, na.rm = TRUE)
hist(algae$Chla,  probability = T)
median(algae$Chla, na.rm = TRUE)
