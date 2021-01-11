'''
텍스트마이닝 - 문자로 된 데이터에서 가치있는 정보를 얻어오는 분석기법
1. 자바가 설치되어 있어야 합니다
2. rJava, KoNLP라이브러리가 필요합니다
3. 기존에 사용하는 방법이 안되므로, git에서 라이브러리를 받는 형식으로 진행
'''
install.packages("rJava")
install.packages("multilinguer")
library(rJava)
library(multilinguer)

# 의존성 패키지 설치
install.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type = "binary")

# github 버전 설치
install.packages("remotes")

# 64bit 에서만 동작합니다.
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
library(KoNLP) #확인 -> 없는 패키지, 업데이트가 필요한 패키지를 확인 후 재 업로드

# rlang이 설치가 안되어서 따로 설치시도도
install.packages("rlang")
library(rlang)

# 위 설치 완료 후에 확인
library(KoNLP)
useNIADic() #사전 업로드

#=============================================
# 1. 데이터를 한줄씩 읽습니다.
song <- readLines("data/song.txt")
song

# 2. stringr패키지를 이용해서 특수문자를 제거(\\w는 정규표현식에서 특수문자를 의미)
library(stringr)
song <- str_replace_all(song, "\\W", " ")

# 문장에서 명사를 추출하는 extractNoun()
extractNoun("동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세")

# 3. 명사추출 - extractNoun()는 결과를 list로 반환합니다
song_list <- extractNoun(song)
song_list #list로 반환됨
class(song_list)

# 4. unlist함수를 이용해서 vector형으로 형변환
song_vector <- unlist(song_list)
song_vector
class(song_vector)

# 5. vector형에서 분석을 위해 dataframe으로 변경
song_df <- as.data.frame(song_vector)
head(song_df)

# 6. 분석을 위한 컬럼명 변경
library(dplyr)
song_df <- rename(song_df, word = song_vector)

head(song_df)

# 7. 분석(단어의 자주사용된 빈도를 내림차순으로 정렬)
result <- song_df %>% 
  filter(nchar(word) >= 2) %>% 
  group_by(word) %>% 
  summarise(feq = n()) %>% 
  arrange(desc(feq))

View(result)

# woedcloud 설치
install.packages("wordcloud")
library(RColorBrewer) #색상지정
library(wordcloud)

# 색상목록을 추출 pal(이름, 색상명)

# Accent	8
# Dark2	8
# Paired	12
# Pastel1	9
# Pastel2	8
# Set1	9
# Set2	8
# Set3	12

?brewer.pal
color <- brewer.pal(8, "Accent")
color <- brewer.pal(12, "Set3")

# 난수고정
set.seed(1234)

wordcloud(words = result$word, #적용시킬단어
          freq = result$feq, #빈도
          min.freq = 2, #최소단어빈도
          max.words = 200, #최대단어빈도(=표현할 단어 수)
          random.order = F, #고빈도 단어 중앙배치(F중앙배치, T랜덤)
          rot.per = 0.1, #단어 회전 비율
          scale = c(3, 0.3), #단어의크기(중앙, 끝)
          colors = color
          )
