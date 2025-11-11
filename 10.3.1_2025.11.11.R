library(dplyr)
rdata <- read.csv("turnover.csv")
str(rdata)

data <- rdata

colSums(is.na(rdata))

md <- glm(turnover~., data=data, family="binomial")
summary(md)
summary(md)$coefficients[-1,4]
which.min(summary(md)$coefficients[-1,4])

summary(md)$coefficients["age","Estimate"]
print(round(summary(md)$coefficients["age","Estimate"],3))
#-0.035

round(exp(summary(md)$coefficients["age","Estimate"]),3)
#0.966


idx <- sample(1:nrow(data), nrow(data)*0.8)
train <- data[idx,]
test <- data[-idx,]

md2 <- glm(turnover~., data=train, family="binomial")
pred2 <- predict(md2, newdata = test)
rmse(test$turnover, pred2)

round(rmse(test$turnover, pred2),3)
#1.197


pred2 <- ifelse(pred2>0.5,1,0)
acc <- mean(pred2==test$turnover)
print(round(acc,3))
# 0.556