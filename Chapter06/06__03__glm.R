library(robust) 
set.seed(1000)
x1       = rnorm(1000)   
x2       = rnorm(1000) 
link_val = 2 + 2*x1 + 5*x2   
pr       = 1/(1+exp(-link_val))      
y        = rbinom(1000,1,pr)   
df       = data.frame(y=y,x1=x1,x2=x2) 
glm( y~x1+x2,data=df,family="binomial") 
robust::glmRob(y~x1+x2,data=df,family="binomial") 






x1       = rnorm(1000)   
x2       = rnorm(1000) 
link_val = 2 + 2*x1 + 5*x2   
pr       = 1/(1+exp(-link_val))      
y        = rbinom(1000,1,pr)   
x1[1:50] = 10*rnorm(50) 
df       = data.frame(y=y,x1=x1,x2=x2) 
glm( y~x1+x2,data=df,family="binomial") 
robust::glmRob(y~x1+x2,method="cubif",data=df,family="binomial") 





x1       = rnorm(1000)   
x2       = rnorm(1000) 
link_val = 2 + 2*x1 + 5*x2   
pr       = 1/(1+exp(-link_val))      
y        = rbinom(1000,1,pr)   
x1[1:100] = 10*rnorm(100) 
df       = data.frame(y=y,x1=x1,x2=x2) 
glm( y~x1+x2,data=df,family="binomial") 
robust::glmRob(y~x1+x2,mthod="cubif",data=df,family="binomial")