library(dplyr)
rdata <- read.csv("P220503.csv", fileEncoding="Euc-kr")

str(rdata)
colSums(is.na(rdata))


data <- rdata %>% mutate(순전입학생수 = 전입학생수.계. - 전출학생수.계. )
str(data)

data_arr <- data %>% arrange(desc(순전입학생수))

print(data$전체학생수.계.[which.max(data$순전입학생수)])
#956

