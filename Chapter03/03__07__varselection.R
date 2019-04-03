library("olsrr") 
library(dplyr) 


model = lm(data=Boston,medv ~ .) 

head(ols_step_all_possible(model) %>% arrange(desc(adjr))) 

ols_step_forward_p(model) 

ols_step_backward_p(model) 

ols_step_both_p(model) 




ols_step_forward_aic(model) 

ols_step_backward_aic(model) 

ols_step_both_aic(model) 

