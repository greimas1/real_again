library(dplyr)

rdata <- read.csv("turnover.csv")
str(rdata)
colSums(is.na(rdata))
data <- rdata

md <- glm(turnover~., data =data, family="binomial")
summary(md)

summary(md)$coefficients[,4]
#age

summary(md)$coefficients["age",'Estimate']
#-0.0346557 

exp(summary(md)$coefficients["age",'Estimate'])
#0.9659379


idx <- sample(1:nrow(data),nrow(data)*0.8)
train <- data[idx,]
test <- data[-idx,]

md2 <- glm(turnover~., data = train, family="binomial")
pred2 <- predict(md2, newdata = test, type="response")
str(pred2)
pred2 <- ifelse(pred2>0.5,1,0)
str(pred2)
acc <- mean(pred2 == test$turnover)
print(round(acc,3))
#0.444
str(data)
