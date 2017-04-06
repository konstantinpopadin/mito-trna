# Sandbox

install.packages("ppcor")
library(ppcor)

# Create a perfectly correlated set of values, so that residuals == 0
# These are our IVs
out <- as.data.frame(mvrnorm(10, mu = c(0,0), Sigma = matrix(c(1,0.56,0.56,1), ncol = 2), empirical = TRUE))

# Now for the DV. Say DV =  0.5*v1 + 2.8v2
dv <- NULL;
for (i in 1:nrow(out)){
  x <- 0.5*out[i, 1] - 0.7*out[i, 2]
  print(x)
  #Some code that generates new row
  rbind(dv, x) -> dv
  print(dv)
}

out <- cbind(out, dv)

# Now do the cor test
#pcor.test(x, y, z, method = c("pearson", "kendall", "spearman"))

pcor.test(out[3], out[1], out[2], method = 'spearman')
pcor.test(out[3], out[2], out[1], method = 'spearman')

#out$V1.s <- (out$V1 - min(out$V1))*1000+10
#out$V2.s <- (out$V2 - min(out$V2))*200+30
