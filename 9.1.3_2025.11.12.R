library(dplyr)

rdata <- read.csv("years.csv")
str(rdata)
colSums(is.na(rdata))

rdata$satisfy <- ifelse(is.na(rdata$satisfy), mean(rdata$satisfy, na.rm=TRUE), rdata$satisfy)

rdata_filter <- rdata %>% group_by(dept, grade) %>% 
  summarise(mean_year=mean(year, na.rm=TRUE), .groups="drop")

str(rdata_filter)
str(rdata)
is.na(rdata$year)
rdata$year
print(rdata)

rdata_filter_sales <- rdata_filter %>% filter(dept=="sales", grade=="B")
print(rdata_filter_sales)
rdata_filter_sales$mean_year

rdata_filter_Exec-managerial <- rdata_filter %>% filter(dept=="Exec-managerial", grade=="C")
rdata_filter_Exec-managerial$mean_year


