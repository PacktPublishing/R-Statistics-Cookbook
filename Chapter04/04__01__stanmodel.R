library(rstan) 

values = list(y = rnorm(1000,5,3)) 

model =" 

data { 
real y[1000]; 
} 

parameters { 
real mu; 
real sigma; 
} 

model { 
mu    ~ normal(0,10);   
sigma ~ normal(0,10);  
y     ~ normal(mu,sigma); 
} 
" 

fit <- stan(model_code = model, data = values, warmup = 500, iter = 1000, chains = 4, cores = 2, thin = 1) 
posterior = extract(fit) 

par(mfrow=c(2,1)) 
plot(posterior$mu, type = "l") 
plot(posterior$sigma, type = "l") 
traceplot(fit) 
stan_dens(fit) 
summary(fit) 

