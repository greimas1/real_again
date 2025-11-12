library(dplyr)
library(Metrics)
rdata <- read.csv("turnover.csv")
str(rdata)
colSums(is.na(rdata))

data <- rdata
md <- glm(turnover~., data=data, family="binomial")
summary(md)
summary(md)$coefficients

which.min(summary(md)$coefficients[-1,4])

print(round(summary(md)$coefficients["age", "Estimate"],3))
#-0.035


round(exp(summary(md)$coefficients["age", "Estimate"]), 3)
#0.966


idx <- sample(1:nrow(data), nrow(data)*0.8)
train <- data[idx, ]
test <- data[-idx, ]

md2 <- glm(turnover~., data=train, family="binomial")
pred <- predict(md2, newdata= test, type="response")
print(pred)
pred <- ifelse(pred>0.5, 1, 0)


acc <- mean(pred==test$turnover)
print(acc)

#0.8888889


