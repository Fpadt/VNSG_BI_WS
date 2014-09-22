library(data.table)
library(ggplot2)

load("H:/CW/GV/45. RFnR/10. RawData/VE/TD/dtVE_adQ.Rdata")
setnames(dtVE_adQ, "V1", "Q")

DT <-   dtVE_adQ[ ,sum(Q), by = list(ART, month(DATE))]
setnames(DT, "V1", "Q")

DT1 <- as.data.frame(DT[, ])
DT1 <- DT1[order(DT1$ART, DT1$month),]

# DT1$ART <- as.factor(DT1$ART)
GG <- ggplot(data= DT1, aes(x = month, y = Q, group = ART, label = ART)) + 
  geom_line(aes(color = ART), alpha = 0.1) + scale_x_discrete(1:12) +
  xlab("Month") + ylab("Quantity") # + geom_text()
GG

DT2 <- reshape(data = DT1, idvar = "ART", timevar = "month", 
               direction = "wide")
names(DT2) <- gsub("Q.", "", names(DT2))
DT2[is.na(DT2)] <- 0
DT2 <- DT2[, c("ART", 1:12)]
View(DT2[, ])
row.names(DT2) <- as.numeric(as.character(DT2$ART))
DT3 <- as.matrix(DT2[, -1])
 
View(DT3)
heatmap(DT3)

dst <- dist(DT2[, -1],)
dst <- data.matrix(dst)

dim <- ncol(dst)

image(1:dim, 1:dim, dst, axes = FALSE, xlab="", ylab="")

axis(1, 1:dim, DT2[,1], cex.axis = 0.5, las=3)
axis(2, 1:dim, DT2[,1], cex.axis = 0.5, las=1)

text(expand.grid(1:dim, 1:dim), sprintf("%0.1f", dst), cex=0.6)
