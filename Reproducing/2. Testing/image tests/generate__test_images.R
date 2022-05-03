#image loader
library(depstats)
library(imager)
library(fst)
library(dplyr)

sizes = c(30,50,100,200,300,400)

##################################################
##################################################
set.seed(-101)
I1 <- load.image("I1.JPG") #infinity

for (n in sizes){
  cat('\n\n', n, '\n')
  XI1 <- depgen(1000,n,'normnoise(randimage(n,I1),runif(1,0,0.5))',
                randrotate=TRUE,print=TRUE)
  cat('\n\n', n, '\n')
  Xm <- sampleapply(XI1,c(n),1)
  write.fst(Xm %>% as.data.frame,sprintf('%simage1SCORE.fst',n))
  Xi <- sampleapply(XI1,c(n),0,grid=25)
  write.fst(Xi %>% as.data.frame,sprintf('%simage1IMAGE.fst',n))
}

##################################################
##################################################
set.seed(-102)
I2 <- load.image("I2.JPG") #pi

for (n in sizes){
  cat('\n\n', n, '\n')
  XI2 <- depgen(1000,n,'normnoise(randimage(n,I2),runif(1,0,0.5))',
                randrotate=TRUE,print=TRUE)
  cat('\n\n', n, '\n')
  Xm <- sampleapply(XI2,c(n),1)
  write.fst(Xm %>% as.data.frame,sprintf('%simage2SCORE.fst',n))
  Xi <- sampleapply(XI2,c(n),0,grid=25)
  write.fst(Xi %>% as.data.frame,sprintf('%simage2IMAGE.fst',n))
}

##################################################
##################################################
set.seed(-103)
I3 <- load.image("I3.JPG") #dog

for (n in sizes){
  cat('\n\n', n, '\n')
  XI3 <- depgen(1000,n,'normnoise(randimage(n,I3),runif(1,0,0.5))',
                randrotate=TRUE,print=TRUE)
  cat('\n\n', n, '\n')
  Xm <- sampleapply(XI3,c(n),1)
  write.fst(Xm %>% as.data.frame,sprintf('%simage3SCORE.fst',n))
  Xi <- sampleapply(XI3,c(n),0,grid=25)
  write.fst(Xi %>% as.data.frame,sprintf('%simage3IMAGE.fst',n))
}

##################################################
##################################################
set.seed(-104)
I4 <- load.image("I4.JPG") #cat

for (n in sizes){
  cat('\n\n', n, '\n')
  XI4 <- depgen(1000,n,'normnoise(randimage(n,I4),runif(1,0,0.5))',
                randrotate=TRUE,print=TRUE)
  cat('\n\n', n, '\n')
  Xm <- sampleapply(XI4,c(n),1)
  write.fst(Xm %>% as.data.frame,sprintf('%simage4SCORE.fst',n))
  Xi <- sampleapply(XI4,c(n),0,grid=25)
  write.fst(Xi %>% as.data.frame,sprintf('%simage4IMAGE.fst',n))
}
