#chap12_macd.R

#library(TTR)
ibm <- getYahooData("IBM", start=20120101)
macd=MACD(ibm[,'Close'])

#调整绘图参数，在1列内绘制2个图形
par(mfrow=c(2,1), mar=c(2,5,2,5)) 

plot(ibm[,'Close'], main='IBM')
plot(macd[,1], xlab='',main='MACD')

