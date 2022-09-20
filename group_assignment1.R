attach(amazon_stocks)
plot(amazon)
acf(amazon)
pacf(amazon)

#Differentiating to get the data stationary
d.X<-diff(amazon)
acf(d.X)
pacf(d.X)

#Double Differentiating
d.Z<-diff(d.X)
acf(d.Z)
pacf(d.Z)

#Estimation and Diagnosis
attach(amazon_stocks)
d.Y<-diff(amazon)
plot(d.Y)
fit<-arima(d.Y,order=c(1,2,1))
res1<-fit$residuals
acf(res1)
Box.test(res1,lag=2,type="Ljung")
shapiro.test(res1)
qqnorm(res1)
qqline(res1)

#prediction 
arima1<-arima(amazon,order=c(1,2,1))
arima1
predict(arima1,n.ahead=20)

library(tseries)
library(fpp2)
library(urca)

#checking for seasonality 
nsdiffs(amazon)

#not seasonal but assume it to be seasonal and perform arima then predict
arima1<-arima(amazon,order=c(1,2,1),seasonal=c(1,2,1))
predict(arima1,n.ahead=10)


