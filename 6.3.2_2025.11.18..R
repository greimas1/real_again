rdata <- read.csv("P230606.csv")

library(dplyr)

str(rdata)
colSums(is.na(rdata))


md <- lm(Temperature~., data=rdata)
summary(md)

summary(md)$coefficients

result1 <- round(summary(md)$coefficients["O3", "Estimate"],3)
print(result1)
#0.172


t.test(rdata$Temperature, rdata$Wind)

result2 <- round(t.test(rdata$Temperature, rdata$Wind)$p.value,3)
print(result2)
# 0


input <- data.frame(O3 = 10, Solar = 90, Wind = 20)
output <- predict(md, newdata = input)

result3 <- round(output,3)
print(result3)
#68.334 



