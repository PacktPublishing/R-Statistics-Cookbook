set.seed(10)

sim_data1  = runif(1000)*100 

sim_data2  = sim_data1 + runif(1000)*100 

depvar     = 40 + sim_data2 + sim_data1 + rnorm(1000,0,20) 

model_data = data.frame(cbind(depvar,sim_data1,sim_data2)) 

summary(lm(data=model_data,depvar ~ sim_data1 + sim_data2)) 




X              = as.matrix(model_data[c("sim_data1","sim_data2")]) 
X              = cbind(rep(1,1000),X) 
colnames(X)[1] = "intercept" 
Y              = as.matrix(model_data["depvar"])



beta                =  solve(t(X) %*% X) %*% (t(X) %*% Y) 
beta
predictions    = X %*%  beta  
head(predictions)



residuals      = predictions - Y 

sd_c           = var(residuals)[1] 

cov_matrix     = solve(t(X) %*% X ) * sd_c 

diag(cov_matrix) = sqrt(diag(cov_matrix)) 

print(paste("Std Error:",diag(cov_matrix))) 
Y              = as.matrix(model_data["depvar"]) 