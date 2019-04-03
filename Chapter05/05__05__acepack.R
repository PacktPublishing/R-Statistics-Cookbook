library(acepack)


data   = read.csv("./house_prices.csv") 

x      = data[,2:7] 

y      = data[,1] 



lm_model = lm(data=data,Property_price~ size  + number.bathrooms + number.bedrooms + number.entrances  +  size_balcony + size_entrance) 
summary(lm_model) 


ace_model = ace(x,y) 

ace_model$rsq 

par(mfrow=c(1,2))
plot(ace_model$x[1,],ace_model$tx[,1],xlab="untransformed size_entrance",ylab="transformed size_entrance") 
plot(ace_model$x[5,],ace_model$tx[,5],xlab="untransformed size_balcony",ylab="transformed size_balcony") 


