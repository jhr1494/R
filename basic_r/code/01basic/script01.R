# 주석은 #으로 표현(ctrl + shift + c)

# 문자는 "", ''를 사용
# ;을 사용하지 않습니다
"Hello world"
'Hello'

# 변수의 대입 : <- (alt + -), =
# 화살표 단축키 alt + -
# 저장 ctrl + s
# 변수의 중복시 갱신됨
a <- 1
b <- 20
a <- "hello world" 
a <- 10
a <- 3.14

# r의 연산자
a + b
a - b
a / b
a * b

a == b
a != b
a > b
a < b

# r에서는 여러값으로 구성된 변수 combine()
var1 <- c(1,3,5,7,9)
var1

var2 <- c(1:100)
var2

var3 <- c("a", "b", "c", "d")
var3

# 숫자 문자를 동시에 저장하면 문자형으로 저장
var4 <- c(1, "3") 
var4

# 여러 값으로 구성된 변수 seq()
var5 <- seq(1, 10)
var5

# seq(1, 10, 2) #(시작값, 끝값, step값) --- 1~10까지 +2씩
var6 <- seq(1, 10, by = 2)
var6

var7 <- seq(2, 10, by = 2) # 2~10까지 2씩 증가
var7

# 변수의 연산
var1 + 10 # var1에 모든값에 10을 더한 값이 나온다
var1 + var7 # 각각 같은 위치의 더한 값이 나온다

var1 + var2 # 연속변수의 개수가 다르면 전부 연산한 결과로 처리됩니다

# var3 + 10 # 문자로 된 변수는 연산할 수 없습니다.

# 특정변수의 삭제 -- rm(변수명), remove(변수명)
remove(a) # a변수삭제
remove(b) # b변수삭제
