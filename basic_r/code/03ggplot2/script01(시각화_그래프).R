'''
참조사이트 https://ggplot2.tidyverse.org/reference/index.html
그래프만들기
ggplot(데이터셋, 축)
'''
# install.packages("ggplot2")
library(ggplot2)

mpg <- as.data.frame(mpg)

# 1단계 - 데이터, x축, y축 설정
ggplot(data = mpg, aes(x = displ, y = hwy))

# 2단계 - 데이터 표시형식 설정 geom_???()
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

# 3단계 - 데이터 표시 옵션설정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point(color = "red", size = 0.1)

# 4단계 - 부가옵션설정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point(color = "red", size = 0.1) + xlim(5,7)

# 시각화 함수들의 중첩이 길어지면 줄바꿈 → '+'가 해당줄의 마지막에 있도록 처리합니다
# scales를 이용한 축설정
ggplot(mpg, aes(x = displ, y = cty)) + 
  geom_point() + 
  xlim(5,7) + 
  ylim(10,30)

# scales를 이용해서 제목과 축설정
# 1st
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point() +
  xlab("x축 제목") +
  ylab("y축 제목") +
  ggtitle("이건 제목입니다다")

# 2nd
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point() +
  labs(title = "제목", x = "x축", y = "y축")

# aes축에 color값을 고정으로 지정 or data별로 지정
ggplot(mpg, aes(x = cty, y = hwy, color = cyl)) +
  geom_point()
