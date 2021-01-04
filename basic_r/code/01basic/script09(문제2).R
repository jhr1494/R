# Q1. ggplot2 패키지의 mpg데이터를 사용할 수 있도록 불러온 뒤 복사본을 만드세요.
library(ggplot2)
mpgCopy <- as.data.frame(mpg)
mpgCopy

# Q2. 복사본 데이터를 이용해서 cty는 city로, hwy는 highway로 변수명을 수정하세요.
colnames(mpgCopy)[8] <- "city" #cty
colnames(mpgCopy)[9] <- "highway" #hwy

# Q3. 복사본 데이터를 이용해서 cty + hwy / 2의 total컬럼을만드세요.
mpgCopy$total <- (mpgCopy$city + mpgCopy$highway) / 2

# Q4. 컬럼 total의 평균을 출력하세요.
mean(mpgCopy$total) # 전체연비의 평균 : 20.14957

# Q5. total에 따른 파생변수 test를 생성합니다. (조건: total >= 20 이상 PASS 나머지 FAIL )
mpgCopy$test <- ifelse(mpgCopy$total >= 20, "PASS", "FAIL")

# Q6. total에 따른 파생변수 grade를 생성합니다. (24이상 A, 20이상 B, 나머지는 C )
mpgCopy$grade <- ifelse(mpgCopy$total >= 24, "A", 
                        ifelse(mpgCopy$total >= 20, "B", "C") )

# Q7. 데이터 일부를 출력해서 변수명이 바뀌었는지 확인해 보세요. 아래와 같은 결과물이 출력되어야 합니다.
head(mpgCopy)
