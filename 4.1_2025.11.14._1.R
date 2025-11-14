library(dplyr)
rdata <- read.csv("P220401.csv")
str(rdata)
colSums(is.na(rdata))

qy1 <- quantile(rdata$y, 0.25)
qy3 <- quantile(rdata$y, 0.75)

print(as.integer(qy1))#40
print(as.integer(qy3))#77



result <- qy3 - qy1
print(as.integer(result))
# 36







