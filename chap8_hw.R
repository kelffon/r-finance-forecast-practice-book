#chap8_hw.R

#取数据到2014年1月
#wti_mon=to.monthly(WTI)
#wti_ts = ts(wti_mon[,1], frequency=12, start=c(2007,1))
ts1 <- window(wti_ts,start=2010,end=2014)

#带季节性的预测
fit1 <- hw(ts1,seasonal="additive", h=6)
fit2 <- hw(ts1,seasonal="multiplicative", h=6)

#直接绘制fit2和绘制wti_ts的效果基本相同；但前者可选择加上预测区间
#plot(fit2,ylab="WTI", plot.conf=FALSE, type="o", fcol="white", xlab="Year")
plot(window(wti_ts,start=2010), type='o', ylab='WTI')

lines(fitted(fit1), col="red", lty=2)
lines(fitted(fit2), col="blue", lty=3)
lines(fit1$mean, type="o", col="red", lwd=2, pch=2)
lines(fit2$mean, type="o", col="blue", lwd=2, pch=3)
legend("topright",lty=c(1,2,3), pch=c(1,2,3), col=c('black','red','blue'), 
       c("Data","Holt Winters' Additive","Holt Winters' Multiplicative"))

