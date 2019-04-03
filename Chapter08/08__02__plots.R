library(dplyr) 
library("lme4") 
library(ggplot2) 
library(sjPlot)
library(sjmisc)

data = read.csv("./sample_random_regression.csv") 
data$clientid = as.factor(data$clientid) 




ggplot(data=data, aes(x=salespeople_involved, y=deal_size, col=clientid))+  
  geom_point(size=.7, alpha=.8, position = "jitter")+ 
  geom_smooth(method=lm,se=FALSE, size=0.6, alpha=.5)+theme_minimal()+labs(title="Linrved",  subtitle="The  lsses", col= "Yeance") 



model = lmer(data=data,deal_size ~ salespeople_involved + time_spent_deal +  (1+time_spent_deal+salespeople_involved|clientid) )
 



ggplot(data) +  
  aes(x = time_spent_deal, y = deal_size) +  
  geom_point() + 
  facet_wrap("clientid") 


F = coef(model)$clie
F$clientid = row.names(F)


ggplot(F,aes(x=reorder(clientid, -salespeople_involved), y=salespeople_involved)) +  
  geom_bar(stat="identity", color="blue", fill="white") + labs(x = "Clientid",y = "Fixed + Random effect",title =  
                                                                 "Sales people involved / Deal size slope") 



plot_model(model,type="re")



plot(model, clientid ~ resid(., scaled=TRUE)) 
plot (model, deal_size ~ fitted(.) | clientid, abline = c (0,1)) 
plot(model, resid(., scaled=TRUE) ~ salespeople_involved | clientid, abline = 0) 
plot(model, resid(., scaled=TRUE) ~ time_spent_deal | clientid, abline = 0) 