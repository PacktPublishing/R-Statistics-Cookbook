set.seed(10) 

X = 7*runif(1000) 

G = c() 

for (x in 1:100){ 
  
  G = c(G,rep(x,10)) 
  
} 

pre____frame          = cbind(X=X,G=G,NOISE = rnorm(1000,0,0.03)) 

shocks_frame          = cbind(G = 1:100,shocks = rnorm(100,0,1)) 

merged_frame          = merge(pre____frame,shocks_frame,by="G") 

merged_frame$Y        = 1/(1+exp(-merged_frame$X + merged_frame$shocks)) + merged_frame$NOISE 

XYG  = merged_frame[,c(1,2,5)] 



get__loglikelihood = function(params){ 
  
  BETA1  = params[1] 
  
  SIGMAG = params[2] 
  
  SIGMA  = params[3] 
  
  GROUP_LIK = 0 
  
  IS_ERROR = FALSE 
  
  
  
  for (q in 1:100){ 
    
    group_data      = XYG[XYG$G==q,] 
    
    average = 0; 
    
    for (sim in 1:500){ 
      
      group_data$shock= rnorm(10,0,SIGMAG) 
      
      group_data$pred = 1/(1+exp(-BETA1*group_data$X + group_data$shock)) 
      
      mult            = 1 
      
      for (x in 1:10){ 
        
        mult = mult * dnorm(group_data$pred[x]-group_data$Y[x],0,SIGMA) 
        
      } 
      
      average = average + mult 
      
    } 
    
    average = average/500 
    
    average = log(average) 
    
    GROUP_LIK = GROUP_LIK + average 
    
  } 
  
  if (is.na(GROUP_LIK) | GROUP_LIK == -Inf){ 
    
    GROUP_LIK = -1000000000 
    
  } 
  
  return(-GROUP_LIK) 
  
} 



Sys.time() 

optim(c(1,1,0.03),get__loglikelihood,method="BFGS",control=list(trace=1,REPORT=1)) 

Sys.time() 