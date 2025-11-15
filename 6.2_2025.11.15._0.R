library(dplyr)
library(caret)
library(randomForest)

rdata <- read.csv("P230604-01.csv")
str(rdata)


rdata$blue <- as.factor(rdata$blue)
rdata$dual_sim <- as.factor(rdata$dual_sim )
rdata$four_g <- as.factor(rdata$four_g)
rdata$three_g <- as.factor(rdata$three_g)
rdata$touch_screen <- as.factor(rdata$touch_screen)
rdata$wifi <- as.factor(rdata$wifi)
rdata$n_cores <- as.factor(rdata$n_cores)
rdata$price_range <- as.factor(rdata$price_range)


colSums(is.na(rdata))


idx <- sample(1:nrow(rdata), nrow(rdata)*0.8)
train <- rdata[idx,]
test <- rdata[-idx,]

md <- randomForest(price_range~., data=train, ntree=300)
pred <- predict(md, newdata=test, type="response")
cm <- confusionMatrix(pred, test$price_range, mode="everything")
print(cm)



rdata2 <- read.csv("P230604-02.csv")
str(rdata2)
colSums(is.na(rdata2))

rdata2$blue <- as.factor(rdata2$blue)
rdata2$dual_sim <- as.factor(rdata2$dual_sim )
rdata2$four_g <- as.factor(rdata2$four_g)
rdata2$three_g <- as.factor(rdata2$three_g)
rdata2$touch_screen <- as.factor(rdata2$touch_screen)
rdata2$wifi <- as.factor(rdata2$wifi)
rdata2$n_cores <- as.factor(rdata2$n_cores)





pred2 <- predict(md, newdata=rdata2, type="response")

df <- data.frame(pred=pred2)

write.csv(df, "result2025111552.csv", row.names=FALSE)



















