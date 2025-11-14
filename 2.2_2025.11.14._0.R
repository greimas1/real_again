library(dplyr)
library(caret)
library(randomForest)
rdata <- read.csv("P210204-01.csv")
str(rdata)
colSums(is.na(rdata))

data <- rdata
data$Reached.on.Time_Y.N <- as.factor(data$Reached.on.Time_Y.N)

idx <- sample(1:nrow(data), nrow(data)*0.8)
train <- data[idx,-1]
test <- data[-idx,-1]

md <- randomForest(Reached.on.Time_Y.N ~., data=train, ntree = 300)
pred <- predict(md, newdata = test, type="response")
cm <- confusionMatrix(pred, test$Reached.on.Time_Y.N, mode = "everything")
print(cm)

rdata2 <- read.csv("P210204-02.csv")
str(rdata2)

y_pred <- predict(md, newdata=rdata2[,-1], type="prob")
str(y_pred)
typeof(y_pred)
print(y_pred)

y_pred <- data.frame(y_pred[,2])
str(y_pred)
write.csv(y_pred, "result.csv", row.names=FALSE)
