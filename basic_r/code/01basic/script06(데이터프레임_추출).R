#데이터 추출
library(ggplot2) # r을 열떄마다 다시 불러와주어야 함
mpg <- as.data.frame(mpg) # data.frame 테이블 모양으로 mpg를 변형시켜준다

# 인덱싱을 활용한 데이터 행추출
# 변수명[행, 열]
# 행데이터 추출 - 데이터명[행index,]
mpg
mpg[3,] #3행만 추출(단일형)
mpg[15,]
mpg[1:6,] #1-6행 추출(연속형)
mpg[c(2,4,6),] #2, 4, 6행 추출
mpg[c(1:6, 8, 10), ] #1-6, 8, 10행 추출

# 인덱싱을 활용한 데이터 열추출
# 열데이터 추출 - 데이터명[,열index]
mpg[, 3] #3열 추출(단일형 추출일 경우, 벡터형으로 반환)
mpg[, 7] #7열 추출
mpg[, 1:6] #1-6열 추출
mpg[, c(1:6, 8, 10)]#1-6, 8, 10열 추출
mpg[,"model"] #model열 추출 - 열이름(컬럼명)으로 추출
mpg[, c("model", "class")] #model, class열 추출

# 인덱싱을 활용한 데이터 행열추출
head(mpg)
mpg[1,3]
mpg[1:3, 2:3] #〓mpg[1:3, c("model", "displ")] → 1-3행, 2-3열
mpg[4:6, c("displ", "year", "trans")] #〓mpg[4:6, c(3:4, 6)] → 4-6행, 3,4,6열

# 주의
# 데이터프레임에서 컬럼이 1개인 경우, vector형으로 결과가 나옵니다
mpg[1:3, 1]
mpg[1:3,"model"]

# ==============================================
# 데이터프레임에서 특정행에 대한 결과를 보려면 $컬럼명
# 조건형식으로 데이터 추출
str(mpg)
mpg$manufacturer #mpg[, "manufacturer"]
mpg$model #mpg[, "model"]
mpg$year
mpg$class

# $연산을 이용해서 조건에 충족하는 행 추출
mpg[mpg$model == "a4",] #모델 값이 "a4"인 행추출
mpg[mpg$year >= 2000,] #생산년도 2000년 이후 행추출
mpg[mpg$cty >= 20,] # 도로연비가 20이상인 행추출

# &(and), |(or)를 이용하여 복합 조건문을 만들수 있습니다
mpg[mpg$cty >= 20 & mpg$hwy >=30,] # 도로연비가 20이상, 고속도로연비가 30이상인 행추출



#예제
# Q1
fruit <- data.frame( product = c("사과", "딸기", "수박"),
                     price = c(1800,1500,3000),
                     buy = c(24,38,13) )
fruit
class(fruit)
str(fruit)

# Q2
sum(fruit$price) #과일가격 합계
mean(fruit$price) #과일가격 평균

sum(fruit$buy) #과일판매량 합계
mean(fruit$buy) #과일판매량 평균

