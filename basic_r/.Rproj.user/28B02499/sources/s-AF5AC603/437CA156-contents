# 데이터 병합 cbind(), rbind()
# 데이터 병합시, 각 데이터의 구조가 맞아야 한다
library(ggplot2)
mpg <- as.data.frame(mpg)
mpg

aaa <- mpg[1:3, 1:4]
bbb <- mpg[11:13, 1:4]

aaa
bbb

# 컬럽병합(가로병합) cbind()
cbind(aaa, bbb) #컬럼병합

# 로우병합(세로병합) rbind()
rbind(aaa, bbb) #행병합

# 주의
# cbind()는 행의 개수가 반드시 일치
# rbind()는 열의 개수가 반드시 일치

# 행, 열 비일치일 경우
ccc <- mpg[1:2, 1:5]
aaa
ccc
cbind(aaa, ccc) #매치에러

ddd <- mpg[1:3, 1:5]
aaa
ddd
rbind(aaa, ddd) #매치에러

# ==================================================
# 열데이터의 빈도수확인 table() -- 각 값의 count
# 2개 이상의 값은 다차원형식으로 나옴
table(mpg$model) # model데이터의 빈도수
table(mpg$year)
table(mpg$manufacturer)

# 열 데이터를 여러개 넣으면 다차원으로 빈도수 확인
table(mpg$manufacturer, mpg$year)

# hist(빈도수) -- 각 빈도수 개수를 그래프로 표현
# 빈도수의 간략한 표 형태를 표현
hist( table(mpg$model) )
hist( table(mpg$manufacturer) )

