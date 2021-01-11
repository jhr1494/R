#출력 방법 참고 주소
#http://rstudio-pubs-static.s3.amazonaws.com/13946_b80e36b88ac1470197dbdd1c99f479a4.html


#1. 작업폴더확인
getwd()
setwd("C:\\Users\\Hyerin\\Desktop\\Spring") #작업 폴더 변경

#2. png로 결과를 이미지로 출력
library(ggplot2)
mpg <- as.data.frame(mpg)
mpg

png(width = 500 , height = 500 , filename = "test.png") #1.ppng파일 경로 선언
ggplot(mpg, aes(x= drv, fill = drv)) +
  geom_bar() #누적막대챠트 #2. 출력결과를 시각화
graphics.off() #3.그래픽 써내리기


#3. PDF 로 결과를 출력
pdf(file = "test.pdf")
ggplot(mpg, aes(x= drv, fill = drv)) +
  geom_bar() #누적막대챠트 #2. 출력결과를 시각화
graphics.off()


#4.분석결과 보고서를 직접출력하기
# mark up language