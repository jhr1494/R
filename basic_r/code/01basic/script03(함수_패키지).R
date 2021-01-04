# 간단한 함수
# 숫자형 함수 sum(), mean(), max(), min(), median()

x <- c(1:10)
x

sum(x) #합계
mean(x) #평균
max(x) #최대값
min(x) #최소값
median(x) #중앙값(중앙인덱스값) - 1,2,3 (4) 5,10,20(평균과 다름)


# 결측값이 있다면 함수의 사용이 불가능 - na.rm = true 옵션을 사용하여 제거
y <- c(1:10, NA, 11:20) #combine변수의 조합
y

sum(y, na.rm = T) # 결측값을 제거하고 합계
mean(y, na.rm = T)


# 문자형 함수 nchar(), paste()

str1 <- "hello world"
str2 <- "my name is park"
str3 <- c("a", "b", "c", "d", "e")

# 문자열의 길이 확인
nchar(str1) # 문자열의 길이(공백포함)
nchar(str2)
nchar(str3) # combine의 경우, 각 원소들의 문자열 길이가 나옴

# 문자열 합치기
paste(str1, str2)
paste(str1, 10, str2) # 문자와 숫자의 결합이 가능

# sep는 문자열들의 구분자를 지정 - 문자 + 문자 사이의 구분자는 sep사용
# 기본값은 " "
paste(str1, str2, sep = ",")
paste(str1, str2, sep = "-")

# collapse는 combine형 변수를 다룰 때 사용하는 옵션
# 각 원소간 사이의 구분자는 collapse사용 !
paste(str3, collapse = "-") 

# 문자열 자르기 함수
# substr(문자값, 시작인덱스, 끝인덱스) - R에서는 인덱스값이 1부터 시작
str1
substr(str1, 1, 3)
substr(str1, 7, nchar(str1))

# str1 <- substr(str1, 1, 2)



#패키지 설치
install.packages("ggplot2") #그래프를 그려주는 패키지
.libPaths() #경로 
library(ggplot2) #라이브러리 로드

x <-c(1,1,1,2,2,3,4,5)
qplot(x)#단순 빈도 그래프


#패키지에는 연습용 데이터가 존재
data(package = .packages(all.available = TRUE))

mpg
mpg <- as.data.frame(mpg)
mpg
class(mpg)

# qplot() 단순한 데이터 형태를 확인할 때 사용
qplot(data = mpg, x = hwy) # 자동차데이터의 고속도로 연비의 빈도
qplot(data = mpg, x = cty) # 도시주행거리 연비의 빈도
qplot(data = mpg, x = drv) # 자동차 구동방식의 빈도

qplot(data = mpg, x = drv, y = cty) # 구동방식 별 도심연비
qplot(data = mpg, x = drv, y = cty) # 구동방식 별 자동차 종류

qplot(data = mpg, x = drv, y = cty, geom = "line", color = drv)
qplot(data = mpg, x = drv, y = cty, geom = "boxplot", color = drv)

# 다섯명의 시험점수를 가지고 있는 변수를 생성하고 80, 54, 75, 34, 90
# 평균 합계를 새로운 변수에 저장해서 확인
score <- c(80, 54, 75, 34, 90)
avg <- mean(score)
sum <- sum(score)

