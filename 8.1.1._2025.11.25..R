library(dplyr)
rdata <- read.csv("drinks.csv")

#str(rdata)
#print(colSums(is.na(rdata)))

data <- rdata %>% na.omit()

#str(data)
#print(colSums(is.na(data)))

data_conti <- data %>% group_by(continent) %>% summarise(beer_sum=sum(beer)) %>% arrange(desc(beer_sum))
print(data_conti$continent[1])
#EU


data_sort <- data %>% filter(continent=="EU") %>% arrange(desc(beer))
print(data_sort$country[2])#"Germany"
print(data_sort$beer[2])# 346

print(data_sort$country[5])#Ireland"
print(data_sort$beer[5])#1] 313


