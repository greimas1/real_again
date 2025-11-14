library(dplyr)

rdata <- read.csv("P210302.csv")
str(rdata)
colSums(is.na(rdata))

df <- colSums(is.na(rdata))/nrow(rdata)
str(df)
names[which.max(df)]
names(df)

print(df)
# Age

df <- data.frame(df)
str(df)
print(df)

df_arrange <- df %>% arrange(desc(df))
rownames(df_arrange)[1]
#"Age"

