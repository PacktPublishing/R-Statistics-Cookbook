library(SemiPar) 
set.seed(10)

x1       = rnorm(100,20,6) 
x2       = runif(100,1,8) 
y        = 10 + x1 + x2 + rnorm(100,0,5)  
data_sim = data.frame(x1=x1,x2=x2,y=y) 
par(mfrow=c(1,2))

attach(data_sim)
fit <- spm(y ~ x1 +x2) 
summary(fit)
plot(fit) 




x1       = rnorm(100,20,6) 
x2       = runif(100,1,8) 
y        = 10 + x1 + 150*exp(-x2) + rnorm(100,0,5)  
data_sim = data.frame(x1=x1,x2=x2,y=y) 
fit <- spm(data_sim$y ~  f(data_sim$x1)+f(data_sim$x2)) 
summary(fit) 
plot(fit) 





fit <- spm(data_sim$y ~ data_sim$x1 + f(data_sim$x2)) 
summary(fit) 




fit <- spm(data_sim$y ~ data_sim$x1 + f(data_sim$x2,spar=20)) 
summary(fit) 
plot(fit)

fit <- spm(data_sim$y ~ data_sim$x1 + f(data_sim$x2,df=6)) 
summary(fit) 
plot(fit)