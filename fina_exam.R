install.packages("ggplot2")
install.packages("GGally")
install.packages("MASS")
install.packages("VIM")

library(ggplot2)
library(GGally)
library(MASS)
library(VIM)


#Stepwise selection
#p-value, adj rsq, akaike info criterion AIC
library(MASS)
wine <- read.csv("/Users/ashleyrabanales/Desktop/STAT 4210 - Regression/Data2/winequality.csv")

full_model <- lm(quality ~ ., data = wine)
print(summary(full_model))


stepAIC(full_model, direction ="both")
#summary of AIC commands to have that these vari are best 
#final model <- lm(model)
#Call:
#lm(formula = quality ~ sugar + chlorides + density + pH + sulphates + 
    #alcohol + type, data = wine)
final_model <- lm(quality ~ sugar + chlorides + density + pH + sulphates + 
    alcohol + type, data = wine)

print(summary(final_model))

#PAIRED PLOT
cars <- read.csv("/Users/ashleyrabanales/Desktop/STAT 4210 - Regression/Data2/auto_weight_mpg.csv")

#cars$HorsePower <- as.numeric(cars$HorsePower)
pairs(cars)

#PAIRED PLOT 2
library(ggplots)
library(GGally)
ggpairs(cars) #by default

#mpgxmpg - histogram right skewed 
#smaller sample for wine if it expand it too much 

#IMPUTATION VISUALIZATION
library(VIM)
wine_missing <- read.csv("/Users/ashleyrabanales/Desktop/STAT 4210 - Regression/Data2/winequality.csv")
aggr_plot <- aggr(wine_missing, col=c('green', 'red'), 
    numbers=TRUE, sortVars=TRUE,
    labels=names(data), cex.axis=.7, gap = 3,
    ylab=c("Histogram of missing data", "Pattern"))
#example data set use for the final dataset provided
#what it does the outputs

#visualize the missing data var example 0.06 is missing and var2 there is 0.02 missing,
#interupt the pattern to visualize in var1 roughly 25% znother in var2 25% (roughly)
#inrelationship in fact in the two variable that in var1 is missing then var2 is as well.
