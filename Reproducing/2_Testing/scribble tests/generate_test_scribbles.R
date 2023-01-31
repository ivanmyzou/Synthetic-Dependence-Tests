#scribbles
library(depstats)
library(imager)
library(fst)
library(dplyr)

sizes = c(30,50,100,200,300,400)

##################################################
##################################################
set.seed(-101)
I1 <- load.image("S1.JPG")

for (n in sizes){
  cat('\n\n', n, '\n')
  XI1 <- depgen(1000,n,'normnoise(randimage(n,I1),runif(1,0,0.5))',
                randrotate=TRUE,print=TRUE)
  cat('\n\n', n, '\n')
  Xm <- sampleapply(XI1,c(n),1)
  write.fst(Xm %>% as.data.frame,sprintf('%sscribble1SCORE.fst',n))
  Xi <- sampleapply(XI1,c(n),0,grid=25)
  write.fst(Xi %>% as.data.frame,sprintf('%sscribble1IMAGE.fst',n))
}

##################################################
##################################################
set.seed(-102)
I2 <- load.image("S2.JPG")

for (n in sizes){
  cat('\n\n', n, '\n')
  XI2 <- depgen(1000,n,'normnoise(randimage(n,I2),runif(1,0,0.5))',
                randrotate=TRUE,print=TRUE)
  cat('\n\n', n, '\n')
  Xm <- sampleapply(XI2,c(n),1)
  write.fst(Xm %>% as.data.frame,sprintf('%sscribble2SCORE.fst',n))
  Xi <- sampleapply(XI2,c(n),0,grid=25)
  write.fst(Xi %>% as.data.frame,sprintf('%sscribble2IMAGE.fst',n))
}

##################################################
##################################################
set.seed(-103)
I3 <- load.image("S3.JPG")

for (n in sizes){
  cat('\n\n', n, '\n')
  XI3 <- depgen(1000,n,'normnoise(randimage(n,I3),runif(1,0,0.5))',
                randrotate=TRUE,print=TRUE)
  cat('\n\n', n, '\n')
  Xm <- sampleapply(XI3,c(n),1)
  write.fst(Xm %>% as.data.frame,sprintf('%sscribble3SCORE.fst',n))
  Xi <- sampleapply(XI3,c(n),0,grid=25)
  write.fst(Xi %>% as.data.frame,sprintf('%sscribble3IMAGE.fst',n))
}

##################################################
##################################################
set.seed(-104)
I4 <- load.image("S4.JPG")

for (n in sizes){
  cat('\n\n', n, '\n')
  XI4 <- depgen(1000,n,'normnoise(randimage(n,I4),runif(1,0,0.5))',
                randrotate=TRUE,print=TRUE)
  cat('\n\n', n, '\n')
  Xm <- sampleapply(XI4,c(n),1)
  write.fst(Xm %>% as.data.frame,sprintf('%sscribble4SCORE.fst',n))
  Xi <- sampleapply(XI4,c(n),0,grid=25)
  write.fst(Xi %>% as.data.frame,sprintf('%sscribble4IMAGE.fst',n))
}

##################################################
##################################################
set.seed(-105)
I5 <- load.image("S5.JPG")

for (n in sizes){
  cat('\n\n', n, '\n')
  XI5 <- depgen(1000,n,'normnoise(randimage(n,I5),runif(1,0,0.5))',
                randrotate=TRUE,print=TRUE)
  cat('\n\n', n, '\n')
  Xm <- sampleapply(XI5,c(n),1)
  write.fst(Xm %>% as.data.frame,sprintf('%sscribble5SCORE.fst',n))
  Xi <- sampleapply(XI5,c(n),0,grid=25)
  write.fst(Xi %>% as.data.frame,sprintf('%sscribble5IMAGE.fst',n))
}

##################################################
##################################################
set.seed(-106)
I6 <- load.image("S6.JPG")

for (n in sizes){
  cat('\n\n', n, '\n')
  XI6 <- depgen(1000,n,'normnoise(randimage(n,I6),runif(1,0,0.5))',
                randrotate=TRUE,print=TRUE)
  cat('\n\n', n, '\n')
  Xm <- sampleapply(XI6,c(n),1)
  write.fst(Xm %>% as.data.frame,sprintf('%sscribble6SCORE.fst',n))
  Xi <- sampleapply(XI6,c(n),0,grid=25)
  write.fst(Xi %>% as.data.frame,sprintf('%sscribble6IMAGE.fst',n))
}
