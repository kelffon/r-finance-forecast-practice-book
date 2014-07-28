#simple_forecasts_accuracy.R
#取出云南白药的第一列：开盘价,转换成为月数据
ynby_mon = to.monthly(`000538.SZ`[,1])

# 将月数据第一列转换成季节型ts数据：
ynby_season = ts(ynby_mon[,1], frequency=12, start=c(2007,1))

training = window(ynby_season, end=c(2013,12));
testing = window(ynby_season, start=c(2014,1))

#预测
y1=meanf(training, h=12)
y2=naive(training, h=12)
y3=snaive(training, h=12)
y4=rwf(training, h=12, drift=TRUE)
#绘图
plot(y1, plot.conf=FALSE,
     main="Comparison of several simples forecast methods")
lines(ynby_season)
lines(y2$mean, col=2)
lines(y3$mean, col=3)
lines(y4$mean, col=6)

#图例
legend("topleft",lty=1,col=c(1,2,3,6),
       legend=c("Mean method","Naive method","Seasonal naive method","Drift method"))

#预测准确度量值计算
accuracy(y1, testing)
accuracy(y2, testing)
accuracy(y3, testing)
accuracy(y4, testing)
