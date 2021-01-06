# Q1. mpg데이터에서 class(자동차 종류), cty(도시 연비) 변수를 추출해 새로운 데이터를 만들고 class(자동차 종류)가 "suv"인 자동차와 "compact"인 자동차 중 어떤 자동차의 cty(도시 연비)만 추출합니다.
# - 파이프라인으로 한번에 처리하세요.
library(ggplot2)
test1 <- as.data.frame(mpg)
str(test1)

x1 <- test1 %>% 
      select(class, cty) %>% 
      filter(class %in% c("suv", "compact")) %>% 
      head(10)
x1

# Q2. audi에서 생산한 자동차 중에 중 hwy가 1~5위에 해당하는 자동차의 (제조사, 모델, 년도, hwy)데이터만 출력하세요. 
# - 파이프라인으로 한번에 처리하세요.

test1 %>% 
  filter(manufacturer == "audi") %>%
  select(manufacturer, model, year, hwy) %>% 
  arrange(desc(hwy)) %>% 
  head(5)


# =====================================================


# gglplot2에 있는 mpg 데이터는 연비를 나타내는 변수가 hwy(고속도로 연비), cty(도시 연비) 두 종류로 분리되어 있습니다.

# Q1. mpg 데이터 복사본을 만들고, cty 와 hwy 를 더한 '합산 연비 변수'를 추가.
library(ggplot2)
test2 <- as.data.frame(mpg)
str(test2)

x1 <- test2 %>% 
      mutate(total = cty + hwy)
head(x1)

# Q2. 앞에서 만든 '합산 연비 변수'를 2 로 나눠 '평균 연비 변수'를 추가.
x2 <- x1 %>% 
      mutate(avg = total / 2)

# Q3. '평균 연비 변수'가 가장 높은 자동차 5순위 데이터를 출력.
x2 %>% 
  arrange(desc(avg)) %>% 
  head(5)

# Q4. 원본 데이터를 이용해서 1~3 번 문제에 더하여 avg가 35이상이면 high, 35미만이면 row를 추가하는 파이프라인으로 한번에 처리하는 구문을 완성하세요.
'''
test2 %>%
  mutate(total = cty + hwy,
         avg = (cty + hwy)/2) %>% #합계, 평균
  arrange(desc(avg)) %>% #내림차순
  mutate(result = ifelse(avg >=35, "high", "row")) %>% #조건result
  head(5) #5순위까지의 데이터출력
'''
# ans
test2 %>% 
  mutate(total = cty + hwy,
         avg = (cty + hwy)/2,
         result = ifelse(avg >=35, "high", "row")) %>%
  arrange(desc(avg)) %>% #내림차순
  head(5) #5순위까지의 데이터출력




