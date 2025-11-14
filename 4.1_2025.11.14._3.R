library(dplyr)
library(lubridate)
rdata <- read.csv("P220403.csv")
str(rdata)
colSums(is.na(rdata))
rdata$date_added <- mdy(rdata$date_added)
str(rdata)

data_filtered <- rdata %>% 
  filter(country=="United Kingdom", year(date_added)==2018, month(date_added)==01)
str(data_filtered)

print(nrow(data_filtered))
#30
print(data_filtered)
