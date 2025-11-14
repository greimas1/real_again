library(dplyr)
rdata <- read.csv("P220502.csv")
str(rdata)
data <- rdata %>% mutate(bmi = Weight/(Height/100)^2)
str(data)

normal <- data %>% filter(bmi>=18.5 & bmi<23)
danger <- data %>% filter(bmi>=23 & bmi <25)

print(round(abs(nrow(danger)-nrow(normal))))
#28

