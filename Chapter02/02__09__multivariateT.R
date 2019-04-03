library(MASS) 
library(Hotelling)

class1 = read.csv("./class1.csv")
class2 = read.csv("./class2.csv")

sapply(class1,mean) 
sapply(class2,mean) 

test_hotelling = hotelling.test(class1,class2) 
print(test_hotelling) 




library(heplots) 

class1$group = "1" 
class2$group = "2" 
combined = rbind(class1,class2) 
combined$group = as.factor(combined$group) 

boxM(cbind(combined$Math,combined$History,combined$Sociology)~group,data = combined) 
