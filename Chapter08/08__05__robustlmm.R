library(lme4)
library(robustlmm)
set.seed(10) 

X = 7*runif(1000) 
G = c() 

for (x in 1:100){ 
  G = c(G,rep(x,10)) 
} 

pre____frame          = cbind(X=X,G=G,NOISE = rnorm(1000,0,0.03)) 
shocks_frame          = cbind(G = 1:100,shocks = rnorm(100,0,1)) 
merged_frame          = merge(pre____frame,shocks_frame,by="G") 
merged_frame$Y        = 10 + merged_frame$shocks + merged_frame$NOISE 
XYG                   = merged_frame[,c(1,2,5)] 


lmer(data=XYG, Y ~ 1 + (1|G))
rlmer(data=XYG, Y ~ 1 + (1|G))

positions = sample(1:1000, 50, replace=T)
XYG[positions,"Y"] = rnorm(1,50,10)




lmer(data=XYG, Y ~ 1 + (1|G))
rlmer(data=XYG, Y ~ 1 + (1|G))

model = rlmer(data=XYG, Y ~ 1 + (1|G))
plot(model)

