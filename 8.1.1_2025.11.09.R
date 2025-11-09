library(dplyr)
rdata <- read.csv("drinks.csv")
str(rdata)
colSums(is.na(rdata))
data <- rdata %>% na.omit()
str(data)

conti <- data %>% group_by(continent) %>% summarise(sum_beer=sum(beer)) %>%
  arrange(desc(sum_beer))
#str(conti)
top_conti <- conti$continent[1]
print(top_conti)
#EU

coun <- data %>% filter(continent==top_conti) %>% arrange(desc(beer))
str(coun)
coun_top <- coun$country[1]
print(coun_top)
#Czech Republic

top_beer <- coun$beer[1]
print(as.integer(top_beer))
#361



fifth_coun <- coun$country[5]
print(fifth_coun)
#Ireland

fifth_beer <- coun$beer[5]
print(fifth_beer)
#313

