library("lme4") 

library(cAIC4) 

set.seed(25) 

data = read.csv("./sample_random_regression.csv") 

data$clientid = as.factor(data$clientid) 

data$ERR_1  = rnorm(100,0,10) 

data$ERR_2  = rnorm(100,0,10) 

data$ERR_3  = rnorm(100,0,10) 

data$ERR_4  = rnorm(100,0,10) 



m1 = lmer(data=data,deal_size ~ salespeople_involved + time_spent_deal + (-1 + salespeople_involved|clientid) + (-1 + time_spent_deal|clientid) ) 

m2 = lmer(data=data,deal_size ~ salespeople_involved + time_spent_deal + (1  + salespeople_involved|clientid) ) 

m3 = lmer(data=data,deal_size ~ salespeople_involved + time_spent_deal + (1  + time_spent_deal + salespeople_involved|clientid) )  

m4 = lmer(data=data,deal_size ~ salespeople_involved + time_spent_deal + ERR_1 + ERR_2 + ERR_3 + ERR_4 + (1  + time_spent_deal + salespeople_involved|clientid) )  

m5 = lmer(data=data,deal_size ~ salespeople_involved + time_spent_deal + ERR_1 + ERR_2 + ERR_3  + (1  + time_spent_deal + salespeople_involved|clientid) )  

m6 = lmer(data=data,deal_size ~ salespeople_involved + time_spent_deal + ERR_1 + ERR_2  + (1  + time_spent_deal + salespeople_involved|clientid) )  

m7 = lmer(data=data,deal_size ~ salespeople_involved + time_spent_deal + ERR_1  + (1  + time_spent_deal + salespeople_involved|clientid) ) 



cAIC(m1)$caic 


cAIC(m2)$caic 


cAIC(m3)$caic 


cAIC(m4)$caic 


cAIC(m5)$caic 


cAIC(m6)$caic 


cAIC(m7)$caic 

