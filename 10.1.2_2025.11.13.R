library(dplyr)
rdata <- read.csv("totalsale.csv")
str(rdata)
colSums(is.na(rdata))

rdata <- rdata %>% mutate(year=substr(rdata$ym,1,4), month=substr(rdata$ym,7,8))
str(rdata)

data <- rdata %>% group_by(year, month) %>% summarise(sum_sales=sum(sales), .groups="drop") %>%
  arrange(desc(sum_sales))
str(data)

data2 <- data %>% slice(2)
print(data2$year)#"2009"
print(data2$month)# "06"
print(data2$sum_sales)#32100

data4 <- data %>% slice(4)
print(data4$year)#"2008"
print(data4$month)# "03"
print(data4$sum_sales)#29500
