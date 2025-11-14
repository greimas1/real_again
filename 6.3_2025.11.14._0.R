library(dplyr)
rdata <- read.csv("P230605.csv", fileEncoding="Euc-kr")

str(rdata)
colSums(is.na(rdata))

total <- nrow(rdata)
data <- rdata %>% group_by(코드) %>% summarise(건수=n(), 확률=건수/total)
print(round(data$확률[4],3))
#0.787


chisq.test(data$건수, p=c(0.05, 0.1, 0.05, 0.8))
print(round(chisq.test$statistic,3))
#0.997 


print(round(chisq.test$p.value,3))
#0.802



