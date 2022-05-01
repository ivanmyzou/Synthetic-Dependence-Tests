#Linear

library(depstats)
library(tidyverse)
library(foreach)
library(fst)

sizes = c(30,50,100,200,300,400)

for(n in sizes){
  set.seed(n)
  cat('\n',n,'\n')
  X1 <- depgen(600,n,'normnoise(randlin(n),runif(1,0,2))',
               randrotate=FALSE)
  X2 <- depgen(200,n,'varnormnoise(randlin(n),\'0.75*x+0.75\')',
               randrotate=FALSE)
  X3 <- depgen(200,n,'varnormnoise(randlin(n),\'1.5-abs(0.75*x)\')',
               randrotate=FALSE)
  X <- rbind(X1,X2,X3)
  Xind <- sampleapply(X,c(n),1)
  write.fst(Xind %>% as.data.frame(), sprintf('VAL/dep1n%sSCORE.fst',n))
  Ximage <- sampleapply(X,c(n),0,grid=25)
  write.fst(Ximage %>% as.data.frame(), sprintf('VAL/dep1n%sIMAGE.fst',n))
}


