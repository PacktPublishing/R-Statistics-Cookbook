library(dplyr) 
library(car)

data        = read.csv("./heights.csv") 
data$Sample = as.factor(data$Sample) 
leveneTest(Height ~ Sample,data) 


sample1 = data %>% filter(Sample==1) %>% select(Height) 
sample2 = data %>% filter(Sample==2) %>% select(Height) 


t.test(sample1,sample2,var.equal=TRUE,conf.level = .95,alternative="two.sided") 