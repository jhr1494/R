install.packages('Rserve')
library(Rserve)
Rserve(FALSE, port = 6311, args = '--RS-encoding utf8 --no-save --slave --encoding utf8 --internet2')
Rserve(args = "--RS- encoding utf8")

'''
r코드
'''
mean(c(10,20,30,40))

paste('hello', 'wordl')

c('hi', 'bye', '빠이!')


setwd('C:\\Users\\Hyerin\\Desktop\\Spring\\upload')
library(ggplot2)
mpg <- as.data.frame(mpg)
print(png(width = 500, height = 500, filename = '파일이름.png'))
print(ggplot(mpg, aes(x = class, fill = class)) + geom_bar())
print(graphics.off())

library(ggplot2)
library(dplyr)
mpg <- as.data.frame(mpg)

d1 <- as.data.frame(mpg) %>%
  group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy))

print(png(width = 500, height = 500, filename = 'd1.png'))
print(ggplot(d1, aes(x = reorder(manufacturer, mean_hwy), y = mean_hwy, fill = manufacturer)) + geom_col() + coord_flip())
print(graphics.off())
