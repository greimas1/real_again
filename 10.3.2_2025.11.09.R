library(dplyr)
rdata <- read.csv("energy.csv")

str(rdata)
colSums(is.na(rdata))

data <- rdata

md <- lm(totalenergy~., data = data)
summary(md)

summary(md)$coefficients[-1,1]
sum_coef <- sum(summary(md)$coefficients[-1,1])

print(round(sum_coef,3))
2

names(which(summary(md)$coefficients[-1,4]<0.05))

md2 <- lm(totalenergy~cooling + heating, data = data)
summary(md2)
summary(md2)$r.squared
print(round(summary(md2)$r.squared,3))
#1


input <- data.frmae(size=185, height=3, glazing = 70, exteriorwall = 163, roof = 0.22, wall = 0.6, cooling = 25, heating = 0.003)

pred <- predict(md2, input, type="response")
print(round(pred,3))
84.2