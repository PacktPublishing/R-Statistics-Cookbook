library(robust) 


r = PlantGrowth


d = aov(weight ~ group,data=r ) 
summary(d)
plot(d, 2) 



robanova = robust::lmRob(weight ~ group,data=r ) 
robust::anova.lmRob(robanova) 





r[1,1] = 50
r[2,1] = 50
d = aov(weight ~ group,data=r ) 

plot(d, 2) 
summary(d)


robanova = robust::lmRob(weight ~ group,data=r ) 
robust::anova.lmRob(robanova) 
