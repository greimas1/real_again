library(dplyr)
rdata <- read.csv("P220402.csv")
str(rdata)
colSums(is.na(rdata))

data <- rdata %>% mutate(num_pos = num_loves + num_wows)
data <- data %>% mutate(pos_ratio = num_pos / num_reactions)

data_filtered <- data %>% filter(pos_ratio>0.4 & pos_ratio <0.5)
print(nrow(data_filtered))
#90

