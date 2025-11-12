library(dplyr)
library(Metrics)
library(randomForest)

rdata <- read.csv("gas.csv")
str(rdata)
colSums(is.na(rdata))

data <- rdata %>% na.omit() %>% 
  filter(roof!=0, wall!=0, cooling!=0, heating!=0)
str(data)
colSums(is.na(data))

md <- randomForest(gas~., data=data, ntree = 300)
input <- data.frame(roof=185, wall=210, cooling=84, heating=0.2)
output <- predict(md, newdata=input, type="response")
print(round(output,3))
#171.791


idx<- sample(1:nrow(data), nrow(data)*0.8)
train <- data[idx, ]
test <- data[-idx, ]

md2 <- randomForest(gas~., data=train, ntree=300)
pred <- predict(md2, newdata=test, type="response")
print(round(rmse(test$gas, pred), 3))

# 36.689


result <- data.frame(pred)
str(result)
write.csv(result, "gas_result_20251112.csv", row.names=FALSE)









