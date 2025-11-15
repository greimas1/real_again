library(dplyr)
library(randomForest)
library(caret)
library(Metrics)

rdata <- read.csv("P220504-01.csv")
str(rdata)
colSums(is.na(rdata))

idx <- sample(1:nrow(rdata), nrow(rdata)*0.8)
train <- rdata[idx,]
test <- rdata[-idx,]

md <- randomForest(price~., data=train, ntree=300)
pred <- predict(md, newdata=test, type="response")
print(rmse(test$price, pred))#3021.108

rdata2 <- read.csv("P220504-02.csv")
str(rdata2)


pred2 <- predict(md, newdata=rdata2, type="response")
str(pred2)

df <- data.frame(pred=pred2)
write.csv(df, "result2025111552.csv", row.names=FALSE)

















