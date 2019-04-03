library(caret) 

set.seed(11) 
mushroom_data           = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/agaricus-lepiota.data",head=FALSE) 

colnames(mushroom_data) = c("edible","cap_shape", "cap_surface", "cap_color","bruises","odor", 
                            "gill_attachment","gill_spacing","gill_size","gill_color","stalk_shape", 
                            "stalk_root","stalk_surface_above_ring","stalk_surface_below_ring","stalk_color_above_ring", 
                            "stalk_color_below_ring","veil_type","veil_color","ring_number","ring_type", 
                            "spore_print_color","population","habitat") 


edible                  = mushroom_data[,1] 
mushroom_data           = mushroom_data[,-1] 


mushroom_data           = mushroom_data[,-which(colnames(mushroom_data)=="veil_type")] 
mushroom_dummy_model    = dummyVars(data=mushroom_data,~.,sep="__") 
mushroom_data_model     = cbind(data.frame(predict(mushroom_dummy_model, mushroom_data)),  
                               edible) 



control                 = trainControl(method="repeatedcv", number=4, repeats=1) 
metric                  = "Accuracy" 
tunegrid                = expand.grid(.mtry=c(2,5,7,10)) 



rf_default              = train(edible~., data=mushroom_data_model, method="rf", metric=metric,   
                                tuneGrid=tunegrid,  trControl=control) 


print(rf_default) 
rf_default$finalModel 
