library(dplyr)

rdata <- read.csv("drinks.csv")
str(rdata)
colSums(is.na(rdata))

data <- rdata %>% na.omit()
str(data)
colSums(is.na(data))


data_conti <- data %>% group_by(continent) %>% summarise(beer_sum=sum(beer)) %>% arrange(desc(beer_sum))
str(data_conti)
top_continent <- data_conti$continent[1]
print(top_continent)
#"EU"


data_country <- data %>% filter(continent==top_continent) %>% arrange(desc(beer))
str(data_country)
print(data_country$country[1])#"Czech Republic"
print(data_country$beer[1])#361

print(data_country$country[5])#"Ireland"
print(data_country$beer[5])#313
> 
