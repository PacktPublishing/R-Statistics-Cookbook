library(bbmle)
N <- 1000
xx <- rgamma(N, shape=20,rate=2)
LL <- function(shape, rate) {
R = suppressWarnings(dgamma(xx, shape=shape, rate=rate))
        return(-sum(log(R)))
}

P_1000 = mle2(LL, start = list(shape = 1, rate=1))
summary(P_1000)





N <- 10
x <- rgamma(N, shape=20,rate=2)
LL <- function(shape, rate) {
  R = suppressWarnings(dgamma(x, shape=shape, rate=rate))
  return(-sum(log(R)))
}

P_10 = mle2(LL, start = list(shape = 1, rate=1))
summary(P_10)

confint(P_1000)
confint(P_10)
