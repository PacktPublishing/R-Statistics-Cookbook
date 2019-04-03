library(multcomp) 

data  = read.csv("./house_prices.csv") 

model = lm(Property_price ~ size + number.bathrooms + number.bedrooms + number.entrances +  size_balcony  + size_entrance,data=data) 
summary(model)

summary(glht(model,linfct = c("number.bathrooms + number.entrances + number.bedrooms + size_balcony + size_entrance - size  = 0")))

summary(glht(model,linfct = c("number.entrances + number.bathrooms - size_balcony - size_entrance = 0"))) 
