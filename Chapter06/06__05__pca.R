library(MASS) 

library(rospca) 

set.seed(100) 

matrix = diag(10) 

matrix[2,1] = 0.8 

matrix[1,2] = 0.8 

matrix[4,3] = 0.8 

matrix[3,4] = 0.8 

matrix[5,6] = 0.8 

matrix[6,5] = 0.8 






d     <- mvrnorm(n = 1000, mu=rep(0,10), matrix) 

prcomp(d,scale=TRUE,center=TRUE) 

x1 = rospca::robpca(d) 

x1$eigenvalues 



d[1:1,1:10] <- -400 
prcomp(d,scale=TRUE,center=TRUE) 

x1 = rospca::robpca(d) 

x1$eigenvalues 