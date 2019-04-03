library(MASS)
library(tidyr)
library(ggplot2)
library(glmnet)
library(dplyr)
set.seed(100)

get_results<- function(lambda){
  coeffs_total=data.frame(V1=numeric(),V2=numeric(),V3=numeric(),V4=numeric(),V5=numeric())
  for (q in 1:100){
    V1 =runif(1000)*100
    V2 =runif(1000)*10 + V1
    
    V3 =runif(1000)*100
    V4 =runif(1000)*10 + V3
    
    V5 =runif(1000)*100
    Residuals =runif(1000)*100
    Y = V1 + V2 + V3 + V4 + Residuals
    coefs_lm <-lm(Y ~ V1 + V2 + V3 + V4 + V5)$coefficients
    coefs_rd <-glmnet(cbind(V1 ,V2,V3,V4 ,V5),Y,lambda=lambda,alpha=0)$beta
    frame1 <-data.frame(V1=coefs_lm[2], V2=coefs_lm[3],V3=coefs_lm[4], V4=coefs_lm[5],V5=coefs_lm[6],method="lm")
    frame2 <-data.frame(V1=coefs_rd[1], V2=coefs_rd[2],V3=coefs_rd[3], V4=coefs_rd[4],V5=coefs_rd[5],method="ridge")
    coeffs_total<-rbind(coeffs_total,frame1,frame2)
  }
  transposed_data= gather(coeffs_total,"variable","value",1:5)
  print(transposed_data%>%group_by(variable,method) %>% summarise(median=median(value)))
  ggplot(transposed_data,aes(x=variable, y=value, fill=method)) +geom_boxplot()
}

get_results(0.1)


V1 =runif(1000)*100
V2 =runif(1000)*10 + V1
V3 =runif(1000)*100
V4 =runif(1000)*10 + V3
V5 =runif(1000)*100
Residuals =runif(1000)*100
Y = V1 + V2 + V3 + V4 + Residuals
cv.lasso=cv.glmnet(cbind(V1 ,V2,V3,V4 ,V5),Y,alpha=1)
cv.lasso
plot(cv.lasso)