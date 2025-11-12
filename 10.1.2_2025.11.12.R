library(dplyr)

rdata <- read.csv("totalsale.csv")
str(rdata)

rdata <- rdata %>% mutate(year=substr(rdata$ym,1,4), month=substr(rdata$ym,7,8))
str(rdata)
colSums(is.na(rdata))


data <- rdata %>% group_by(year, month) %>% summarise(sum_sales=sum(sales), .groups="drop") %>%
  arrange(desc(sum_sales))
str(data)
print(data$year[2])#"2009"
print(data$month[2])#"06"
print(data$sum_sales[2])#32100

data_year <- rdata %>% group_by(year) %>% summarise(sum_sales=sum(sales), .groups="drop") %>%
  arrange(desc(sum_sales))
data_year$year[4]


data_month <- data %>% filter(year=="2009")
print(data_month$month[4])#"04"
print(data_month$sum_sales[4])#24500

