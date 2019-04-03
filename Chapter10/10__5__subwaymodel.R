data = read.csv("./subway_data.csv")

data$weather_sunny = 0
data$weather_sunny[data$weather=="sunny"] = 1

hmm    <- depmix(data$people ~ 1  + data$weather_sunny, family = poisson(), nstates = 2, data=data,respstart=c(10,10,10,10))
hmmfit <- fit(hmm, verbose = TRUE)

post_probs <- posterior(hmmfit)
layout(1:2)
plot(data$people,type="l")
data$state_pred = post_probs$state
matplot(post_probs[,-1], type='l', main='Regime Posterior Probabilities', ylab='Probability')
legend(x='topright', c('Closed','Open'), fill=1:3, bty='n')

table(data$state,data$state_pred)




data = read.csv("./subway_data_extended.csv")

data$weather_sunny = 0
data$weather_sunny[data$weather=="sunny"] = 1

hmm    <- depmix(data = data, people ~ 1  + weather_sunny,transition=~1 + machinery_road,  family = poisson(), nstates = 2, respstart=c(10,10,10,10) )
hmmfit <- fit(hmm, verbose = TRUE)
post_probs <- posterior(hmmfit)
data$state_pred = post_probs$state

table(data$state,data$state_pred)





