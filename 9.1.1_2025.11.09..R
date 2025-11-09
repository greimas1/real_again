library(dplyr)
rdata <- read.csv("loan.csv", fileEncoding="Euc-kr")
str(rdata)
colSums(is.na(rdata))

data <- rdata

data_sum <- data %>% group_by(성별) %>% 
  summarise(K은행대출합=sum(K은행대출), W은행대출합=sum(W은행대출))
str(data_sum)

loan_man <- data %>% filter(성별=="남자") %>% arrange(desc(W은행대출))
loan_woman <- data %>% filter(성별=="여자") %>% arrange(desc(W은행대출))
str(loan_man)

loan_man$대출금차이 <- abs(loan_man$K은행대출-loan_man$W은행대출)
loan_woman$대출금차이 <- abs(loan_woman$K은행대출-loan_woman$W은행대출)

str(loan_man)
str(loan_woman)

loan_man$지점코드[which.max(loan_man$대출금차이)]
#19024

loan_woman$지점코드[which.max(loan_woman$대출금차이)]
#190114