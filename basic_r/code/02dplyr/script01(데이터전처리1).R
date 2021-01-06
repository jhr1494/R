'''
데이터 전처리 패키지 - 분석 전 필요한 부분을 정렬이나 편집하는 작업
행추출 - filter(데이터세트, 조건)
'''

.libPaths() #작업경로 확인
install.packages("dplyr") #설치
library(dplyr) #로드

data <- read.csv("data/excel_exam.csv")
data

d1 <- filter(data, class == 1) #조건에 맞는 데이터를 데이터프레임형식으로 반환
d1
mean(d1$math) #class 1의 수학평균

d2 <- filter(data, class != 3) #클래스가 3이 아닌 행
d2

d3 <- filter(data, math>= 50) #math가 50 이상인 행
d3

d4 <- filter(data, class == 2 & english >= 80) #클래스가 2이면서 영어가 80이상인 행
d4

# %in% - 매칭되는 데이터를 찾을 때 사용합니다
# 조건이 연속성(범위)이거나 여러개 일 경우
d5 <- filter(data, class %in% c(1, 3, 5)) #class 1, 3, 5
d5

d6 <- filter(data, math %in% c(30:70)) #30~70
d6


# 데이터 가공을 순차적으로 실행해 주는 파이프라인
# 조건이 종류가 다양한 경우1
# 문장이 길어지고 복잡해진다
ex1 <- filter(data, class != 1) #클래스가 1이 아닌
ex1

ex2 <- filter(ex1, math >= 50) # 수학점수가 50이상인
ex2

ex3 <- filter(ex2, id %% 2 == 0) #id가 짝수인경우
ex3

# 조건이 종류가 다양한 경우2 
# %>%(파이프라인)의 사용( %>% 단축키 : ctrl + shift + M)
ex4 <- data %>%
       filter(class != 1) %>%
       filter(math >= 50) %>%
       filter(id %% 2 == 0)
mean(ex4$science) #63.5

## mean은 dataframe을 넘기는 함수형태가 아니기 때문에 아래처럼 사용불가
# 에러발생 -- mean()는 데이터프레임으로 반환되지 않기 때문에 파이프라인으로 연결 할 수 없다
  # data %>%
  # filter(class != 1) %>%
  # filter(math >= 50) %>%
  # filter(id %% 2 == 0) %>% 
  # mean(science) 

11 / 3 #실수 몫
11 %/% 3 #정수 몫


## 문제
# ggplot2에 있는 mpg 데이터를 이용해 분석 문제를 해결해 보세요.
library(dplyr)
library(ggplot2)
temp <- as.data.frame(mpg)
str(temp)

# Q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다. displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 파이프라인을 이용해서 알아보세요.
test1_4D <- temp %>% 
          filter(displ <= 4)
test1_5U <- temp %>% 
          filter(displ >= 5)

mean(test1_4D$hwy) #4이하 25.96319
mean(test1_5U$hwy) #5이상 18.07895

# 소수점2자리로 반올림
round(mean(test1_4D$hwy), 2) #25.96 
round(mean(test1_5U$hwy), 2) #18.08

# Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다. "audi“ 제조년월이 2000년 이상인 데이터의 cty 합계, 평균을 구하세요
test2 <- temp %>% 
          filter(manufacturer == "audi") %>% 
          filter(year >= 2000)

sum(test2$cty) #합계 163
mean(test2$cty) #평균 18.11111

# Q3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 합니다. 이 회사들의 자동차를 추출한 뒤 hwy 전체 평균을 구해보세요.
test3 <- filter(temp, manufacturer %in% c("chevrolet", "ford", "honda"))
mean(test3$hwy) #22.50943
