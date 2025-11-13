library(dplyr)
rdata <- read.csv("loan.csv", fileEncoding="Euc-kr")
str(rdata)
colSums(is.na(rdata))

data <- rdata %>% group_by(성별) %>% summarise(K은행대출합=sum(K은행대출), W은행대출합=sum(W은행대출))
data_m <- data %>% filter(성별=="남자")
data_w <- data %>% filter(성별=="여자")
print(data_m$K은행대출합)#3864
print(data_m$W은행대출합)#124350
print(data_w$K은행대출합)#535.2
print(data_w$W은행대출합)#16500

loan_man <- rdata %>% filter(성별=="남자") %>% arrange(desc(W은행대출))
loan_woman <- rdata %>% filter(성별 == "여자") %>% arrange(desc(K은행대출))

loan_man$대출금차이 <- abs(loan_man$W은행대출 - loan_man$K은행대출)
loan_woman$대출금차이 <- abs(loan_woman$W은행대출 - loan_woman$K은행대출)



loan_man$지점코드[which.max(loan_man$대출금차이)] #190124
loan_woman$지점코드[which.max(loan_woman$대출금차이)]  #190114


