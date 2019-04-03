

data       = read.csv("./company_areas.csv") 

xtabs(~ Group + Person, data) 

lmer(Rating ~ -1 + (1 | Group/Person)        , data = data) 

lmer(Rating ~ -1 + (1 | Group) + (1 | Person), data = data) 

 



data2       = read.csv("./company_areas2.csv") 

xtabs(~ Group + Person, data2)

lmer(Rating ~ -1 + (1 | Group/Person)        , data = data2) 

lmer(Rating ~ -1 + (1 | Group) + (1 | Person), data = data2) 