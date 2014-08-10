#Hello.R
drawsine <- function(type) {
  x=1:100
  x=x/10
  y=sin(x)
  plot(x,y,type)
}

drawsine2 <- function(type, col) {
  x=1:100
  x=x/10
  y=sin(x)
  plot(x, y, type=type, col=col)
}
