x = seq(1,100) 

y = 20/(1+exp(x-50)) 

plot(x,y) 


cor.test( ~ x + y, method = "spearman",conf.level = 0.95) 

cor.test( ~ x + y, method = "pearson",conf.level = 0.95) 


x = seq(1,100) 

y = sapply(x,function(x){(runif(1)-0.5)*10 + 20/(1+exp(x-50))})  

plot(x,y) 



cor.test( ~ x + y, method = "spearman",conf.level = 0.95) 

cor.test( ~ x + y, method = "pearson",conf.level = 0.95) 



salary=c(10,50,45,87,69,100) 

educ_level=c(1,2,3,4,5,6) 

cor.test( ~ salary + educ_level, method = "spearman",conf.level = 0.95) 