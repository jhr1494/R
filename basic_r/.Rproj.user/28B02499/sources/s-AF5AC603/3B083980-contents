exam <- read.csv("data/excel_exam.csv", stringsAsFactors = F)
exam
str(exam)

# 데이터 수정
# 수정할 데이터[행, 열] <- 수정할 값
exam[1, ] <- 100 #첫행변경
exam[c(1,3,5),] <- 100 #1,3,5행 변경

#데이터 열 수정하기
exam[, 4] <- 50
exam[, "english"] <- 70

# 데이터 부분수정하기
# 10행의 math값만 변경
exam[10, "math"] <- 1000

# 데이터 열 추가하기
# 열 인덱스 or 열 이름을 이용해서 추가
exam[,6] <- "hello"
exam[, ncol(exam)+1] <- "bye" #컬럼 개수를 구해서 끝행에 추가

# 컬럼명을 이용해서 추가
exam[, "xxx"] <- "abc" #열 이름으로 추가 → 열이름이 없는 경우, 끝에 해당 컬럼명으로 열 생성
exam$yyy <- "yyy" #열 이름으로 추가

# 컬럼명의 수정 - colnames()[변경할 컬럼Index] <- "변경할 컬럼명"
# colnames()은 백터형으로 반환됩니다
colnames(exam)[6] <- "zzz"
colnames(exam)[7] <- "kkk"

# 연속적인 컬럼명수정, 전체컬럼 수정
colnames(exam)[6:9] <- c("aaa", "bbb", "ccc", "ddd") #6-9열의 컬럼명 연속수정
colnames(exam) <- c("a", "b", "c", "d", "e", "f", "g", "h", "i")

# 행열의 삭제(음수이용)
exam[, -1] #마지막열 삭제

# 주의할 점 - 기본형식에서 컬럼수정은 반드시 인덱스로 수정
# colnames()는 컬럼명으로 찾아서 수정할 수 없습니다 
# → 백터형은 키값을 가질 수 없으며, 인덱스로만 조회가능합니다
# colnames(exam)["i"] <- "test"
# test <- c("aaa", "bbb", "ccc")
# test["aaa"] #NA

head(exam,10)

# =====================================
exam <- read.csv("data/excel_exam.csv", stringsAsFactors = F)
exam

# ifelse를 이용한 파생변수 생성
# ifelse(조건절, 참일경우, 거짓일경우)

# 벡터형으로 추출 후 연산 → 벡터형의 연산은 각 인덱스 별로 연산됩니다 !
exam$total <- exam$math + exam$english +exam$science #각 총점
exam$avg <- exam$total/3 #각 평균 → (exam$math + exam$english +exam$science) / 3

# 조건절을 이용한 파생변수 생성
# 평균이 60 이상은 "Y" 이하는 "N"
# ifelse(exam$avg >= 60, TRUE, FALSE)
exam$pass_fail <- ifelse(exam$avg >= 60, "Y", "N")

# =======================================================
# 예제
# level컬럼명 추가 40이하는 row, 40~60은 middle, 60이상은 high
# 힌트: ifelse의 중첩
# exam$levle <- ifelse(exam$avg < 60, "row", #평균 60미만
#                      ifelse(exam$avg > 80, "high", "middle")) #평균 60이상

exam$levle <- ifelse(exam$avg >= 80, "high", 
                     ifelse(exam$avg >= 60, "middle", "row"))


exam
