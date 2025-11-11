library(dplyr)
rdata <- read.csv("loan.csv", fileEncoding="Euc-kr")

str(rdata)
colSums(is.na(rdata))

data <- rdata %>% group_by(성별) %>% 
  summarise(K은행대출합=sum(K은행대출), W은행대출합=sum(W은행대출), .groups="drop")
print(data)
#남자        3864       124350
#여자         535.       16500

#성별  K은행대출합 W은행대출합
#<chr>       <dbl>       <int>
 # 1 남자        3864       124350
#2 여자         535.       16500

loan_man <- rdata %>% filter(성별=="남자") %>% arrange(desc(W은행대출))
loan_woman <- rdata %>% filter(성별=="여자") %>% arrange(desc(W은행대출))

loan_man$대출금차이 <- abs(loan_man$W은행대출 - loan_man$K은행대출)
loan_woman$대출금차이 <- abs(loan_woman$W은행대출 - loan_woman$K은행대출)

print(loan_man$지점코드[which.max(loan_man$대출금차이)])
#190124
print(loan_woman$지점코드[which.max(loan_woman$대출금차이)])
#190114