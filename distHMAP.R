nba <- read.csv("http://datasets.flowingdata.com/ppg2008.csv")

dst <- dist(nba[1:20, -1],)
dst <- data.matrix(dst)

dim <- ncol(dst)

image(1:dim, 1:dim, dst, axes = FALSE, xlab="", ylab="")

axis(1, 1:dim, nba[1:20,1], cex.axis = 0.5, las=3)
axis(2, 1:dim, nba[1:20,1], cex.axis = 0.5, las=1)

text(expand.grid(1:dim, 1:dim), sprintf("%0.1f", dst), cex=0.6)
