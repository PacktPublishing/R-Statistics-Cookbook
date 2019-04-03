data = read.csv("./people_shopping.csv")

model = lm(sales ~ people_in + discount,data=data) 
plot(model) 

library("lmtest")
bptest(model) 

