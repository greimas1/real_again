library(dplyr)
rdata <- read.csv("drinks.csv")
str(rdata)

data <- rdata %>% group_by(continent) %>% summarise(beer_sum=sum(beer)) %>%
  arrange(desc(beer_sum))
print(data$continent[1])
top_continent <- data$continent[1]
#EU

data_country <- rdata %>% filter(continent==top_continent) %>% arrange(desc(beer))
print(data_country$country[1])#"Czech Republic"
print(data_country$beer[1])#361

print(data_country$country[5])#"Ireland"
print(data_country$beer[5])# 313
