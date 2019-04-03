library(MASS) 
f = matrix(c(2,1,1,1,2,1,1,1,2),3,3) 

x1 = mvrnorm(50,c(10,10,10),f) 
x1 = cbind(x1,1) 
x2 = mvrnorm(50,c(10,10,10),f) 
x2 = cbind(x2,2) 
x3 = mvrnorm(50,c(30,10,10),f) 
x3 = cbind(x3,3) 


total_data = data.frame(rbind(x1,x2,x3)) 
colnames(total_data) = c("History","Math","Biology","class") 


result = manova(cbind(History,Math,Biology) ~ class,data=total_data) 
summary(result) 


summary.aov(result) 