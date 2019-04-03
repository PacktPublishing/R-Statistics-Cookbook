library(ggplot2)
library(reshape)

datag = read.csv("./ctgs.csv")



transformed_data  = melt(datag,id.vars = "Company")

ggplot(transformed_data, aes(x = Company, y = value, fill = variable)) + geom_bar(stat = "identity")
ggplot(transformed_data, aes(x = Company, y = value, fill = variable)) + geom_bar(stat = "identity",position=position_dodge())
