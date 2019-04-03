library(MASS)
library(caret)
library(RANN)
set.seed(100)
data       <- read.csv("./metals.csv")
data = data[-1]
trainIndex <- createDataPartition(data$metal_strength, p = .75,
                                  list = FALSE, times = 1)
traindata  <- data[trainIndex,]
testdata   <- data[-trainIndex,]


preprocess_object <-
  preProcess(traindata[-1],method=c("medianImpute","scale","center"))
x_transformed <- predict(preprocess_object,traindata[-1])
combined_train_data <- cbind(x_transformed,traindata[1])


control <- trainControl(method="none")
tunegrid <- expand.grid(C=c(0.01))
m3 <- train(metal_strength~., data=combined_train_data,
            method="svmLinear",
            metric="RMSE", tuneGrid=tunegrid, trControl=control)


test_xdata  <- predict(preprocess_object,testdata[-1])
y_test_pred <- predict(m3,test_xdata)
postResample(pred = y_test_pred, obs = testdata$m)



control <- trainControl(method="none")
tunegrid <- expand.grid(C=c(0.9))
m3 <- train(metal_strength~., data=combined_train_data,
            method="svmLinear", metric="RMSE", tuneGrid=tunegrid,
            trControl=control)
test_xdata  <- predict(preprocess_object,testdata[-1])
y_test_pred <- predict(m3,test_xdata)
postResample(pred = y_test_pred, obs = testdata$m)



control <-  trainControl(method="repeatedcv", number=4, repeats=1)
tunegrid <- expand.grid(C=c(0.01,0.1,0.2,0.3,0.4,0.5))
m3 <- train(metal_strength~., data=combined_train_data,
            method="svmLinear",preProcess=c("medianImpute","scale","center")
            ,metric="RMSE", tuneGrid=tunegrid, trControl=control)
m3
m3$bestTune


