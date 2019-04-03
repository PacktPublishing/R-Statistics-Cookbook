set.seed(95)
build_series = function(coef){
start_value    = 90
values         = c(start_value)
previous_value = values

  for (x in 1:200){
    current_value  = coef*previous_value + rnorm(1,0,10)
    values         = c(values,current_value)
    previous_value = current_value
  }
return (values)
}

ss1 = build_series(1)
ss2 = build_series(1)
ss3 = build_series(1)


plot(ss1,type="l",ylim=c(-200,300))
lines(ss2,col="red")
lines(ss3,col="green")



s1 = build_series(0.2)
s2 = build_series(0.2)
s3 = build_series(0.2)

plot(s1,type="l",ylim=c(-50,50))
lines(s2,col="red")
lines(s3,col="green")



acf(s1)
arima(s1,order=c(1,0,0),include.mean = FALSE )



acf(ss1)
arima(ss1,order=c(1,0,0),include.mean = FALSE )


s1_d = diff(s1)
plot(s1_d,type="l")
acf(s1_d)








