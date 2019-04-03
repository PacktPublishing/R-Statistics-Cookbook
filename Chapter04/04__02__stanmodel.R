library(rstan) 

data   = read.csv("./house_prices.csv") 

model =" 

data { 
real y[481]; 
real x[481,6]; 
} 

parameters { 
real beta[6]; 
real sigma; 
real alpha; 
} 

model { 
beta  ~ gamma(3,1); 
for (n in 1:481) 
    y[n] ~ normal(alpha + beta[1]*x[n,1] + beta[2]*x[n,2] + beta[3]*x[n,3] + beta[4]*x[n,4] + beta[5]*x[n,5] +   
beta[6]*x[n,6], sigma); 
} 
" 


lm(data=data,Property_price ~ size + number.bathrooms + number.bedrooms + number.entrances +   size_balcony + size_entrance)  


xy     = list(y=data[,1],x=data[,2:7]) 
fit    = stan(model_code = model, data = xy, warmup = 500, iter = 5000, chains = 3, cores = 2, thin =   1,verbose=FALSE) 

traceplot(fit) 
summary(fit) 
stan_dens(fit) 



model =" 

data { 
real y[481]; 
real x[481,6]; 
} 

parameters { 
real<lower=0> beta[6]; 
real sigma; 
real alpha; 
} 

model { 
beta  ~ normal(5,3); 
for (n in 1:481) 
y[n] ~ normal(alpha + beta[1]*x[n,1] + beta[2]*x[n,2] + beta[3]*x[n,3] + beta[4]*x[n,4] + beta[5]*x[n,5] + beta[6]*x[n,6], sigma); 
} 
" 



xy     = list(y=data[,1],x=data[,2:7]) 
fit    = stan(model_code = model, data = xy, warmup = 500, iter = 1000, chains = 4, cores = 2, thin = 1,verbose=FALSE) 
summary(fit) 
stan_dens(fit) 

