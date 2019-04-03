library(rstan)
data   = read.csv("./clients.csv")

model =" 

data { 
int<lower = 0, upper = 1> y[40]; 
real x[40,3]; 
real ns[2,3]; 
} 

parameters { 
real beta[3]; 
real alpha;
} 

model { 
beta   ~ gamma(5,10); 
alpha   ~ normal(0,20);
for (n in 1:40) 
y[n] ~ bernoulli_logit(alpha + beta[1]*x[n,1] + beta[2]*x[n,2] + beta[3]*x[n,3]); 
} 

generated quantities { 

vector[2] y_preds; 
for (n in 1:2) { 
  y_preds[n] = bernoulli_logit_rng(alpha + beta[1]*ns[n,1] + beta[2]*ns[n,2] + beta[3]*ns[n,3]); 
} 
}
" 

topredict = rbind(c(20,0,1),c(60,5,8))
xy     = list(y=data[,1],x=data[,2:4],ns=topredict) 
fit    = stan(model_code = model, data = xy, warmup = 500, iter = 5000, chains = 4, cores = 2, thin = 1,verbose=FALSE) 

rstan::traceplot(fit,pars=c("beta[1]","beta[2]","beta[3]","alpha"))
summary(fit) 
stan_dens(fit) 



