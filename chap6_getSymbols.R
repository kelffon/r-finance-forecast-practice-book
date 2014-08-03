getSymbols("000538.SZ", from="2004-1-1")
getSymbols("600336.SS", from="2004-1-1")
getSymbols("600337.SS", from="2004-1-1")

mydata = data.frame(ynby=to.monthly(`000538.SZ`[,1])[,1], 
                    aokm=to.monthly(`600336.SS`[,1])[,1], 
                    mkju=to.monthly(`600337.SS`[,1])[,1])
colnames(mydata)=c('ynby', 'aokm', 'mkjj')
View(mydata)
pairs(mydata[,(1:3)], diag.panel=panel.hist)

####
panel.hist <- function(x, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5) )
  h <- hist(x, plot = FALSE)
  breaks <- h$breaks; nB <- length(breaks)
  y <- h$counts; y <- y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, col = "cyan", ...)
}