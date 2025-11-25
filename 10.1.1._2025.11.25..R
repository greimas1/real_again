library(dplyr)
rdata <- read.csv("answer.csv", fileEncoding="Euc-kr")

str(rdata)
print(colSums(is.na(rdata)))

sub_rate <- rdata %>% group_by(대주제, 소주제) %>%
  summarise(정답합계=sum(정답), 응시수=n(), 정답률 = round(정답합계/응시수,3), .groups="drop")
#str(sub_rate)

topic_rate <- rdata %>% group_by(대주제) %>%
  summarise(대주제_정답률=round(mean(정답),3), .groups="drop") %>%
  arrange(desc(대주제_정답률), 대주제)
#str(topic_rate)

#arrange(대주제, desc(정답률), 소주제)

sub_sorted <- sub_rate %>% arrange(대주제, desc(정답률), 소주제)
#str(sub_sorted)

top_sub <- sub_sorted %>% group_by(대주제) %>%
  filter(정답률==max(정답률)) %>% arrange(대주제, 소주제) %>% ungroup()

top3_sub <- sub_sorted %>% group_by(대주제) %>%
  slice_max(정답률, n=3) %>% arrange(대주제, desc(정답률), 소주제) %>% ungroup()
str(top3_sub)







