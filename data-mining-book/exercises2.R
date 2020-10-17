#1
install.packages("pacman")

#load package
require(pacman)
library(pacman)
install.packages("tidyverse")
install.packages("ggplot2")
library("ggplot2")


age <- c(13,15,16,16,19,20,20,21,22,22,25,25,25,25,30,33,33,35,35,35,35,36,40,45,46,52,70)
length(age)

summary(age)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#13.00   20.50   25.00   29.96   35.00   70.00 
fivenum(age)
#13.0 20.5 25.0 35.0 70.0
boxplot(age,
        ylab = "age")

#2.3
ages <- data.frame(age_range = c('[1-5]','[6-15]','[16-20]','[21-50]','[51-80]','[81-110]'),
                      age_frequency = c(200,450,300,1500,700,44))

plot <- ggplot(data = ages, aes(x = age_range, y = age_frequency))
plot +
        geom_bar(stat="identity")

#2.4

adult <- data.frame(age=c(23,23,27,27,39,41,47,49,50,52,54,54,56,57,58,58,60,61), 
                    fat=c(9.5, 26.5,7.8,17.8,31.4,25.9,27.4,27.2,31.2,
                          34.6,42.5,28.8,33.4,30.2,34.1,32.9,41.2,35.7))

summary(adult)
#age             fat       
#Min.   :23.00   Min.   : 7.80  
#1st Qu.:39.50   1st Qu.:26.68  
#Median :51.00   Median :30.70  
#Mean   :46.44   Mean   :28.78  
#3rd Qu.:56.75   3rd Qu.:33.92  
#Max.   :61.00   Max.   :42.50

sd(adult$age) 
#13.21862
sd(adult$fat)
#13.21862

boxplot(adult$age)
boxplot(adult$fat)

plot(adult$age, adult$fat, main = "Scatter plot",
     xlab = "Age", ylab = "Fat",
     pch = 19, frame = FALSE)

library("car")
scatterplot(adult$age ~ adult$fat, data = adult, 
            smoother = FALSE, grid = FALSE, frame = FALSE)


