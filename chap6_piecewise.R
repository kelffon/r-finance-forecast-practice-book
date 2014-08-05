#chap6_piecewise.R
#piecewise linear 分段线性模型的预测
#运行该脚本的前提是带节点的拟合模型fit2已经求出。

#在x=50处引入一个节点

x=80:100
z <- pmax(x-50, 0)
fcast2 <- forecast(fit2, newdata=data.frame(x, z))

#绘拟合线
plot(x, fcast2$mean,col="red",xlim=c(1,110), ylim=c(20,120), type='l')
lines(ynby_df$y) #对比
abline(fit2, col='gray')
lines(fitted(fit2), col='red')

#画预测线
index=1
for(xi in x)
{
  lines(c(xi,xi), c(fcast2$lower[index,2] , fcast2$upper[index,2]), col='lightblue' );  
  index=index+1
}

index=1
for(xi in x)
{
  lines(c(xi,xi), c(fcast2$lower[index,1] , fcast2$upper[index,1]), col='blue' );  
  index=index+1
}
