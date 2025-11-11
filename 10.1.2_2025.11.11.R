library(dplyr)
rdata <- read.csv("totalsale.csv")
str(rdata)
colSums(is.na(rdata))
data <- rdata %>% mutate(year=substr(rdata$ym,1,4), month=substr(rdata$ym, 7,8))
str(data)

data_year_month <- data %>% group_by(year, month) %>% summarise(sum_sales=sum(sales)) %>%
  arrange(desc(sum_sales))  #.groups = "drop"
str(data_year_month)

print(data_year_month$year[2])
#2009
print(data_year_month$month[2])
#06
print(data_year_month$sum_sales[2])
#32100


data_month <- data_year_month %>% filter(year=="2008") %>% arrange(desc(sum_sales))

print()


print(data_month$month[4])
#02
print(data_month$sum_sales[4])




