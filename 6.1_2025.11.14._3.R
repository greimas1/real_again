library(dplyr)
rdata <- read.csv("P230603.csv")
str(rdata)

data<- rdata %>% mutate(year=substr(rdata$년월,1,4), month = substr(rdata$년월,6,7))
str(data)

data <- data %>% mutate(crime=강력범 + 절도범 + 폭력범 + 지능범 + 풍속범 + 기타형사범)

data_filtered <- data %>% 
  group_by(year, month) %>% summarise(mean_crime=mean(crime), .groups="drop") %>% arrange(desc(mean_crime))
print(data_filtered)
data_filtered$year[1]#"2011"

data_filter <- data %>% filter(year=="2011") %>% group_by(month) %>% summarise(month_crime=mean(crime)) %>%
  arrange(desc(month_crime))
print(data_filter$month_crime[1])
#1] 22350