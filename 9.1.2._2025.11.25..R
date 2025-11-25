library(dplyr)

rdata <- read.csv("arrest.csv", fileEncoding="Euc-kr")

#str(rdata)
#print(colSums(is.na(rdata)))

data <- rdata %>% mutate(arrest_rate = arrest/cases)

#str(data)

data_sort <- data %>% group_by(year=substr(ym,1,4), crime) %>%
  summarise(mean_arrest_rate=mean(arrest_rate), arrest_sum=sum(arrest), .groups="drop")

#str(data_sort)

data_sort_year <- data_sort %>% group_by(year) %>% slice_max(mean_arrest_rate, n=1) %>%
  summarise(total_sum_arrest=sum(arrest_sum))

str(data_sort_year)  
  
  


