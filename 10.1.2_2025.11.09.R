library(dplyr)
library(lubridate)
rdata <- read.csv("totalsale.csv")
str(rdata)
colSums(is.na(rdata))

rdata$year <- substr(rdata$ym,1,4)
#str(rdata)
rdata$month <- substr(rdata$ym,7,8)
str(rdata)
#rdata$month
#rdata$year - as.date(rdata$year)

monthly_sale <- rdata %>% group_by(year, month) %>% 
  summarise(sale_sum=sum(sales)) %>% ungroup()
str(monthly_sale)

monthly_sorted <- monthly_sale %>% arrange(desc(sale_sum))
str(monthly_sorted)

print(monthly_sorted$year[2]) #2009
print(monthly_sorted$month[2]) #06월
print(monthly_sorted$sale_sum[2]) #32100

print(monthly_sorted$year[4]) #2008
print(monthly_sorted$month[4]) #03월

output <- monthly_sorted %>% filter(year=="2008") %>% arrange(desc(sale_sum))
str(output)
print(output$month[1]) #04
print(output$sale_sum[1]) #38700
