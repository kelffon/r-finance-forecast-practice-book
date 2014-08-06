#chap6_spline.R
#cubic spline 分段立方模型的预测
#

#在x=50处引入一个节点
z <- pmax(ynby_df$x-50, 0)
#拟合
fit3 <- lm(y ~ x + I(x^2) + I(x^3) + I(z^3), data=ynby_df)
plot(ynby_df$y)
lines(fitted(fit3))

#多加几个节点,重新拟合
z2 <- pmax(ynby_df$x-20, 0)
z3 <- pmax(ynby_df$x-40, 0)
z4 <- pmax(ynby_df$x-60, 0)
z5 <- pmax(ynby_df$x-80, 0)
fit3 <- lm(y ~ x + I(x^2) + I(x^3) + I(z^3) + I(z2^3) + I(z3^3) + I(z4^3) + I(z5^3), data=ynby_df)
plot(ynby_df$y)
lines(fitted(fit3))




