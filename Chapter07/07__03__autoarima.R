library(forecast) 

average_temp                  = read.csv("./temperature.csv") 
average_temp$indice_tiempo    = as.Date(average_temp$indice_tiempo,"%Y-%m-%d") 
average_temp                  = ts(average_temp$temperatura_promedio,start=c(2001,1),frequency = 12)


plot.ts(average_temp) 
best_mode                     = auto.arima(average_temp,max.p=5,max.q=5,max.Q=2,max.P=2,allowmean = TRUE,allowdrift = FALSE)


plot.ts(average_temp) 
lines(best_mode$fitted,col="red") 

predictions <- forecast(best_mode$fitted,48) 
plot(predictions) 
