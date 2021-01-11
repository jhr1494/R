library(ggplot2)
library(dplyr)
library(readxl)
# [문항1]  주택도시보증공사에서 제공하는 민간아파트 분양가격 동향 데이터를 분석하려 합니다.
# 해당 csv파일을 읽어 들어와 예시와 같이 컬럼명을 변경하세요.
data <- read.csv("data/주택도시보증공사_전국 평균 분양가격(2020년 2월).csv")
colnames(data)
data <- rename(data, "region" = "지역명", 
                       "area" = "규모구분",
                       "year" = "연도",
                       "month" = "월",
                       "price" = "분양가격...")

# [문항2]  결측치가 있는 컬럼은 어디인가요?
table(is.na(data$region))
table(is.na(data$area))
table(is.na(data$year))
table(is.na(data$month))
table(is.na(data$price)) #NA 있음

# [문항3]  area 전체는 제외한 새로운 데이터를 생성합니다.
# 분석의 편의를 위해 area의 전용면적에 따라 A,B,C,D로 구분하는 area_lv컬럼을 생성합니다
group_by(data, data$area) %>% 
  summarise() #area요약

test <- data %>% 
  filter(!area == "전체") %>% 
  mutate(area_lv = ifelse(area == "전용면적 60㎡이하", "A",
                   ifelse(area == "전용면적 60㎡초과 85㎡이하", "B",
                   ifelse(area == "전용면적 85㎡초과 102㎡이하", "C","D"
                   ))))
  

test
 
# [문항4]  지역별 평당 분양가격 전체 평균을 구하고 막대그래프로 시각화하여 제출하세요
t1 <- test %>% 
  filter(!is.na(price)) %>% 
  group_by(region) %>% 
  summarise(mean_price = mean(price))

t1 %>% 
ggplot(aes(x = reorder(region, -mean_price), y = mean_price, fill = region)) +
  geom_col() +
  labs(title = "지역별 평당 분양가격", x = "지역", y = "평단분양가격 평균")

# [문항5]  2016, 2017, 2018, 2019년의 연도별,지역별 분양가격평균을 막대그래프로 시각화하여 제출하세요
t2 <- test %>%
  filter(!is.na(price)) %>% 
  filter(year %in% c(2016, 2017, 2018, 2019 )) %>% 
  group_by(year, region) %>% 
  summarise(mean_price = mean(price))

t2 %>% 
  ggplot(aes(x = year, y = mean_price, color = region)) +
  geom_col(position = "dodge")+
  labs(title = "연도별,지역별 분양가격평균", x = "연도", y = "평당분양가격 평균")


# [문항6]  2019년 서울지역의 월별 분양가격 평균 변화 추이를 시계열그래프로 시각화하여 제출하세요

t3 <- test %>% 
  filter(!is.na(price) & year == 2019 & region == "서울") %>% 
  group_by(month) %>% 
  summarise(mean_price = mean(price))

ggplot(t3, aes(x = month, y = mean_price)) +
  geom_line() +
  labs(title = "2019년 서울지역 월별 평균변화", x = "월", y = "평당분양가격 평균")


# [문항7]  연도별 아파트 평당분양가 변화동향을 시계열그래프로 시각화하여 제출하세요.
library(stringr)

# year, month를 기반으로 DATE 생성
test <- test %>%  
mutate(date = as.Date(str_c(year, ifelse(month < 10, str_c(0,month), month ), 01, sep = "-") ))


t4 <- test %>%
  filter(!is.na(price)& region == "서울") %>% 
  group_by(date) %>% 
  summarise(mean_price = mean(price))

ggplot(t4) +
  geom_line(aes(x = date, y = mean_price), color = "red") +
  geom_hline(yintercept = mean(t4$mean_price), color = "green") +
  labs(title = "연도별 아파트분양가 변화동향(서울)", x = "연도", y = "평당분양가격 평균")
         
        

  

