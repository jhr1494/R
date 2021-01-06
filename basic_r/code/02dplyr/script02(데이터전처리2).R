'''
열 추출하기 select(데이터세트, 열...)
'''
library(dplyr)
data = read.csv("data/excel_exam.csv")

select(data, id)
select(data, id, math, english) #여러열 셀렉트
select(data, -id) #id열 제외
select(data, -id, -class) #여러열 제외

# 클래스가 1~3인 행 데이터의 국, 영, 수 컬럼만 조회(파이프라인)
data %>% 
  filter(class %in% c(1:3) ) %>% 
  select(math, english, science) %>% 
  head(10)


'''
열 정렬하기 arrange(데이터세트, 열...) (default : 오름차순)
내림차순 정렬을 하고싶다면 desc(열) 를 이용합니다.
'''

arrange(data, math) # 수학 오름차순
arrange(data, desc(math)) #수학 내림차순
arrange(data, class, math) #클래스 오름차순, math오름차순
arrange(data, desc(class), id) #id 내림차순, 클래스 올림차순

# 파이프라인으로 연결하여 사용할 수 있다
data %>% 
  filter( class %in% c(1:3)) %>% 
  select(id, math) %>% 
  arrange(desc(math))

'''
기존 열에 대해서 새로운 열 추가 mutate(데이터세트, 열 = 기준열)
실제 데이터세트가 변한 것이 아니기 때문에 데이터세트에 저장( <- )이 꼭 필요합니다
원본데이터에 변동이 없으므로 파이프라인 활용으로 다른 변수에 대입이 가능합니다
'''
# 기존의 열 추출방법(기존의 dataset이 바로변함)
data$test <- data$math + data$english + data$science
data

# mutate의 사용
d1 <- mutate(data, total = math + english + science)
d1

# 여러열을 한번에 생성하기
d2 <- mutate(data, total = math + english + science,
              avg = round((math + english + science)/3, 2),
              aaa = "hello")
d2

# 조건에 따른 파생변수 추가
d3 <- mutate(d2, exam_result = ifelse(avg >= 60, "pass", "fail") )
d3


# 파이프라인으로 한번에 작성하기(total, avg, exam_result) 변수
data <- read.csv("data/excel_exam.csv")
data

result <- data %>% 
          mutate(total = math + english + science,
                 avg = round((math + english + science)/3, 2) ) %>% 
          mutate(exam_result = ifelse(avg >= 60, "pass", "fail") ) %>% 
          filter(exam_result == "pass")

result
