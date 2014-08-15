#chap12_TA.R

#library(quantmod)
getSymbols('YHOO') #Yahoo! OHLC data

#addTA允许将技术指标附加到已有的图标上，
#即便这个指标不在quantmod包定义亦可
chartSeries(YHOO, theme=chartTheme('white'), TA=NULL)

#将开盘和收盘的价差作为指标叠加上图
addTA(OpCl(YHOO), col='blue', type='h')


