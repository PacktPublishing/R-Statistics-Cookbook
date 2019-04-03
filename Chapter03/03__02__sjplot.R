library(sjPlot) 
library(lme4)

clients <- read.csv("./sales_clients_combos.csv") 

model1 <- lm(Sales ~ Strategy + (Client) + (Salesman),data=clients) 

tab_model(model1) 




model2 <- lmer(Sales ~ Strategy + Client + (1|Salesman),data=clients) 

tab_model(model2) 



tab_df(clients,title="Clients dataset",alternate.rows = TRUE) 
