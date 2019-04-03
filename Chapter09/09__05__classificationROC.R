library(MASS) 
library(PRROC) 
library(precrec) 
library(pROC)

set.seed(10) 
data = read.csv("./approved.csv") 
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

model1          <- train(Approved_~.,traindata,  
                         method     = "gbm",  verbose=FALSE, 
                         trControl  = rctrl1,metric="ROC", 
                         tuneLength = 10) 



predictions_train = predict(model1,traindata) 
confusionMatrix(traindata$Approved_,predictions_train) 



predictions_test = predict(model1,testdata) 
confusionMatrix(testdata$Approved_,predictions_test) 


plot.roc(traindata$Approved_,predict(model1, traindata, type="prob")[,1],main="ROC curves,   
         black=train,red=test") 
plot.roc(testdata$Approved_,predict(model1, testdata, type="prob")[,1],col="red",add=TRUE) 




par(mfrow=c(2,1)) 
sscurves <- evalmod(scores = predict(model1, traindata, type="prob")[,2], labels = traindata$Approved_) 
plot(sscurves) 

sscurves <- evalmod(scores = predict(model1, testdata, type="prob")[,2], labels = testdata$Approved_) 
plot(sscurves) 
