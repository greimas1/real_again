library(dplyr)
library(Metrics)
rdata <- read.csv("airquality.csv")
str(rdata)
colSums(is.na(rdata))

data <- rdata[complete.cases(rdata),]
str(data)

md <- lm(Temp~., data=data)
summary(md)
#print(sum(summary(md)$coefficients[-1,4]))
print(sum(summary(md)$coefficients[-1,4]<0.05))
#Ozone, Wind

md2 <- lm(Temp~Ozone + Wind, data=data)
corr <- cor(data$Temp, data$Ozone, method="pearson")
print(round(corr,3))
# 0.699

idx <- sample(1:nrow(data), nrow(data)*0.8)
train <- data[idx,]
test <- data[-idx,]
md3 <- lm(Temp~Ozone + Wind, data=train)
pred3 <- predict(md3, newdata=test, type="response")
rmse(test$Temp, pred3)#7.155162
> 
result3 <- (mean((test$Temp-pred3)^2))^(1/2)
print(round(result3,3))
