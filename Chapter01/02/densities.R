
vals = rnorm(10000,0,1)



plot(main = "density",density(vals))
abline(v=2,col="red")



print(paste("Area to the left of x=2",pnorm(2,0,1)))
print(paste("Area to the right of x=2",1-pnorm(2,0,1)))
print(paste("90th Quantile: x value that has 97.72% to the left",qnorm(0.9772,0,1)))



print(paste("Area to the left of x=3",pchisq(3,33)))

