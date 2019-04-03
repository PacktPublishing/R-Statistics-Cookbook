library(forecast)  

car_production                  =read.csv("./car_production.csv")  

car_production$indice_tiempo    = as.Date(car_production$indice_tiempo,"%Y-%m-%d")  
car_production                  = ts(car_production$produccion_automotriz_unidades,start=c(1981,1),frequency = 12)  


plot.ts(car_production) 
acf(diff(car_production)) 



results     <- arima(car_production,order=c(1,1,0),seasonal=c(2,0,0,12)) 
results 



predictions <- forecast(results,24) 
plot(predictions) 



plot.ts(results$residuals) 
qqnorm(results$residuals) 