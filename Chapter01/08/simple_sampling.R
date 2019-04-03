library(dplyr)
library(ggplot2)

voters_data = read.csv("./voters_.csv")



proportions_10sample = c()
for (q in 2:1000){
  sample_data = mean(sample(voters_data$Vote,10,replace = FALSE))
  proportions_10sample = c(proportions_10sample,sample_data)
}

proportions_50sample = c()
for (q in 2:1000){
  sample_data = mean(sample(voters_data$Vote,50,replace = FALSE))
  proportions_50sample = c(proportions_50sample,sample_data)
}

proportions_100sample = c()
for (q in 2:1000){
  sample_data = mean(sample(voters_data$Vote,100,replace = FALSE))
  proportions_100sample = c(proportions_100sample,sample_data)
}

proportions_500sample = c()
for (q in 2:1000){
  sample_data = mean(sample(voters_data$Vote,500,replace = FALSE))
  proportions_500sample = c(proportions_500sample,sample_data)
}

joined_data50  = data.frame("sample_size"=50,"mean"=mean(proportions_50sample), "q2.5"=quantile(proportions_50sample,0.025),"q97.5"=quantile(proportions_50sample,0.975))
joined_data10  = data.frame("sample_size"=10,"mean"=mean(proportions_10sample), "q2.5"=quantile(proportions_10sample,0.025),"q97.5"=quantile(proportions_10sample,0.975))
joined_data100 = data.frame("sample_size"=100,"mean"=mean(proportions_100sample), "q2.5"=quantile(proportions_100sample,0.025),"q97.5"=quantile(proportions_100sample,0.975))
joined_data500 = data.frame("sample_size"=500,"mean"=mean(proportions_500sample), "q2.5"=quantile(proportions_500sample,0.025),"q97.5"=quantile(proportions_500sample,0.975))

data_sim       = rbind(joined_data10,joined_data50,joined_data100,joined_data500)
data_sim        = data_sim %>% mutate(Nq2.5 = mean - 1.96*sqrt(mean*(1-mean)/sample_size),N97.5 = mean + 1.96*sqrt(mean*(1-mean)/sample_size))
data_sim$sample_size = as.factor(data_sim$sample_size)

ggplot(data_sim, aes(x=sample_size, y=mean, group=1)) +
  geom_point(aes(size=2), alpha=0.52) +  theme(legend.position="none") +
  geom_errorbar(width=.1, aes(ymin=q2.5, ymax=q97.5), colour="darkred") + labs(x="Sample Size",y= "Candidate A ratio", title="Candidate A ratio by sample size", subtitle="Proportion of people voting for candidate A, assuming 50-50 chance", caption="Circle is mean / Bands are 95% Confidence bands")


