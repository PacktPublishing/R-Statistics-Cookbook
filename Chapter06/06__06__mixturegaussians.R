library(qclust) 

data ("geyser2")


result_robust_mixture <- qclust::Qclust(geyser2,K=3,q=0.9999) 

plot(result_robust_mixture) 

plot(result_robust_mixture,what="density",type="persp")
plot(result_robust_mixture,what="boundaries",ngrid=200) 