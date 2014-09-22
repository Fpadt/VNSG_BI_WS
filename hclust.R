set.seed(1234)
par(mar = c(0, 0, 0, 0))

dfCenters <- data.frame(x = rep(1:3     , each = 4), 
                        y = rep(c(1,2,1), each = 4),
                        sd = 0.2)
x <- rnorm(12, mean = dfCenters$x, sd = dfCenters$sd) 
y <- rnorm(12, mean = dfCenters$y, sd = dfCenters$sd)

plot(x, y, col = "blue", pch = 19, cex = 2)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

dataFrame <- data.frame(x = x, y = y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
plot(hClustering)

myplclust(hClustering, 
          lab     = rep(1:4, each = 3),
          lab.col = rep(1:4, each = 3))