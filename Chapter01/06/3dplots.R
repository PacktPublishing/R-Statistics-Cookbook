
library(plot3D)

x = rnorm(100)
y = rnorm(100)
z = x + y + rnorm(100,0,0.3)
idrow = 1:100


scatter3D(x, y, z, bty = "g", colkey = TRUE, main ="x-y-z plot",phi = 10,theta=50)
text3D(x, y, z,  labels = idrow, add = TRUE, colkey = FALSE, cex = 0.5)
