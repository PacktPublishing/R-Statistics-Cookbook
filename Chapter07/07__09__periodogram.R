library(imputeTS) 
library(timesboot) 

steel                        =read.csv("./steel.csv") 
steel                        = ts(steel$valor,start=c(1993,1),frequency = 12) 
plot.ts(steel)  
spectrum(steel, spans = c(5, 7),lty = 1) 





steel_trend  = decompose(steel) 
corrected    = steel - steel_trend$trend 
corrected    = imputeTS::na.kalman(corrected) 
plot.ts(corrected)  




td = timesboot::boot_spec(corrected,de_trend = FALSE) 