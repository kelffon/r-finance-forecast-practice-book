#chap8_damp.R

#取一段数据，到2014年1月
#wti_mon=to.monthly(WTI)
#wti_ts = ts(wti_mon[,1], frequency=12, start=c(2007,1))
ts1 <- window(wti_ts,start=2011,end=2014)

#使用多种方法预测，预测周期为6个月
fit1 <- ses(ts1, h=6)
fit2 <- holt(ts1, h=6)
fit3 <- holt(ts1,exponential=TRUE, h=6)
fit4 <- holt(ts1,damped=TRUE, h=6)
fit5 <- holt(ts1,exponential=TRUE,damped=TRUE, h=6)

#绘图
plot(window(wti_ts, start=2011,end=c(2014,7)), type="o", ylab="WTI")
lines(fit1$mean, col=2, type='o', cex=0.6, pch=2)
lines(fit2$mean, col=3, type='o', cex=0.6, pch=3)
lines(fit3$mean, col=4, type='o', cex=0.6, pch=4)
lines(fit4$mean, col=5, type='o', cex=0.6, pch=5)
lines(fit5$mean, col=6, type='o', cex=0.6, pch=6)
legend("topleft", lty=1, col=1:6, pch=c(1,2,3,4,5,6),
       c("Data","SES","Holt's","Exponential", "A-Damped","M-Damped"))
