'''
그래프와 그래프 더하기
중간에 있는 레이어층(그래프함수)들이 겹쳐서 서로 보이는 형태로 사용함

여러그래프를 겹쳐 표현할 때는 aes()을 그래프 함수에 넣습니다
'''
# 그래프는 레이어식으로 층층이 겹쳐서 표현이 가능합니다

# 기존방식
eco <- as.data.frame(economics)
ggplot(eco, aes(x = date, y = psavert)) +
  geom_line()

# x, y축을 그래프생성시 같이 사용할수 있습니다. -> 이런방식으로 겹치기가 가능
ggplot(eco) +
  geom_line(aes(x = date, y = psavert))


# 겹치기
mpg <- as.data.frame(mpg)
str(mpg)

# 옵션을 aes함수 안에 지정하면 범주가 나타나고
# 밖에 선언해주면 그래프 색상만 변합니다다
ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy, color = 'red')) +
  geom_point(aes(x = hwy, y = displ), color = 'blue')


# 하나의데이터를 점과 라인으로 표현
# 저축률 vs 실업율
a <- ggplot(eco) +
  geom_line(aes(x = date, y = psavert), color = "red") +
  geom_line(aes(x = date, y = uempmed), color = "blue") 

# line과 point
b <- ggplot(eco) +
  geom_line(aes(x = date, y = psavert), color = "red") +
  geom_point(aes(x = date, y = psavert), size = 0.1) 

# 저축률 vs 실업율
# hline() - 수평축(yintercepter에 축 위치)
# vline() - 수직축(xintercepter에 축 위치)
c <- ggplot(eco) +
  geom_line(aes(x = date, y = psavert), color = "red") +
  geom_line(aes(x = date, y = uempmed), color = "blue") +
  geom_hline(yintercept = mean(eco$psavert), color = "green") +
  geom_vline(xintercept = as.Date("2010-12-31"), color = "pink") +
  labs(title = "저축률 vs 실업률", x = "날짜", y = "저축률(실업률")


# 동시에 여러 그래프를 표현하기 gridExyra패키지
install.packages("gridExtra")
library(gridExtra)

# step1 - 각각의 그래프를 변수에 저장
a
b
c
# step2 - grid.arrange() 함수안에 표현
grid.arrange(a,b,c, nrow = 1, ncol = 3)
grid.arrange(a,b,c, nrow = 3, ncol = 1)
grid.arrange(a,b,c, nrow = 2, ncol = 2)
