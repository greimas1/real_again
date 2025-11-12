library(dplyr)

rdata <- read.csv("arrest.csv", fileEncoding="Euc-kr")
str(rdata)
colSums(is.na(rdata))

rdata <- rdata %>% mutate(year=substr(rdata$ym,1,4))
str(rdata)
rdata <- rdata %>% mutate(arrest_rate = arrest/cases)
str(rdata)

data <- rdata %>% group_by(year, crime) %>% 
  summarise(mean_arrest_rate = mean(arrest_rate), sum_arrest=sum(arrest), .groups="drop")


str(data)


data_filtered <- data %>% group_by(year) %>% 
  slice_max(mean_arrest_rate) %>% summarise(total_sum_arrest=sum(sum_arrest), .groups="drop")

str(data_filtered)

