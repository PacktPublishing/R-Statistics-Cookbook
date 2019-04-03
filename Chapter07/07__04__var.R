library(vars) 


oilgas                      =read.csv("./fuel_series.csv") 
colnames(oilgas)            = c("time_index","oil_processed","gasoil_prod","fueloil_prod","butane")
joined_data                 =ts(oilgas[-1],start=c(1996,1),frequency=12) 


m = VAR(joined_data,p=12) 
summary(m)
restrict(m, method = "ser") 
any(roots(m)>0.9999)

normalitytest <- normality.test(m)
plot(normalitytest)

plot(m)

var.2c.fevd <- fevd(m, n.ahead = 5)
plot(var.2c.fevd)

var.2c.irf <- irf(m, impulse = "oil_processed",
                  response = c("butane", "gasoil_prod", "fueloil_prod"), boot = TRUE)
plot(var.2c.irf)

var.2c.prd <- predict(m, n.ahead = 24, ci = 0.95)
plot(var.2c.prd)
