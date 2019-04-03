library(MASS) 

library(robust) 

Sigma <- matrix(c(2,1,1,2),2,2) 
d     <- mvrnorm(n = 1000, mu=c(5,5), Sigma) 
covClassic(d,cor = TRUE) 
cov.rob(d,cor = TRUE) 


d[1:50,1:2] = matrix(rnorm(100,20,10),c(50,2)) 
covClassic(d,cor = TRUE) 


cov.rob(d,cor = TRUE) 
d[1:200,1:2] = matrix(rnorm(400,20,10),c(50,2)) 
covClassic(d,cor = TRUE) 
cov.rob(d,cor = TRUE) 