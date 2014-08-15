#chap12_backtesting.R

#library(quantmod)
getSymbols('^GSPC') #S&P500 OHLC data
dvi = DVI(Cl(GSPC))

#创建信号量
sig = ifelse(dvi$dvi<0.5, 1, -1)
sig = Lag(sig) #将该序列向“过去”延迟一天

#计算收益
ret = ROC(Cl(GSPC)) * sig
#去掉其中的NA观测点
ret = ret[253:1918]

#library(PerformanceAnalytics)
table.Drawdowns(ret, top=10)
table.DownsideRisk(ret)

charts.PerformanceSummary(ret)

