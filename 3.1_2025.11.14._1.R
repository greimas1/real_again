library(dplyr)

rdata <- read.csv("P210301.csv")
str(rdata)
colSums(is.na(rdata))

data <- rdata %>% na.omit()
colSums(is.na(data))

idx <- sample(1:nrow(data), nrow(data)*0.7)
train <- data[idx,]
str(train)

q1 <- quantile(train$housing_median_age, 0.25)
print(q1)
print(as.integer(q1))


#18




