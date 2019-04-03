v1_1 = rnorm(1000,10,1) 
v1_2 = rnorm(1000,10,1) 
v1_3 = rnorm(1000,10,1) 
v2_1 = rnorm(1000,10,1) 
v2_2 = rnorm(1000,10,1) 
v2_3 = rnorm(1000,10,1) 
U    = rnorm(1000,0,3) 

Y    = v1_1 + v1_2 + v1_3 + U 

lista = list(x=cbind(v1_1,v1_2,v1_3,v2_1,v2_2,v2_3),y=Y,n=length(Y)) 

library('rjags') 

mod <- " model{ 
    for (i in 1:n){ 
        mu[i] =  id[1]*b[1]*x[i,1] + id[2]*b[2]*x[i,2] + id[3]*b[3]*x[i,3] + id[4]*b[4]*x[i,4] + id[5]*b[5]*x[i,5] +   id[6]*b[6]*x[i,6] 
        y[i] ~ dnorm(mu[i], prec) 
    }             

    for (i in 1:6){ 
        b[i] ~ dnorm(0.0, 1/2) 
        id[i] ~ dbern(0.5) 
    } 
    prec ~ dgamma(1, 2) 
}" 

jags <- jags.model(textConnection(mod), data = lista, n.chains = 1, n.adapt = 100) 
update(jags, 5000) 
samps <- coda.samples( jags, c("b","id"), n.iter=1000 ) 
summary(samps) 




mod <- " model{ 
for (i in 1:n){ 
mu[i] =  id[1]*b[1]*x[i,1] + id[2]*b[2]*x[i,2] + id[3]*b[3]*x[i,3] + id[4]*b[4]*x[i,4] + id[5]*b[5]*x[i,5] +   id[6]*b[6]*x[i,6] 
y[i] ~ dnorm(mu[i], prec) 
}            

ka  ~ dbeta(5,5) 
for (i in 1:6){ 
b[i] ~ dnorm(0.0, 1/2) 
id[i] ~ dbern(ka) 
} 

prec ~ dgamma(1, 2) 
}" 

jags <- jags.model(textConnection(mod), data = lista, n.chains = 1, n.adapt = 100) 
update(jags, 2000) 
samps <- coda.samples( jags, c("b","id"), n.iter=1000 ) 
summary(samps) 