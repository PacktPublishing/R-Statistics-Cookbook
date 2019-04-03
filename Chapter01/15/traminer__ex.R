
library(TraMineR)

datax       <- read.csv("./data__model.csv",stringsAsFactors = FALSE)
mvad.labels <- c("CLOSED","L1", "L2", "L3")
mvad.scode  <- c("CLD","L1", "L2", "L3")
mvad.seq    <- seqdef(datax, 3:22, states = mvad.scode,labels = mvad.labels)
group__     <- paste0(datax$Sex,"-",datax$Age)


seqHtplot(mvad.seq,group=group__, title = "Entropy index")


dist.om1 <- seqdist(mvad.seq, method = "OM", indel = 1, sm = "TRATE")
library(cluster)
clusterward1 <- agnes(dist.om1, diss = TRUE, method = "ward")
plot(clusterward1, which.plot = 2)
cl1.4 <- cutree(clusterward1, k = 4)
cl1.4fac <- factor(cl1.4, labels = paste("Type", 1:4))

seqrplot(mvad.seq, diss = dist.om1, group = cl1.4fac,border = NA)






