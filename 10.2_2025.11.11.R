library(rdata)
library(randomForest)
library(Metrics)

rdata <- read.csv("gas.csv")
str(rdata)
colSums(is.na(rdata))
data <- rdata %>% na.omit()

data <- data %>% filter(roof!=0, wall!=0, cooling!=0, heating!=0)
str(data)


md <- randomForest(gas~., data=data)
input <- data.frame(roof=185, wall=210, cooling=84, heating=0.2)
pred <- predict(md, newdata=input, type="response")
gas_pred <- round(pred,3)
print(gas_pred)
#169.331 



idx <- sample(1:nrow(data), nrow(data)*0.8)
train <- data[idx,]
test <- data[-idx,]

md2 <- randomForest(gas~., data=train)
pred2 <- predict(md2, newdata=test, type="response")
str(pred2)
rmse(test$gas, pred2)
rmse_result <- round(rmse(test$gas, pred2),3)
print(rmse_result)
#37.842
pred_df <- data.frame(pred2)

write.csv(pred_df,"gas_result2.csv", row.names=FALSE )
