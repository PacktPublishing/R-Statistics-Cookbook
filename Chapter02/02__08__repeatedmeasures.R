library(ggplot2) 
library(nlme) 
library(lmerTest)
library(lsmeans) 
data_company = read.csv("./employee_time_bonus.csv",stringsAsFactors = TRUE) 



ggplot(data_company,aes(x=Time,y=Performance)) + geom_line() +  
  geom_point(data=data_company,aes(x=Time,y=Performance)) + 
  facet_wrap(~Employee,nrow=3) 


fit <- lme(Performance ~ x_Bonus + x_Sector + Time + Time:x_Bonus , random = list( ~1 |Employee) , correlation = corAR1(form= ~Time|Employee), data = data_company) 
summary(fit) 


anova(fit)



fit <- lme(Performance ~ x_Bonus + x_Sector + Time + Time:x_Bonus , random = list( ~1 |Employee) , data = data_company) 
summary(fit) 





fit <- lme(Performance ~ x_Bonus + x_Sector + Time , random = list( ~1 |Employee) , correlation = corAR1(form= ~Time|Employee), data = data_company) 
print(lsmeans(fit,pairwise ~ x_Bonus)) 



fit <- lme(Performance ~ x_Bonus + x_Sector + Time + Time:x_Bonus , random = list( ~1 + Time |Employee) , correlation = corAR1(form= ~Time|Employee), data = data_company) 
summary(fit)

