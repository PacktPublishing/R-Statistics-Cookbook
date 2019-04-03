data = read.csv("./people_shopping.csv")

model = lm(sales ~ people_in + discount,data=data) 

library("lmtest")
bptest(model) 

summary(model)


library(sandwich)
coeftest(model, vcov=vcovHC(model)) 
