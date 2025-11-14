library(dplyr)
rdata <- read.csv("P230602.csv")
str(rdata)
colSums(is.na(rdata))

data <- rdata %>% 
  mutate(stu=student_1 + student_2 + student_3 +student_4 + student_5 + student_6)
data <- data %>% mutate(teach_stu = stu/teacher)

print(data$school_name[which.max(data$teach_stu)])# "대구삼육초등학교"
print(data$stu[which.max(data$teach_stu)])#219
print(data$teacher[which.max(data$teach_stu)])# 6
