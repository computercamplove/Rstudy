#1
install.packages("pacman")
#load package
require(pacman)
library(pacman)

pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes,
               ggves, httr, lubridate, plotly, rio, rmarkdown, shiny,
               stringr, tidyr)

library(datasets)


## graphics

library(datasets)
head(iris)

?plot #help window
factor(iris$Species) #to see levels/categories

plot(iris$Species) #categorical variables
plot(iris$Petal.Length) #quantitative variable (50 each)
plot(iris$Species, iris$Petal.Width) #category x quantitative
plot(iris) 

plot(iris$Petal.Length, iris$Petal.Width,
     col = "#cc0000", #hex color
     pch = 19, #use solid circles for points
     main = "Iris: petal length vs. petal width",
     xlab = "Petal Length",
     ylab = "Petal Width")

#formulas
plot(cos, 0, 2*pi)
plot(exp, 1,5)
plot(dnorm, -3, +3,
     col = "#cc0000",
     lwd = 5,
     main= "standart normal distribution",
     xlab = "z-scores",
     ylab = "Density")
