library(lme4) 
library(lmerTest) 
library(lsmeans) 
clients <- read.csv("./clients.csv") 


E = lmer(Sales ~ -1 + Strategy + (1|Client) + (1|Salesman),data=clients)
summary(E) 

result_lsmeans = lsmeans(E,pairwise ~ Strategy) 
print(result_lsmeans) 

anova(E)
