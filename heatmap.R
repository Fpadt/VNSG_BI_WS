set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12), ]
heatmap(dataMatrix)



#####
x <- matrix(c(1, 1, 3, 3, 5, 7), 3, 2, byrow = TRUE)

plot(x[,1], x[,2], pch = 19, cex = 2, type = "p", col = "red")
lines(x[,1], x[,2], pch = 19, lwd = 2)
text(1.5, 1.5, round(dist(x), digits = 3), 
     srt = 45, offset = 0.5, pos = 3)
