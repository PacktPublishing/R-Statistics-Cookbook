data = read.csv("./anova__lot_type.csv") 

result = lm(Result ~ Lot,data=data) 
SS_LOT = sum((predict(result)-mean(data$Result))**2) 

result      = lm(Result ~ Lot + Food.Type,data=data) 
SS_FOODTYPE = sum((predict(result)-mean(data$Result))**2) - SS_LOT 

SS_ERROR = sum((predict(result)-data$Result)**2) 

FF_LOT        = (SS_LOT/1)/(SS_ERROR/56) 
FF_FOODTYPE   = (SS_FOODTYPE/2)/(SS_ERROR/56) 
pval_LOT      = 1-pf(FF_LOT,1,56) 
pval_FOODTYPE = 1-pf(FF_FOODTYPE,2,56) 



print(paste("SS(ERROR) = ",SS_ERROR)) 
print(paste("SS(LOT) =",SS_LOT,"/F(LOT) = ",FF_LOT,"pvalue = ",pval_LOT)) 
print(paste("SS(FOODTYPE) =",SS_FOODTYPE,"/F(FOODTYPE) = ",FF_FOODTYPE,"pvalue = ",pval_FOODTYPE)) 


anova(result) 
