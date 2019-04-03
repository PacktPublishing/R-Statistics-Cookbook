library(dplyr) 
library(car)
r = read.csv("./2wayanova.csv") 
r = r[-c(22,44),] 


type1 = aov(Sales ~ Colour + Font + Font*Colour,data=r ) 
summary(type1)



type2 = Anova(aov(Sales ~ Colour + Font,data=r ),type=c("II")) 
type2



options(contrasts = c("contr.sum","contr.poly")) 
type3 = Anova(aov(Sales ~ Colour + Font + Font*Colour,data=r ),type=c("III")) 
type3 