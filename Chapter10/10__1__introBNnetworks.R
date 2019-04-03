library(bnlearn) 

data = read.csv("./employee_data.csv")[-1] 
dag = model2network("[Area][travel_time|Area][performance|travel_time:diet_quality]  
                    [Recently_had_child][Sleep_quality|Recently_had_child:Area][diet_quality|Sleep_quality]") 

plot(dag) 
fitted = bn.fit(dag, data) 


cpquery(fitted, (performance=="HIGH"), (Area=="URBAN")) 
cpquery(fitted, (performance=="HIGH"), (Area=="SUBURBAN")) 



cpquery(fitted, (performance=="HIGH"), (travel_time=="HIGH" & Sleep_quality=="HIGH")) 
cpquery(fitted, (performance=="HIGH"), (travel_time=="HIGH" & Sleep_quality=="LOW")) 



cpquery(fitted, (Sleep_quality=="HIGH"), (performance=="HIGH")) 
cpquery(fitted, (Sleep_quality=="LOW") , (performance=="HIGH")) 



bn.fit.dotplot(fitted$diet_quality) 
dag2 = hc(data, maxp=2) 
plot(dag2) 



whitelist = data.frame(from=c("travel_time","diet_quality"),to=c("performance", "performance")) 
dag2 = hc(data,maxp=2,whitelist=whitelist) 
plot(dag2) 
fitted2 <- bn.fit(dag2,data) 



score(dag, data, type = "aic") 
score(dag2, data, type = "aic") 