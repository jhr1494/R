'''
stringr은 벡터형의 문자열을 자루는 다양한 기능이 들어있습니다.
'''
install.packages("stringr")
library(stringr)

?stringr

emp <- read.csv("data/emp.csv")
str(emp)
emp

# str_detect(벡터형, 정규식) - 패턴검사(논리형(true,false)으로 반환)
str_detect(emp$FIRST_NAME, "a") #a를 포함하는
str_detect(emp$FIRST_NAME, "[aA]") #a or A를 포함하는

str_detect(emp$FIRST_NAME, "^a") #a로 시작하는
str_detect(emp$FIRST_NAME, "^[aA]") #a or A로 시작하는

str_detect(emp$FIRST_NAME, "a$") #a로 끝나는
str_detect(emp$FIRST_NAME, "[aA]$") #a or A로 끝나는


# str_count(벡터형, 정규식) - 출현빈도
str_count(emp$JOB_ID, "A") #A의 출현빈도
str_count(emp$JOB_ID, "PROG") #PROG의 출현빈도
str_count(emp$JOB_ID, toupper("prog")) #PROG의 출현빈도
# toupper() - 대문자변환 / tolower() - 소문자변환


# str_length(벡터) - 각 문자열의 길이
length(emp$FIRST_NAME) #벡터의 길이 - 열의 원소개수
nchar(emp$FIRST_NAME) #각 원소의 길이
str_length(emp$FIRST_NAME) #각 원소의 길이


# str_c(백터, 백터, 옵션(sep, collapse...)) - paste()와 동일(문자열합치기)
# sep --- 벡터 + 벡터 시에 구분자 지정
# collapse --- 하나의 벡터데이터를 문자열로 연결시 구문자
paste(emp$FIRST_NAME, emp$LAST_NAME, sep = "-") # 각 벡터의 연산 구분자 sep
str_c(emp$FIRST_NAME, emp$LAST_NAME, sep = "-")

paste(emp$FIRST_NAME, collapse = ",") #하나의 벡터데이터를 연결할 때는 collapse


# str_sub(벡터, 시작, 끝) - substr()과 동일(문자열자르기)
substr(emp$HIRE_DATE, 1, 2) #1~2인덱스 추출
str_sub(emp$HIRE_DATE, 1, 2)

# 기본함수는 끝값을 반드시 지정해야하는 반면에 str_sub는 생략시 끝까지 추출.
substr(emp$HIRE_DATE, 4, nchar(emp$HIRE_DATE)) #4~끝 인덱스 추출
str_sub(emp$HIRE_DATE, 4)


# ★★
# str_replace(벡터, 정규식, 치환문자) - 처음매칭되는 값을 변경
# 주의
# ., +, * 은 정규표현식의 표현형식이므로 있는 특수문자 그대로 사용하려면 \\를 붙임
str_replace(emp$PHONE_NUMBER, "\\.", ")" ) 

# str_replace_all()(벡터, 정규식, 치환문자) - 모든 매칭되는 값을 변경 
str_replace_all(emp$PHONE_NUMBER, "\\.", "-") #.을 전부 -적용
str_replace_all(emp$PHONE_NUMBER, "\\.", "") # 전부 .제거

# 치환결과를 저장
emp$PHONE_NUMBER <- str_replace_all(emp$PHONE_NUMBER, "\\.", "-")
emp


# ===== 문제 =====
# HIRE_DATE의 타입을 확인하고 2020-01-06형식의 날짜형 데이터로 전부변경
# as.Date(), str_c(), str_replace_all()
# r에서 날짜형은 yyyy-mm-dd을 가져야 합니다.
str(emp$HIRE_DATE)
emp$HIRE_DATE <- as.Date(str_c(20, str_replace_all(emp$HIRE_DATE, "/", "-"))) 








