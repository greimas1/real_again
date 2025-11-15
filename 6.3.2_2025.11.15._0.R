library(dplyr)

rdata <- read.csv("P230606.csv")
str(rdata)
colSums(is.na(rdata))


md <- lm(Temperature~., data=rdata)
summary(md)
result1 <- summary(md)$coefficients["O3","Estimate"]
print(round(result1,3))#0.172



t_test <- t.test(rdata$Wind, rdata$Temperature)
result2 <- t_test$p.value
print(round(result2,3))

#0


input <- data.frame(O3 = 10, Solar = 90, Wind = 20)
pred <- predict(md, newdata=input)

print(round(pred,3))

#68.334 







