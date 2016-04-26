# This script contains functions for getting a feel for the data (e.g. to identify correlating variables, outliers, transformations required?)


# Correlation between variables.
par(mfrow=c(2,5))#display plots in a 2-by-5 grid
for(i in 1:ncol(data)){
 plot(degree~.,data[,c(8,i)],main=paste("degree vs ",colnames(data)[i]))
 abline(lm(degree~.,data[,c(8,i)]),col="red")# Add line of best fit.
}
