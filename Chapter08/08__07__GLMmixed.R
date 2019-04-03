library(lme4) 

library(emmeans) 

library(MASS) 

set.seed(10) 



fixed_std_model  = glm(decrease ~ treatment,family=poisson(),data=OrchardSprays) 

summary(fixed_std_model ) 

emmeans(fixed_std_model, list(pairwise ~ treatment), adjust = "tukey",type="response")

predict(fixed_std_model,data.frame(treatment="D"),type="response")

plot(fixed_std_model) 




model_1 = lme4::glmer(decrease ~ treatment + (1|colpos) + (1|rowpos), family = poisson(), 
                      
                      data = OrchardSprays) 

ss <- getME(model_1,c("theta","fixef")) 

model_2 <- update(model_1,start=ss) 

summary(model_2) 



ranef(model_2) 

fixef(model_2) 

VarCorr(model_2) 




plot(model_2, resid(., scaled=TRUE) ~ fitted(.) | colpos, abline = 0)  

plot(model_2, resid(., scaled=TRUE) ~ fitted(.) | rowpos, abline = 0) 



confint.merMod(model_2) 

emmeans(model_2, list(pairwise ~ treatment), adjust = "tukey",type="response") 


fixed_std_model  = glm.nb(decrease ~ treatment,data=OrchardSprays) 

summary(fixed_std_model)  

model_2 = lme4::glmer.nb(decrease ~ treatment + (1|colpos) + (1|rowpos), data = OrchardSprays) 

ss2 <- getME(model_2,c("theta","fixef")) 

model_3 <- update(model_1,start=ss2) 

summary(model_3) 