library(dplyr)
rdata <- read.csv("energy.csv")
str(rdata)
colSums(is.na(rdata))

data <- rdata


md <- lm(totalenergy~., data=data)
summary(md)

print(round(sum(summary(md)$coefficients[-1,1]),3))
#2

md2 <- lm(totalenergy~cooling + heating, data=data)
print(round(summary(md2)$r.squared,3))
#1


input <- data.frame(size=185 , heating=3 , glazing=70 , exteriorwall=163 , roof= 0.22, wall=0.6 , cooling=25 , heating= 0.003)

pred <- predict(md2, newdata = input, type="response")

print(round(pred,3))
#28






