set.seed(10)
x1 = rnorm(100,0,2)
x2 = rnorm(100,0,2)
y = x1 + x2 + rnorm(100,0,1)
y[100] = 100

plot(x1,y)

e = lm(y ~ -1+ x1 + x2) 
summary(e) 



rlm_model = rlm(y ~ -1 + x1 + x2,psi =psi.huber) 
summary(rlm_model) 


rlm_model = rlm(y ~ -1 + x1 + x2,psi = psi.hampel) 
summary(rlm_model) 

rlm_model = rlm(y ~ -1 + x1 + x2,psi = psi.bisquare) 
summary(rlm_model) 
