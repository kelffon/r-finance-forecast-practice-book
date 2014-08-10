ynby_ts = ts(as.double(ynby_mon[,1]), start=c(2007,1), frequency=12)
fit <- stl(ynby_ts, t.window=13, s.window='periodic', robust=TRUE)

ynby_adj <- seasadj(fit)
plot(naive(ynby_adj), main="Naive forecasts of seasonally adjusted data")

fcast <- forecast(fit, method="naive")
plot(fcast)
