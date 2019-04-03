library(tclust) 
library(ggplot2)
data ("geyser2") 


clus_kmeans     <- kmeans (geyser2, centers = 3) 
clus_tkmeans    <- tkmeans (geyser2, k = 3, alpha = 0.05) 
geyser2$cluster <- as.factor(clus_kmeans$cluster) 




ggplot(geyser2, aes(x=geyser2$`Eruption length`, y=geyser2$`Previous eruption length`,color=geyser2$cluster))   + labs(x = "Eruption length", y = "Previous eruption length")+theme(legend.position="none") +  geom_point(aes(size=3,alpha = 0.2)) 


plot (clus_tkmeans,main="Robust k-means",xlab="X-axis label", ylab="y-axix label")
