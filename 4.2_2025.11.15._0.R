library(dplyr)
library(randomForest)
library(caret)


rdata <- read.csv("P220404-01.csv")
str(rdata)
colSums(is.na(rdata))

rdata$Segmentation <- as.factor(rdata$Segmentation)

idx <- sample(1:nrow(rdata), nrow(rdata)*0.8)
train <- rdata[idx,-1]
test <- rdata[-idx,-1]

md <- randomForest(Segmentation~., data=train, ntree=300)
pred <- predict(md, newdata=test, type="response")
cm <- confusionMatrix(pred, test$Segmentation, mode="everything")
print(cm)


rdata2 <- read.csv("P220404-02.csv")
str(rdata2)
colSums(is.na(rdata2))


pred2 <- predict(md, newdata=rdata2[,-1], type="response")
str(pred2)
df <- data.frame(ID=rdata2[,1], pred=pred2)
str(df)

write.csv(df, "result20251115_42.csv", row.names=FALSE)






















