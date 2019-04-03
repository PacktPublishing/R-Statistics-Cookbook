library(ggplot2) 

v1_1 = rnorm(1000,10,1) 
v1_2 = rnorm(1000,10,1) 
v1_3 = rnorm(1000,10,1) 
v2_1 = rnorm(1000,10,1) 
v2_2 = rnorm(1000,10,1) 
v2_3 = rnorm(1000,10,1) 
U       = rnorm(1000,0,3) 
Y       = v1_1 + v1_2 + v1_3 + v2_1 + v2_2 + v2_3 + U 




get_prior <- function(param){ 
  c11_prior = dnorm(param[1], 0.5,5, log = T) 
  c12_prior = dnorm(param[2], 0.5,5, log = T) 
  c13_prior = dnorm(param[3], 0.5,5, log = T) 
  c21_prior = dnorm(param[4], 0.5,5, log = T) 
  c22_prior = dnorm(param[5], 0.5,5, log = T) 
  c23_prior = dnorm(param[6], 0.5,5, log = T) 
  sdprior   = dnorm(param[7], 0.5,5, log = T) 
  return(c11_prior+c12_prior+c13_prior+c21_prior+c22_prior+c23_prior+sdprior) 
  
} 




get_likelihood <- function(param){ 
  pred  = param[1]*v1_1 + param[2]*v1_2 + param[3]*v1_3 + param[4]*v2_1 + param[5]*v2_2 + param[6]*v2_3 
  likelihood_per_observation = dnorm(Y, mean = pred, sd = param[7], log = T) 
  sumll                      = sum(likelihood_per_observation) 
  return(sumll)    
} 


get_posterior <- function(param){ 
  return_value = get_likelihood(param) + get_prior(param) 
  return (return_value) 
} 


get_proposalfunction <- function(param){ 
  return(rnorm(7,mean = param, sd= c(.028,.028,.028,.028,.028,.028,.028))) 
} 



MetropolisHastings_MCMC <- function(start_, iter_){ 
  chain_values     = array(dim = c(iter_+1,7)) 
  chain_values[1,] = start_ 
  for (i in 1:iter_){ 
    proposal = get_proposalfunction(chain_values[i,]) 
    probs    = exp(get_posterior(proposal) - get_posterior(chain_values[i,])) 
    if (is.nan(probs)){ 
      probs = 0 
    } 
    
    random_value = runif(1) 
    if (random_value < probs){ 
      chain_values[i+1,] = proposal 
    }else{ 
      chain_values[i+1,] = chain_values[i,] 
    } 
  } 
  return(chain_values) 
} 


startvalue        = c(0.1,0.1,0.1,0.1,0.1,0.1,10) 
chain_values      = MetropolisHastings_MCMC(startvalue, 50000) 


data           = data.frame(chain_values) 
colnames(data) = c("v1_1","v1_2","v1_3","v2_1","v2_2","v2_3","sd") 
data$iter      = seq.int(nrow(data)) 



ggplot(data=data,aes(x=iter, y=v1_1)) + geom_line(color="blue") 


data           = data[10000:50000,] 
data           = data[seq(1, dim(data)[1], by = 5),]
ggplot(data=data,aes(x=iter, y=v1_1)) + geom_line(color="blue") 



seqs           = seq(1,nrow(data),2) 
plot(density(data[seqs,"v1_1"]),main="V1_1 posterior density") 
