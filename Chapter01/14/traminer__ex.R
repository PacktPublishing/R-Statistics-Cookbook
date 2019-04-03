
library(TraMineR)

datax       <- read.csv("./data__model.csv",stringsAsFactors = FALSE)
mvad.labels <- c("CLOSED","L1", "L2", "L3")
mvad.scode  <- c("CLD","L1", "L2", "L3")
mvad.seq    <- seqdef(datax, 3:22, states = mvad.scode,labels = mvad.labels)
group__     <- paste0(datax$Sex,"-",datax$Age)


seqfplot(mvad.seq, with.legend = T, border = NA,group=group__, main = "Sequence frequency plot")
seqdplot(mvad.seq, with.legend = T,group=group__, border = NA, main = "State distribution plot")



