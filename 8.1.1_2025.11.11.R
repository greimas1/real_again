library(dplyr)
rdata <- read.csv("drinks.csv")
str(rdata)
colSums(is.na(rdata))
data <- rdata %>% na.omit()
colSums(is.na(data))
str(data)

data_cont <- data %>% group_by(continent) %>% summarise(beer_sum=sum(beer), .groups="drop") %>%
  arrange(desc(beer_sum))
top_cont <- data_cont$continent[1]
print(top_cont)
"EU"


data_country <- data %>% filter(continent==top_cont) %>% arrange(desc(beer))
print(data_country$country[1])#"Czech Republic"
print(data_country$beer[1])# 361

print(data_country$country[5])# "Ireland"
print(data_country$beer[5])# 313



print(data_cont$continent)


data_cont1 <- data %>% group_by(continent, country) %>% summarise(beer_sum=sum(beer))
print(data_cont1)
