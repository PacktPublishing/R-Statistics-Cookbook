data             = read.csv("./heights.csv") 
data$Sample = as.factor(data$Sample) 
wilcox.test(Height ~ Sample,data=data) 



data = read.csv("./pre_post_employee.csv") 
wilcox.test(data$post_bonus, data$pre_bonus,paired=TRUE) 


