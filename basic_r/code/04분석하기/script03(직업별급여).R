# job_code는 직업번호로 구분이 되어 있습니다.
# readxl패키지를 사용해서 excel을 읽어옵니다. sheet = 2번
library(readxl)

# 1. 전처리
# left_join(기준데이터, 조인데이터, by = 키)
job_list <- read_excel("data/Koweps_Codebook.xlsx", sheet = 2)
job_list

data <- left_join(data, job_list, by = c("job_code"="code_job")) #키가다른경우
data

# 2. 분석하기
# income and job이 NA가 아닌 데이터를 가지고 처리
d4 <- data %>% 
  filter(!is.na(income) & !is.na(job)) %>% 
  group_by(job) %>% 
  summarise(mean_income = mean(income)) %>% 
  arrange(desc(mean_income)) %>% 
  head(10)

ggplot(d4, aes(x = reorder(job, mean_income), y = mean_income, fill = job)) +
  geom_col() +
  coord_flip() + # 회전
  labs(title = "직업별 급여", x = "직업", y = "급여평균")

View(job_list)
data