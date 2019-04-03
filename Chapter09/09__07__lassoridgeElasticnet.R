set.seed(100) 
library(caret) 
summary(lm(data=longley,Employed~.)) 


rctrl1 <- trainControl(method     = "cv",number=5) 
ols_      <- train(Employed~.,longley, 
                   method     = "lm",  
                   trControl  = rctrl1, 
                   tuneLength = 4,metric="RMSE", 
                   preProc    = c("center", "scale")) 

lasso_    <- train(Employed~.,longley,  
                   method     = "lasso",  
                   trControl  = rctrl1, 
                   tuneLength = 10,metric="RMSE", 
                   preProc    = c("center", "scale")) 

ridge_     <- train(Employed~.,longley,  
                    method     = "ridge",  
                    trControl  = rctrl1, 
                    tuneLength = 10,metric="RMSE", 
                    preProc    = c("center", "scale")) 

elasticnet_ <- train(Employed~.,longley,  
                     method     = "glmnet",  
                     trControl  = rctrl1, 
                     tuneLength = 10,metric="RMSE", 
                     preProc    = c("center", "scale")) 

varImp((elasticnet_)) 