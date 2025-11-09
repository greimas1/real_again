library(dplyr)
library(Metrics)
library(randomForest)
#install.packages("Metrics")

rdata <- read.csv("gas.csv")
str(rdata)
colSums(is.na(rdata))
data <- rdata %>% na.omit()
data <- data %>% filter(roof!=0, wall!=0, cooling!=0, heating!=0)
str(data)

idx <- sample(1:nrow(data), nrow(data)*0.8)
train <- data[idx,]
test <- data[-idx,]
 
md <- randomForest(gas~., data=train, ntree=300)
input <- data.frame(roof = 185, wall = 210, cooling = 84, heating = 0.2)
pred <- predict(md, newdata=input, type="response")

print(round(pred,3))
#175.012

pred <- predict(md, newdata = test, type="response")
rmse <- rmse(test$gas, pred)
print(round(rmse,3))
#37.642

str(pred)
df <- as.data.frame(pred)
str(df)


write.csv(df, "gas_result.csv", row.names=FALSE)
