# 앞에서 data이름으로 전처리를 마친후에 확인

# 1. 결측치 확인
table(is.na(data$birth))

# 2. birth컬럼을 이용한 age파생변수 생성

data$age <- 2021 - data$birth + 1
data

# 3. 나이에따른 월급평균표
d2 <- data %>% 
  filter(!is.na(income)) %>% 
  group_by(round(age,-1)) %>% #10대, 20대....
  summarise(mean_income = mean(income)) 

colnames(d2)[1] <- "mean_age"
ggplot(d2, aes(x = mean_age, y = mean_income, fill = mean_age)) +
  geom_col()

# ans----------------------------
data %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>%
  summarise(mean_income = mean(income)) %>% 
  ggplot(aes(x = age, y = mean_income, fill = age)) +
  geom_col()

# 연령대에 따른급여 ####
# 1. age를 이용해서 연령대 파생변수 생성
data <- data %>% 
  mutate(ageg = ifelse(age < 30, "young",
                      ifelse(age < 60, "middle", "old")))
# 2. 분석처리
d2 <- data %>% 
  filter(!is.na(income) & !is.na(ageg)) %>% 
  group_by(ageg) %>% 
  summarise(mean_income = mean(income))

# 3. 시각화
# reorder는 데이터의 정렬순서, scale_x_discrete 축 정렬순서
ggplot(d2, aes(x = ageg, y = mean_income, fill = ageg)) +
  geom_col() +
  labs(title = "연령대별 급여평균", x = "연령대", y = "급여평균") +
  scale_x_discrete(limits = c("young", "middle", "old")) #x축 순서

# 실습
# 연령대 및 성별에 따른 차이 막대그래프(그룹핑을 2개)
d3 <- data %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg, gender) %>% 
  summarise(mean_income = mean(income)) 

d3
ggplot(d3, aes(x = ageg, y = mean_income, fill = gender)) +
  geom_col(position = "dodge") +
  scale_x_discrete(limits = c("young", "middle", "old")) + #x축 순서
  labs(title = "연령대 및 성별에 따른 급여평균", x = "연령대", y = "급여평균")
  
  



