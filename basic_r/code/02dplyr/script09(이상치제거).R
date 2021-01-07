'''
이상한값(이상치) 처리하기

논리적으로 이상한 값 ex) 남, 여, 3
or
상하위 0.3%를 벗어나면 극단치(이상한값)
'''

d1 <- data.frame(gender = c(1, 2, 1, 1, 3),
           score = c(12, 43, 65, 54, 23))

d1
table(d1$gender) #일반적인 빈도보다 확연히 적다면, 이상치로 판단합니다다

# 이상치를 NA값으로 변경
d1$gender <- ifelse(d1$gender == 3, NA, d1$gender)
d1

# NA값을 제거하고 분석
d1 %>% 
  filter(!is.na(gender)) %>% 
  group_by(gender) %>% 
  summarise(gender_mean = mean(score))

'''
# 극단적인 경우 제거
# boxplot(컬럼)
'''
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats

# 극단치 경계가 12, 37이기 때문에 초과, 미만데이터는 NA처리
mpg <- as.data.frame(mpg)

mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))

# NA는 제거후에 분석
mpg %>% 
  filter(!is.na(hwy)) %>% 
  group_by(drv) %>% 
  summarise(mean_der = mean(hwy))

# =====================================
# 문제
# ggplot2에 존재하는 mpg데이터를 사용합니다
# mpg데이터를 다음 구문으로 불러와서 이상치를 생성하세요.
library(dplyr)
library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)
mpg[ c(10, 14, 58, 93), "drv" ] <- "k"
mpg[ c(29, 43, 129, 203), "cty"] <- c(3,4,39,42)

str(mpg)

# Q1
# .drv에 이상치가 있는지 확인 합니다. 이상치를 결측치로 처리한 다음 확인하세요.
table(mpg$drv) #k
mpg$drv <- ifelse(mpg$drv == "k", NA, mpg$drv)

table(mpg$drv)



# Q2
# boxplot을 이용해서 cty의 이상치 범위를 확인하고 통계치를 이용해서 벗어난 값을 결측처리 한 후
# 다시 boxplot을 만들어서 확인하세요.
boxplot(mpg$cty)$stats

mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)

boxplot(mpg$cty)
boxplot(mpg$cty)$stats

# Q3
# drv와 cty의 이상치를 결측처리 했다면, 결측치를 제외한 다음 drv별 cty평균이 어떻게 다른지 확인하세요.
# 파이프라인을 사용합니다. (그룹핑)
mpg %>% 
  filter(!is.na(drv), !is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(mean_cty = mean(cty)) #na.rm = T
