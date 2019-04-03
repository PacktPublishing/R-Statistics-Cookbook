data = read.csv("./shoes_sales.csv") 

library(caret) 
library(car)

X = data[-1] 

findLinearCombos(X) 




X = as.matrix(X) 

det(t(X) %*% X) 




model = lm(data=data,Sales ~ women_apparel_price + male_apparel_price+ shoes_female_price + shoes_male_price +shoes_kids_prices+shoes_male_price_b+prices_shoes) 
summary(model) 

det(t(X[,c(-6,-7)]) %*% X[,c(-6,-7)]) 


fixedmodel = lm(data=data,Sales ~ women_apparel_price + male_apparel_price+ shoes_female_price + shoes_male_price +shoes_kids_prices) 
summary(fixedmodel) 
vif(fixedmodel)




aggregated_apparel    = data$women_apparel_price + data$male_apparel_price 
aggregated_femalekids = data$shoes_female_price + data$shoes_kids_prices 
finalmodel = lm(data=data,Sales ~  aggregated_apparel + shoes_male_price + aggregated_femalekids) 
summary(finalmodel) 
vif(finalmodel) 
