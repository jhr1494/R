'''
코딩북에서 확인
이혼변수(marriage)
0. 비해당(18세미만)
1. 유배우   2.사별    3.이혼    4.별거
5.미혼(18세이산, 미혼모 포함)   6.기타(사망 등..)

종교변수(religion)
1. 있음   2.없음

연령대(ageg)
'''
head(data)

table(data$marrige) #결혼 변수 빈도
table(data$religion) #종교 변수 빈도

# 1. 결혼유무에 따른 파생변수
data$marrige_yn <- ifelse(data$marrige == 1, "marriage", 
                       ifelse(data$marrige == 3, "divorce", NA)) 

# 2. 종교유무에 따른 파생변수
data$religion_yn <- ifelse(data$religion == 1, "yes", "no")

table(data$marrige_yn)
table(data$religion_yn)

# 3. marriage_yn과 religion_yn 토탈과 퍼센트
# 그룹별 빈도수 -> 합계 -> 퍼센트
religion_marriage <- data %>% 
  filter(!is.na(marrige_yn) & !is.na(religion_yn)) %>% 
  group_by(religion_yn, marrige_yn) %>% 
  summarise(total = n()) %>% 
  mutate(total_group = sum(total)) %>% 
  mutate(pct = (total/total_group)*100 )

# 4. 위의 표에서 이혼율 추출
religion_divorce_pct <- religion_marriage %>% 
  filter(marrige_yn == "divorce")

ggplot(religion_divorce_pct, aes(x = religion_yn, y = pct, fill = religion_yn)) +
  geom_col()

# ==========================
# 연령대별 종교유무에 따른 이혼율
# 그룹핑 -> 연령대, 종교유무, 결혼유무(이혼율)
table(is.na(data$marrige_yn))
table(is.na(data$religion_yn))

ageg_religion_divorce <- data %>% 
  filter(ageg != "young") #young데이터는 이혼유무가 없으므로 제외
  filter(!is.na(marrige_yn)) %>% 
  group_by(ageg, religion_yn, marrige_yn) %>% 
  summarise(total = n()) %>% 
  mutate(total_group = sum(total)) %>% 
  mutate(pct = (total / total_group)*100)

ageg_religion_divorce

# 위 표에서 이혼별 퍼센트 추출
ageg_religion_divorce_pct <- ageg_religion_divorce %>% 
  filter(marrige_yn == "divorce")

ageg_religion_divorce_pct

ggplot(ageg_religion_divorce_pct, aes(x = ageg, y = pct, fill = religion_yn))+
  geom_col(position = "dodge") +
  labs(title = "연령대, 종교에 따른 이혼률", x = "연령대", y = "%")

