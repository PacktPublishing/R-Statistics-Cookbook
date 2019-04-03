library(caret)

mushroom_data = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/agaricus-lepiota.data",head=FALSE)
colnames(mushroom_data) = c("edible","cap-shape", "cap-surface", "cap-color","bruises","odor",
                            "gill-attachment","gill-spacing","gill-size","gill-color","stalk-shape",
                            "stalk-root","stalk-surface-above-ring","stalk-surface-below-ring","stalk-color-above-ring",
                            "stalk-color-below-ring","veil-type","veil-color","ring-number","ring-type",
                            "spore-print-color","population","habitat")



trainIndex <- createDataPartition(mushroom_data$edible, p = .75, list = FALSE, times = 1)
traindata <- mushroom_data[trainIndex,]
testdata <- mushroom_data[-trainIndex,]




total_proportion <- nrow(mushroom_data[mushroom_data$edible=="e",])/nrow(mushroom_data)
train_proportion <- nrow(traindata[traindata$edible=="e",])/nrow(traindata)
test_proportion <- nrow(testdata[testdata$edible=="e",])/nrow(testdata)
print(paste("p of edible in data=",round(total_proportion,3),
            "/p of edible in train=",round(train_proportion,3),
            "/p of edible in test=",round(test_proportion,3)))



bootstrap_sample <- createResample(mushroom_data$edible,times=10,list=FALSE)





kfolds_results = createFolds(mushroom_data$edible, k=4,list=FALSE)
r1 = nrow(mushroom_data[kfolds_results==1 & mushroom_data$edible=="e",])/nrow(mushroom_data[kfolds_results==1,])
r2 = nrow(mushroom_data[kfolds_results==2 & mushroom_data$edible=="e",])/nrow(mushroom_data[kfolds_results==2,])
r3 = nrow(mushroom_data[kfolds_results==3 & mushroom_data$edible=="e",])/nrow(mushroom_data[kfolds_results==3,])
r4 = nrow(mushroom_data[kfolds_results==4 & mushroom_data$edible=="e",])/nrow(mushroom_data[kfolds_results==4,])
print(paste("proportion of edible in fold1=",r1,
            "/proportion of edible in fold2=",r2,
            "/proportion of edible in fold3=",r3,
            "/proportion of edible in fold4=",r4))


r = rnorm(10,0,1)
createTimeSlices(r,4,horizon=2)