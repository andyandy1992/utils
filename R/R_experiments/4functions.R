# This script contains all of the functions needed to perform the actual analysis.


# Training


# Diagnostics Functions
lm_diagnostics <- function (){#I haven't tested this function
    fpar(mfrow=c(2,2))
    plot(q1modpreuni.a,1)
    plot(q1modpreuni.a,2)
    plot(q1modpreuni.a,5)
}
