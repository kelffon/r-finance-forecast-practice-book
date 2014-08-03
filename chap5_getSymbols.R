getSymbols("000538.SZ", from="2004-1-1")
getSymbols("600336.SS", from="2004-1-1")
getSymbols("600337.SS", from="2004-1-1")

mydata = data.frame(ynby=to.monthly(`000538.SZ`[,1])[,1], 
                    aokm=to.monthly(`600336.SS`[,1])[,1], 
                    mkju=to.monthly(`600337.SS`[,1])[,1])
colnames(mydata)=c('ynby', 'aokm', 'mkjj')
View(mydata)
