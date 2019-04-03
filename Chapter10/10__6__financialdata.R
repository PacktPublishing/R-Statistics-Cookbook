library('depmixS4') 

datas           = read.csv("./hist_PAM20190304.csv")[5] 
returns        = diff(datas$cierre)/datas$cierre[-length(datas$cierre)] 
plot(returns,type="l") 
returns        = data.frame(returns =returns) 
hist(returns$returns,main="Histogram of returns") 






hmm <- depmix(returns ~ 1, family = gaussian(), nstates = 2, data=data.frame(returns=returns)) 
hmmfit <- fit(hmm, verbose = FALSE) 






post_probs <- posterior(hmmfit) 
layout(1:4) 
plot(datas$cierre,type="l") 
plot(returns$returns,type="l") 
plot(post_probs$state, type='s', main='True Regimes', xlab='', ylab='Regime') 
matplot(post_probs[,-1], type='l', main='Regime Posterior Probabilities', ylab='Probability') 
legend(x='topright', c('Flat-Bear','Bull'), fill=1:3, bty='n') 





hmm <- depmix(returns ~ 1, family = gaussian(), nstates = 3, data=data.frame(returns=returns)) 