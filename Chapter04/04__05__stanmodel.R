library(rstan) 

library(coda) 

library(DrBats) 




data   = read.csv("./house_prices.csv") 

model =" 
data { 
real y[481]; 
real x[481,6]; 
} 

parameters { 
real <lower=0> beta[6]; 
real sigma; 
real alpha; 
} 

model { 
beta ~ normal(5,20); 
for (n in 1:125) 
y[n] ~ normal(alpha + beta[1]*x[n,1] + beta[2]*x[n,2] + beta[3]*x[n,3] + beta[4]*x[n,4] + beta[5]*x[n,5] + beta[6]*x[n,6], sigma); 
} 
" 

xy     = list(y=data[,1],x=data[,2:7]) 
fit    = stan(model_code = model, data = xy, warmup = 500, iter = 5000, chains = 4, cores = 2, thin = 1,verbose=FALSE) 



coda__obj = coda.obj(fit) 
heidel.diag(coda__obj)

HPDinterval(coda__obj)

raftery.diag(coda__obj)

effectiveSize(coda__obj)

cumuplot(coda__obj)

gelman.plot(coda__obj)

geweke.plot(coda__obj)

crosscorr.plot(coda__obj)

autocorr.plot(coda__obj)
