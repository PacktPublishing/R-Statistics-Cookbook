calc_effective_alphas <- function(n,sd1,sd2,equalvar){  
  rejected <- 0 
  for (x in 1:100000){ 
    data1 <- rnorm(n,10,sd1) 
    data2 <- rnorm(n,10,sd2) 
    result <- t.test(data1,data2,var.equal=equalvar)$p.value 
    if (result < 0.05){ 
      rejected <- rejected + 1 
    } 
  } 
  return (rejected/100000) 
} 


print(paste("n=10 / sd1=2 / sd2=5 / effective alpha=",calc_effective_alphas(10,2,5,TRUE))) 
print(paste("n=10 / sd1=2 / sd2=20/ effective alpha=",calc_effective_alphas(10,2,20,TRUE))) 
print(paste("n=10 / sd1=2 / sd2=5 / effective alpha=",calc_effective_alphas(10,2,5,FALSE))) 
print(paste("n=10 / sd1=2 / sd2=20/ effective alpha=",calc_effective_alphas(10,2,20,FALSE))) 


calc_power <- function(n,sd1,sd2,equalvar){  
  rejected <- 0 
  for (x in 1:100000){ 
    data1 <- rnorm(n,12,sd1) 
    data2 <- rnorm(n,10,sd2) 
    result <- t.test(data1,data2,var.equal=equalvar)$p.value 
    if (result < 0.05){ 
      rejected <- rejected + 1 
    } 
  } 
  return (rejected/100000) 
} 

print(paste("n=10 / sd1=2 / sd2=20/ effective power=",calc_power(10,2,2,TRUE))) 
print(paste("n=10 / sd1=2 / sd2=20/ effective power=",calc_power(10,2,2,FALSE))) 