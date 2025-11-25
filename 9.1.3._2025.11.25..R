library(dplyr)

rdata <- read.csv("years.csv")

str(rdata)
print(colSums(is.na(rdata)))

rdata$satisfy <- ifelse(is.na(rdata$satisfy), mean(rdata$satisfy, na.rm=TRUE), rdata$satisfy)

data <- rdata %>% group_by(dept, grade) %>% 
  mutate(mean_year=mean(year, na.rm=TRUE))

#data$year <- ifelse(is.na(data$year), mean_year, data$year)
data$year <- ifelse(is.na(data$year), mean_year, year)
