#chap7_MAs.R
#移动平均
#设云南白药的月线数据ynby_mon已经获取

plot(as.double(ynby_mon[,1]))
lines(ma(as.double(ynby_mon[,1]), 5), col='red')
lines(ma(as.double(ynby_mon[,1]), 10), col='blue')
lines(ma(as.double(ynby_mon[,1]), 24), col='grey')
legend(1, 110, legend=c('MA5', 'MA10', 'MA24'), col=c('red', 'blue', 'grey'), lty = c(1, 1, 1))





