#Wedge

library(depstats)
library(tidyverse)
library(foreach)
library(fst)

sizes = c(30,50,100,200,300,400)

for(n in sizes){
  set.seed(n)
  cat('\n',n,'\n')
  X1 <- depgen(600,n,'normnoise(rotate(wedge.cv(n)),runif(1,2,4))',
               randrotate=FALSE)
  X2 <- depgen(200,n,'varnormnoise(rotate(wedge.cv(n)),\'1*x+2\')',
               randrotate=FALSE)
  X3 <- depgen(200,n,'varnormnoise(rotate(wedge.cv(n)),\'2-abs(1*x)\')',
               randrotate=FALSE)
  X <- rbind(X1,X2,X3)
  Xind <- sampleapply(X,c(n),1)
  write.fst(Xind %>% as.data.frame(), sprintf('VAL/dep9n%sSCORE.fst',n))
  Ximage <- sampleapply(X,c(n),0,grid=25)
  write.fst(Ximage %>% as.data.frame(), sprintf('VAL/dep9n%sIMAGE.fst',n))
}
