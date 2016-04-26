# This script loads the data and required libraries.


# Clear all
rm(list=ls());cat("\014");dev.off(dev.list()["RStudioGD"])

# Load libaries
libs <- c("tm","plyr","classes")
lapply(libs,require,character.only=TRUE)

# Set options
option(stringAsFactors=FALSE) #don't load any STRING data as factors

# Load data
train <- read.csv("/some/data/path/train.csv")
