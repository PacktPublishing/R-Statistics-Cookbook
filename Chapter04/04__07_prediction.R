library(rstan) 

data   = read.csv("./house_prices.csv") 




model =" 

data { 

real y[481]; 

real x[481,6]; 

real ns[2,6]; 

} 

parameters { 

real beta[6]; 

real sigma; 

real alpha; 

} 

model { 

beta  ~ normal(5,10); 

for (n in 1:481) 

y[n] ~ normal(alpha + beta[1]*x[n,1] + beta[2]*x[n,2] + beta[3]*x[n,3] + beta[4]*x[n,4] + beta[5]*x[n,5] +   

beta[6]*x[n,6], sigma); 

} 

generated quantities { 

vector[2] y_preds; 
for (n in 1:2) { 
y_preds[n] = normal_rng(alpha + beta[1]*ns[n,1] + beta[2]*ns[n,2] + beta[3]*ns[n,3] + beta[4]*ns[n,4] +   beta[5]*ns[n,5] + beta[6]*ns[n,6], sigma); 
} 
} 

" 
topredict = rbind(c(10,3,3,3,3,20),c(7,3,3,3,3,10))
xy     = list(y=data[,1],x=data[,2:7],ns=topredict) 
fit    = stan(model_code = model, data = xy, warmup = 500, iter = 5000, chains = 4, cores = 2, thin = 1,verbose=FALSE) 
