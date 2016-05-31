source("clean_all.R")
source("helpers.R")

# ========
# DATASETS
# ========
setwd("")
some_data = read.csv("some_data.csv)
#or
some_data = read_csv("some_data.csv) # see helpers

# ============
# END DATASETS
# ============

# =======
# MUNGING
# =======

# MISSING VALUES
# ==============

# ===========
# END MUNGING
# ===========


df = some_data # EDIT ME

head(df)
summary(df) # Useful, especially as I don't have much domain knowledge
library(Hmisc)
describe(df)
# ============
# Correlations
# ============
numeric_cols = c(2:11) # EDIT ME
image(cor(df[numeric_cols]), xaxt="n",yaxt="n") # don't label axes; instead label axes using...
for (j in c(1,2)){
  n = length(numeric_cols) - 1
  axis(j, at=c(0:n)/n, labels=colnames(df[numeric_cols]))
}
round(cor(df[,numeric_cols]), 2)

# Plots
# =====
pairs(df[numeric_cols])

#Specify column number of response
colnames(df)
y_column_number = 15 # EDIT ME
y_values = df[[y_column_number]]
y_name = colnames(df[y_column_number])

hist(y_values, prob=T, xlab=y_name, main=y_name)
lines(density(y_values, na.rm=T))
rug(jitter(y_values))

boxplot(y_values, ylab=y_name)
rug(jitter(y_values), side=2)
abline(h=mean(y_values, na.rm=T), lty=2)

plot(y_values, ylab=)

library(car)
qqPlot(y_values, main="Does it look normally distributed (dashed=95% CI of normal dist)?")


create_plots(y_column_number)
library(tidyr)
library(ggplot2)
create_plots <- function(y_column_number) {
  # reorganise so that there is one (x,y) pair on each line:
  rdf <- gather(df, variable, value, -y_column_number)
  head(rdf)
  # Use ggplot2 to plot the response against each of the predictors (which are on different scales so
  #we need to allow for that
  ggplot(rdf, aes(x=value,y=rdf[[y_column_number]])) +
    geom_point() +
    facet_wrap(~ variable, scale="free_x") +
    labs(y = y_name#,
        #title = "Title"
        )
}

# Conditional Plots
# =================
library(lattice)
# make general#####################################################################
bwplot(Cow.Sire ~ Milk.kg, data=LatestRecording)
