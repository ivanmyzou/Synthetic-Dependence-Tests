#Diamond

library(depstats)
library(tidyverse)
library(foreach)
library(fst)

sizes = c(30,50,100,200,300,400)

for(n in sizes){
  set.seed(n)
  cat('\n',n,'\n')
  X1 <- depgen(600,n,'normnoise(diam.cld(n,runif(1,pi/6,pi/3)),runif(1,0,0.5))',
               randrotate=FALSE)
  X2 <- depgen(200,n,'varnormnoise(diam.cld(n,runif(1,pi/6,pi/3)),\'0.25*x+0.25\')',
               randrotate=FALSE)
  X3 <- depgen(200,n,'varnormnoise(diam.cld(n,runif(1,pi/6,pi/3)),\'0.5-abs(0.25*x)\')',
               randrotate=FALSE)
  X <- rbind(X1,X2,X3)
  Xind <- sampleapply(X,c(n),1)
  write.fst(Xind %>% as.data.frame(), sprintf('VAL/dep2n%sSCORE.fst',n))
  Ximage <- sampleapply(X,c(n),0,grid=25)
  write.fst(Ximage %>% as.data.frame(), sprintf('VAL/dep2n%sIMAGE.fst',n))
}

