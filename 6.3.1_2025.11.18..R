rdata <- read.csv("P230605.csv", fileEncoding="Euc-kr")
library(dplyr)

str(rdata)
colSums(is.na(rdata))

ntot <- nrow(rdata)
data <- rdata %>% group_by(코드) %>% summarise(건수=n(), 확률=건수/ntot)

str(data)
colSums(is.na(data))


result1 <- round(data$확률[4],3)
print(result1)
# 0.787



chisq.test(data$건수, p=c(0.05, 0.1, 0.05, 0.8))

chisq.test(data$건수, p=c(0.05, 0.1, 0.05, 0.8))$statistic

result2 <- round(chisq.test(data$건수, p=c(0.05, 0.1, 0.05, 0.8))$statistic,3)
print(result2)

# 0.997 



chisq.test(data$건수, p=c(0.05, 0.1, 0.05, 0.8))$p.value

result3 <- round(chisq.test(data$건수, p=c(0.05, 0.1, 0.05, 0.8))$p.value,3)
print(result3)


#0.802
