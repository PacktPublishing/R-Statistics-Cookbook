library(MASS) 
library(PRROC) 
library(precrec) 

set.seed(10) 
data = read.csv("/Users/fjuretig/Documents/approved.csv") 
data = data[,-c(1,7)] 
data$Approved_ = "not_approved" 
data$Approved_[data$Approved == 1] <- "approved" 
data$Approved_ = as.factor(data$Approved_) 
data = data[,-1] 


trainIndex       <- createDataPartition(data$Approved_, p = .75,  list = FALSE,  times = 1)  
traindata        <- data[trainIndex,]  
testdata         <- data[-trainIndex,]  


rctrl1          <- trainControl(method     = "cv",number=5,classProbs = TRUE,summaryFunction =   
                                  twoClassSummary)  

baseline        <- train(Approved_~.,traindata,  
                         method     = "gbm",  verbose=FALSE, 
                         trControl  = rctrl1, 
                         metric="ROC", 
                         tuneLength = 10) 


rctrl1          <- trainControl(method     = "cv",number=5,sampling="up",classProbs =   
                                  TRUE,summaryFunction = twoClassSummary)  


up              <- train(Approved_~.,traindata,  
                         method     = "gbm",  verbose=FALSE, 
                         trControl  = rctrl1, 
                         metric="ROC", 
                         tuneLength = 10) 


rctrl1          <- trainControl(method     = "cv",number=5,sampling="smote",classProbs =   
                                  TRUE,summaryFunction = twoClassSummary)  

smote              <- train(Approved_~.,traindata,  
                            method     = "gbm",  verbose=FALSE, 
                            trControl  = rctrl1, 
                            metric="ROC", 
                            tuneLength = 10) 


predictions_baseline = predict(baseline,testdata,type="prob") 
predictions_up       = predict(up,testdata,type="prob") 
predictions_smote       = predict(up,testdata,type="prob") 


confusionMatrix(testdata$Approved_,predict(baseline,testdata)) 
confusionMatrix(testdata$Approved_,predict(up,testdata)) 
confusionMatrix(testdata$Approved_,predict(smote,testdata)) 
confusionMatrix(testdata$Approved_,predict(baseline,testdata),mode="prec_recall") 


confusionMatrix(testdata$Approved_,predict(up,testdata),mode="prec_recall") 
confusionMatrix(testdata$Approved_,predict(smote,testdata),mode="prec_recall") 
