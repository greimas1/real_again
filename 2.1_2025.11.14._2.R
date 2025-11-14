library(dplyr)
rdata <- read.csv("P210202.csv")
str(rdata)

idx <- sample(1:nrow(rdata), nrow(rdata)*0.8)
data <- rdata[idx,]
str(data)

colSums(is.na(data))


a <- sd(data$total_bedrooms, na.rm=TRUE)

data$total_bedrooms <- ifelse(is.na(data$total_bedrooms), median(data$total_bedrooms, na.rm=TRUE), data$total_bedrooms)

b <- sd(data$total_bedrooms, na.rm=TRUE)

print(round(abs(a-b),2 ))#1.99


