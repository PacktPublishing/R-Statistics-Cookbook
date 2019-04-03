data = read.csv("./2wayanova.csv") 

d = aov(Sales ~ Colour + Font + Font*Colour,data=data ) 
plot(d, 2) 
shapiro.test(residuals(d)) 



data = data[-c(22,44),] 
d = aov(Sales ~ Colour + Font + Font*Colour,data=data ) 
plot(d, 2) 
shapiro.test(residuals(d)) 

plot(d, 1) 

anova(d) 

rbind(TukeyHSD(d)$Colour,TukeyHSD(d)$Font) 
