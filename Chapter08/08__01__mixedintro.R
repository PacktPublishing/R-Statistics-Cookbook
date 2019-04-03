data = read.csv("./sample_random_regression.csv") 

data$clientid = as.factor(data$clientid) 

library("lme4") 


lmer(data=data,deal_size ~ salespeople_involved + time_spent_deal + (-1 + salespeople_involved|clientid) + (-1 + time_spent_deal|clientid) ) 

lmer(data=data,deal_size ~ salespeople_involved + time_spent_deal + (1  + salespeople_involved|clientid) ) 

lmer(data=data,deal_size ~ salespeople_involved + time_spent_deal + (1  + time_spent_deal + salespeople_involved|clientid) ) 

model = lmer(data=data,deal_size ~ salespeople_involved + time_spent_deal + (-1 + salespeople_involved|clientid) + (-1 + time_spent_deal|clientid) ) 
ranef(model) 
