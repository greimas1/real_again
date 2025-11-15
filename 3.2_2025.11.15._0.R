library(dplyr)
library(randomForest)
library(caret)

rdata <- read.csv("P210304-01.csv")
str(rdata)
colSums(is.na(rdata))

rdata$TravelInsurance <- as.factor(rdata$TravelInsurance)

idx <- sample(1:nrow(rdata), nrow(rdata)*0.8)
train <- rdata[idx,-1]
test <- rdata[-idx,-1]


md <- randomForest(TravelInsurance~., data=train, ntree=300)
pred <- predict(md, newdata = test, type="response")
cm <- confusionMatrix(pred, test$TravelInsurance, mode = "everything")
print(cm)


rdata2 <- read.csv("P210304-02.csv")
str(rdata2)
colSums(is.na(rdata2))


y_pred <- predict(md, newdata=rdata2[,-1], type="prob")
str(y_pred)

df <- data.frame(ID=rdata2[,1], y_pred=y_pred[,2])
str(df)


write.csv(df, "result20251115.csv", row.names=FALSE)














