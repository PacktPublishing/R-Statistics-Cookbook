set.seed(10) 
library(caret)

baseketball_data_2019 =  read.csv("./lakers_.csv") 
baseketball_data_2019 = baseketball_data_2019[,-c(1,2)] 



rctrl1 <- trainControl(method     = "cv",number=5)  
baseketball_data_2019$win         = as.factor(baseketball_data_2019$win) 
model1      <- train(win~.,baseketball_data_2019,  
                     method     = "logreg",   
                     metric     = "Accuracy", 
                     trControl  = rctrl1,  
                     tuneLength = 4) 