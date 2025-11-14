library(dplyr)
rdata <- read.csv("P210303.csv")
str(rdata)
colSums(is.na(rdata))

data <- rdata %>% select("country", "year", "new_sp")
str(data)
colSums(is.na(data))

data <- data %>% na.omit()
str(data)
colSums(is.na(data))


str(data)

data_country <- data %>% filter (year == 2000) %>%
  group_by(country) %>% summarise(mean_sp = mean(new_sp))
str(data_country)

data_2000 <- data %>% filter (year==2000)
newsp2000 <- mean(data_2000$new_sp)

data_2000_country <- data_2000 %>% group_by(country) %>% filter(new_sp > newsp2000)
print(data_2000_country)
print(round(nrow(data_2000_country),2))
#38

