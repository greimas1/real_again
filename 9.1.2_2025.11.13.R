library(dplyr)
rdata <- read.csv("arrest.csv", fileEncoding="Euc-kr")
str(rdata)
colSums(is.na(rdata))

rdata$arrest_rate <- rdata$arrest/rdata$cases
str(rdata)


data <- rdata %>% group_by(year=substr(rdata$ym,1,4), crime) %>%
  summarise(mean_arrest_rate=mean(arrest_rate), sum_arrest = sum(arrest), .groups="drop")

str(data)

data_filtered <- data %>% group_by(year) %>%
  slice_max(mean_arrest_rate) %>% summarise(total_sum_arrest = sum(sum_arrest))
str(data_filtered)
print(data_filtered$total_sum_arrest)
#50
> 
  
data_filtered2 <- data %>% group_by(year) %>%
  slice_max(mean_arrest_rate) %>% summarise(total_sum_arrest = sum(sum_arrest))