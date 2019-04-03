data = read.csv("./pre_post_employee.csv") 

t.test(data$post_bonus,data$pre_bonus,conf.level = .95,alternative="greater",paired=TRUE) 
t.test(data$post_bonus,data$pre_bonus,conf.level = .95,alternative="less",paired=TRUE) 
