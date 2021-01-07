'''
막대그래프 - 집단별 평균을 나타낼때 일반적으로 사용합니다.
데이터의 요약정보를 먼저 만들고, 평균표를 이용합니다
geom_col()
'''

library(ggplot2)
library(dplyr)

mpg <- as.data.frame(mpg)

# drv별 cty(고속도로)연비 평균
d1 <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm = T))

ggplot(d1, aes(x = drv, y = mean_hwy)) +
  geom_col()

# reorder는 (정렬하고 싶은변수, 연속형변수)
ggplot(d1, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) +
  geom_col()

# 제조사별 hwy평균
d2 <- mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy))

as.data.frame(d2)  

ggplot(d2, aes(x = reorder(manufacturer, -mean_hwy), y = mean_hwy)) +
  geom_col()


'''
# 누적막대 그래프(빈도) 그래프
geom-bar()를 사용, 원자료를 이용해서 처리해도 됩니다.
빈도를 표현하기 때문에 x값만 지정합니다
'''
# 구동방식별 빈도
ggplot(mpg, aes(x = drv)) +
  geom_bar()

'''
막대그래프에서 막대채우기 색상을 구분할 때는 fill = 컬럼 
을 작성하면 됩니다 
'''
# class별 빈도
ggplot(mpg, aes(x = class, fill = manufacturer)) +
  geom_bar()

# 구동방식별 model
ggplot(mpg, aes(x = drv, fill = model)) +
  geom_bar()

# 구동방식별 fl(연료)
ggplot(mpg, aes(x = drv, fill = fl)) +
  geom_bar()

# 구동방식별 fl(연료) 누적열을 각각 분리
ggplot(mpg, aes(x = drv, fill = fl)) +
  geom_bar(position = "dodge")

# 구동방식별 fl(연료) 누적열을 비율 분리
ggplot(mpg, aes(x = drv, fill = fl)) +
  geom_bar(position = "fill")


'''
막대그래프의 가독성을 올려주는 coordinate
누적열을 회전, 원형으로 변경
'''
# r그래프 회전시키기 coord_filp()
# x축 데이터가 많은 경우 가독성을 위해 사용합니다.
ggplot(mpg, aes(x = model, fill = model)) +
  geom_bar() +
  coord_flip()

# 막대그래프의 원형차트로의 변경 coord_polar()
# 제조사별 구동방식
ggplot(mpg, aes(x = manufacturer, fill = drv)) +
  geom_bar() +
  coord_polar()

# 구동방식별 모델
ggplot(mpg, aes(x = drv, fill = model)) +
  geom_bar() +
  coord_polar()

# 구동방식별 연료
ggplot(mpg, aes(x = drv, fill = fl)) +
  geom_bar() +
  coord_polar()


'''
연속형 막대차트에서는 데이터가 없는 경우 빈 영역으로 표시되는데
원형차트를 사용할 때는 축이나 fill값을 빈요소가 없도록 처리하는 편이 좋습니다.
as.factor() or factor() 형태로 변환합니다.
'''
# 빈 자료는 빈공간으로 표시
ggplot(mpg, aes(x = hwy, fill = drv) ) +
  geom_bar()+
  coord_polar()

# 빈 공간은 사라짐
ggplot(mpg, aes(x = factor(hwy), fill = drv) ) +
  geom_bar()+
  coord_polar()


'''
원 그래프의 비율을 표기 coord_polar(theta = "y")
'''
ggplot(mpg, aes(x = drv, fill = model) ) +
  geom_bar(position = "fill")+
  coord_polar(theta = "y")

'''
원그래프를 이용한 하나의 컬럼값 비율
x축을 1(100%)로 설정함으로서,
"fill = 컬럼"을 통한 컬럼의 해당요소 비율을 표기 
'''
ggplot(mpg, aes(x = 1, fill = class) ) +
  geom_bar(position = "fill")+
  coord_polar(theta = "y")

ggplot(mpg, aes(x = 1, fill = drv) ) +
  geom_bar(position = "fill")+
  coord_polar(theta = "y")


# ==================================
# 문제
ggplot(mpg, aes(x = class, fill = drv)) + 
  geom_bar(position = "fill") +
  coord_flip()


'''
R에서는 기본적으로 제공해주는 색상들이 존재하기 때문에
막대그래프에서 fill을 이용하면 기본색상이 적용됩니다.
scale_fill_manual(컬러)
'''
# 막대그래프의 색상을 직접지정
test <- mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))


my_color = c("2seater" = "#2A4D6E",
             "compact" = "#AA8F39",
             "midsize" = "#AA5E39",
             "minivan" = "#4A6B8A",
             "pickup" = "#D4BC6A",
             "subcompact" = "#D48C6A",
             "suv" = "#728CA6"
             )

ggplot(test, aes(x = class, y = mean_cty, fill = class)) +
  geom_col() +
  scale_fill_manual(values = my_color)
