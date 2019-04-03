
library(FSA) 
library(dplyr) 


t     = read.csv("./anova__lot_type.csv") 
kruskal.test(Result ~ Food.Type,data=t)


dunnTest(Result ~ Food.Type,data=t) 
