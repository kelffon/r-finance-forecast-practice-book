#chap8_ses.R
#简单指数平滑：不同系数的对比

#构造时间序列ts数据对象
wti_ts = ts(wti_mon[,1], frequency=12, start=c(2006,1))

#3种不同系数的指数平滑；第3种自动选择参数
fit1 <- ses(wti_ts, alpha=0.2, initial="simple", h=6)
fit2 <- ses(wti_ts, alpha=0.6, initial="simple", h=6)
fit3 <- ses(wti_ts, h=6)

#图形绘制
plot(fit1, plot.conf=FALSE, ylab="WTI", xlab="Year",
     main="Simple Exponential Smoothing", fcol="white", type="l", cex=0.5)
lines(fitted(fit1), col="blue", type="p",pch=2, cex=0.5)
lines(fitted(fit2), col="red", type="p", pch=4, cex=0.5)
lines(fitted(fit3), col="black", type="p", pch=5, cex=0.5)


#预测图线
lines(fit1$mean, col="blue", type="p",pch=2, cex=0.5)
lines(fit2$mean, col="red", type="p",pch=4, cex=0.8)
lines(fit3$mean, col="black", type="l",lwd=2)

#图例
legend("topright",lty=c(1,-1,-1,-1), col=c(1,"blue","red","black"), 
       c("data", expression(alpha == 0.2), expression(alpha == 0.6),
         expression(alpha == 0.99)),pch=c(-1,2,4,5), cex=1)

