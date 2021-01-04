# 외부데이터 불러오기
getwd() # 현재 기준의 작업폴더 조회(프로젝트기준으로!)
setwd("C:/Users/Hyerin/R/basic_r") # 작업폴더 변경(왠만하면 안바꾸는게 좋음)


# read.table() - txt파일을 읽음
# 첫번째 행이 컬럼명인 경우는 header = T 옵션을 사용합니다
d1 <- read.table("data/excel_exam.txt", header = T)
class(d1)
d1

# 데이터가 tap으로 구분된 파일을 읽을 때 사용.
d2 <- read.delim("data/excel_exam.txt",header = T, sep = "\t")
d2

# read.csv() - csv파일을 읽음
# 문자데이터를 읽어 들어올 때, 컬럼이 factor로 변경되는 문제가 있음
# stringsAsFactors = F 옵션을 사용하여 방지합니다
d3 <- read.csv("data/excel_exam.csv", stringsAsFactors = F)
d3
class(d3) # 데이터의 타입(필수확인!)
str(d3) # 데이터의 구조(필수확인!)

# excel파일을 읽기 위해서 패키지설치
install.packages("readxl")
library(readxl)

# excel에 순수한 데이터만 있을 경우, col_names = F 옵션을 넣습니다
# excel파일의 첫행이 데이터인 경우에는 col_names을 F로 선언해서 가지고 옵니다 
d4 <- read_excel("data/excel_exam.xlsx")
d4 <- as.data.frame(d4)
class(d4) # 데이터프레임으로 변경이 필요
d4

# ===========================================
# file -> import dataset 선택하고 마우스로 데이터를 import도 가능

# 데이터 저장하기
name <- c("park", "kim", "lee", "choi", "hong")
kor <- c(10, 20, 30, 40, 50)
eng <- c(23, 45, 64, 34, 23)

d5 <- data.frame(name, kor, eng)

# \는 탈출문자(이스케이프문자)로 \\두번 작성해야 합니다
write.csv(d5, file = "data/export.csv") # getwd()(=작업폴더기준)의 상대경로
write.csv(d5, file = "C:\\Users\\Hyerin\\R\\basic_r\\data\\export.csv") # 절대경로
