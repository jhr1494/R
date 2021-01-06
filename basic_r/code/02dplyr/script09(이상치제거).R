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
