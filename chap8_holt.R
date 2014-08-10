#chap8_holt.R

#取一段序列
ts1 <- window(wti_ts,start=2007,end=2009)

#拟合计算
fit1 <- holt(ts1, alpha=0.2, beta=0.2, initial="simple", h=5) 
fit2 <- holt(ts1, alpha=0.8, beta=0.6, initial="simple", exponential=TRUE, h=5) 
fit3 <- holt(ts1, initial="optimal", h=5) 

#绘图
plot(window(wti_ts,start=2007,end=c(2009,6)), type='o', ylab="WTI", xlab="Year")
lines(fitted(fit1), col='blue', type="l")
lines(fitted(fit2), col="red")
lines(fitted(fit3), col="green")
lines(fit1$mean, col="blue", type="o",pch=2, cex=0.5) 
lines(fit2$mean, col="red", type="o",pch=4, cex=0.5)
lines(fit3$mean, col="green", type="o",pch=19, cex=0.5)
legend("topleft", lty=1, col=c("black","blue","red","green"), 
       c("Data","a=0.2","a=0.8","auto"), pch=1)
