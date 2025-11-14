library(dplyr)
rdata <- read.csv("P210201.csv")

str(rdata)
colSums(is.na(rdata))

data <- rdata %>% arrange(desc(crim))
tenth <- data$crim[10]
data$crim <- ifelse(data$crim>=tenth, tenth, data$crim)
str(data)

data_filter <- data %>% filter(age>=80)
print(round(mean(data_filter$crim),2))
#5.76