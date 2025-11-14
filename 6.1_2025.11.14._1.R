library(dplyr)
library(lubridate)
rdata <- read.csv("P230601.csv")
str(rdata)

rdata$신고일시 <- ymd_hm(rdata$신고일시)
rdata$출동일시 <- ymd_hm(rdata$출동일시)

str(rdata)

rdata$출동시간 <- difftime(rdata$출동일시, rdata$신고일시, units="secs")
str(rdata)

data <- rdata %>% group_by(year=year(신고일시), month=month(신고일시)) %>% 
  summarise(평균출동시간=mean(출동시간), .groups="drop") %>% arrange(desc(평균출동시간))
str(data)
print(round(data$평균출동시간[1]/60))


data$평균출동시간[1]/60