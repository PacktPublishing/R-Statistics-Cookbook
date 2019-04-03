library(MASS) 
library(caret) 
library(randomForest)

control           <- trainControl(method="repeatedcv", number=4, repeats=1) 
tunegrid          <- expand.grid(.mtry=c(2,3,4,5,6,7,8)) 
data              <- Boston 
result            = train(medv~., data=data, method="rf", metric="RMSE", tuneGrid=tunegrid,   
                         trControl=control,importance=TRUE)$finalModel 

result 




gbmImp            <- varImp(result) 
importance(result) 
varImpPlot(result) 



tunegrid          <- expand.grid(.mtry=c(1)) 
result            = train(medv~., data=data[,c("medv","rm","lstat")], method="rf", metric="RMSE",   
                          tuneGrid=tunegrid, trControl=control)$finalModel 
result 




control <- rfeControl(functions=rfFuncs, method="cv", number=10) 
results <- rfe(as.matrix(data[-14]),as.matrix(data[14]), sizes=c(1:5), rfeControl=control) 
print(results) 
predictors(results) 
plot(results, type=c("g", "o")) 
