library(ggplot2)
library(tidyr)

rnorm_result  = data.frame(rnorm = rnorm(10000,0,1))
inverse_way   = data.frame(inverse = qnorm(runif(10000),0,1))

total_table   = cbind(rnorm_result,inverse_way)
transp_table  = gather(total_table)
colnames(transp_table) = c("method","value")

ggplot(transp_table, aes(x=value,fill=method)) + geom_density(alpha=0.25) 






rpois_result           = data.frame(rpois   = rpois(10000,5))
inverse_way            = data.frame(inverse = qpois(runif(10000),5))
total_table            = cbind(rpois_result,inverse_way)
transp_table           = gather(total_table)
colnames(transp_table) = c("method","value")


ggplot(transp_table, aes(x=value,fill=method)) + geom_histogram(alpha=0.8,binwidth = 1) 




