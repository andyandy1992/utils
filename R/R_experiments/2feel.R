# This script contains functions for getting a feel for the data (e.g. to identify correlating variables, outliers, transformations required?)


# Correlation between variables.
par(mfrow=c(2,5))#display plots in a 2-by-5 grid
for(i in 1:ncol(data)){
 plot(degree~.,data[,c(8,i)],main=paste("degree vs ",colnames(data)[i]))
 abline(lm(degree~.,data[,c(8,i)]),col="red")# Add line of best fit.
}


# Simple method
pairs(data)

# If there are more than a few predictors, there are too many plots to see any one of them clearly.
# Here's simple solution from https://farawaystatistics.wordpress.com/2015/10/09/plotting-regression-datasets/

head(swiss)

# Now reorganise the data using the tidyr package so that there is one (x,y) pair on each line:
library(tidyr)
rdf <- gather(swiss, variable, value, -Fertility)
head(rdf)

# Use ggplot2 to plot the response against each of the predictors (which are on different scales so
#we need to allow for that

library(ggplot2)
ggplot(rdf, aes(x=value,y=Fertility)) + geom_point() + facet_wrap(~ variable, scale="free_x")
