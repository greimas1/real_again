library(dplyr)
rdata <- read.csv("P210203.csv")
str(rdata)
colSums(is.na(rdata))

up <- mean(rdata$charges)+1.5*sd(rdata$charges)
down <- mean(rdata$charges)-1.5*sd(rdata$charges)

data <- rdata %>% filter(charges >= up | charges <= down)
sum <- sum(data$charges)
print(as.integer(sum))
#6421430
