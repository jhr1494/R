# 자료형

# 숫자형 변수
a <- 1
class(a) # numeric

a <- 3.14
class(a) # numeric

# 문자형 변수
b <- "1"
class(b) # character

c <- c(1:10)
class(c) # integer(=numeric)

d <- TRUE
class(d) # logical

# 범주형변수 factor()로 생성
# 등급, 분류와 같이 명목이 뚜렷한 표현에 적합
e <- factor( c(1,2,3,2,2,2,1,3,4) ) # 1, 2, 3, 4의 범주
class(e) # factor
levels(e) # 1, 2, 3, 4 --- 범주확인

# 타입변환 함수 
# as.numeric()(숫자형으로), as.character()(문자형으로), as.factor()(factor형으로)
as.character(a)
as.character(c)
as.numeric(b)
as.factor(c)
# as.Date("2020") # 문자열 -> 날짜
class( as.Date("2020-01-01") ) # 반드시 날짜 서식형태를 지켜야 합니다

# 객체형 데이터 타입
# vector - 1가지 타입으로 생성된 변수
c(1,2,3,4,5) #numeric 이면서 vector
c(1:10)
c(1,2,3,"park", "hong") # 모두 문자형으로 저장되기 때문에 vector

# dataframe - 여러타입이 합쳐진 2차원 구조
data.frame(a = c(1, 2, 3), 
           b = c("park", "hong", "kim") ) # 각 변수를 행으로 나열

data.frame(a = c(1:3),
           b = c("park", "hong") ) #error - dataframe은 길이를 통일시켜야합니다

# 행렬(matrix) - 1가지 타입으로 구성된 2차원 구조
# 차원구조를 기술해줘야합니다!(nrow(행), ncol(열))
matrix( c(1:6), nrow = 3, ncol = 2 ) #3행 2열
matrix( c(1:6), nrow = 2, ncol = 3 ) #2행 3열
matrix( c(1:6), nrow = 3, ncol = 3 ) #값이 모자라는 경우, 앞의 원소를 채워줍니다

as.data.frame( matrix( c(1:6), nrow = 2, ncol = 3) ) #matrix -> data.frame으로

# Array - 다차원 구조의 매트릭스(-> 매트릭스의 복합체(매트릭스가 겹겹이!))
# array( 데이터, dim = c(행, 열, 차원(=겹)) )
array( c(1:15), dim = c(3, 4, 3) ) #3행 4열 3차원

#list - 모든 요소를 담는 다차원 구조
list(a = c(1:5),
     b = data.frame(a = c(1,2,3), b = c("kim", "lee", "choi")),
     c = matrix(c(1:6), nrow = 3, ncol = 2) )
