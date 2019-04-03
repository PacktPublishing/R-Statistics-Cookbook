library(car) 

data = read.csv("./house_prices_aug.csv") 

model = lm(Property_price ~ size + number.bathrooms + number.bedrooms +number.entrances +size_balcony  +size_entrance,data=data) 
plot(model)



leveragePlots(model) 

outlierTest(model) 

plot(hatvalues(model), type = "h") 



cooksd <- sort(cooks.distance(model)) 

cutoff <- 4/((nrow(data)-length(model$coefficients)-1))  

plot(model, which=4, cook.levels=cutoff) 


model2 = lm(Property_price ~ size + number.bathrooms + number.bedrooms +number.entrances +size_balcony  +size_entrance,data=data[-c(408),])

model
model2
