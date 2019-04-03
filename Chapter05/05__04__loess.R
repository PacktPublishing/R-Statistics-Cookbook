
data = read.csv("./price__sales.csv") 
model_loess1 = loess(data$sales~data$price,  span = 2/3, degree = 2, family = c("gaussian")) 
model_loess2 = loess(data$sales~data$price,  span = 0.1, degree = 2, family = c("gaussian")) 



loess1_wrapper <- function(x){ 
  return (predict(model_loess1,x)) 
}  

loess2_wrapper <- function(x){ 
  return (predict(model_loess2,x)) 
} 

loess1_wrapper(5)   - loess1_wrapper(10)
loess1_wrapper(10)  - loess1_wrapper(15)


plot(data$price,data$sales) 
curve(loess1_wrapper,add=TRUE,col="red",lwd=3) 
curve(loess2_wrapper,add=TRUE,col="blue",lwd=3) 
legend(17.7, 0.5, legend=c("span=0.75", "span=0.1"),col=c("red", "blue"), lty=1:1, cex=0.8) 





ggplot(data, aes(x=price, y=sales)) + geom_point(size=2, shape=1) + geom_smooth(se = TRUE, method = "loess") 
