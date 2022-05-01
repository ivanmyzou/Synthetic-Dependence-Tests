#Circ

library(depstats)
library(tidyverse)
library(foreach)
library(fst)

sizes = c(30,50,100,200,300,400)

for(n in sizes){
  set.seed(n)
  cat('\n',n,'\n')
  c1 <- matrix(c(0,0),ncol=2,byrow=TRUE)
  c2 <- matrix(c(1,0,
                 -1,0,
                 0,1),ncol=2,byrow=TRUE)
  c3 <- matrix(c(1,1,
                 -1,1,
                 1,-1,
                 -1,-1),ncol=2,byrow=TRUE)
  cs <- list(c1,c2,c3)
  X1 <- depgen(600,n,'normnoise(circ.cv(n, cs[sample(c(1,2,3),1)][[1]] ),runif(1,0,1))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(circ.cv(n, cs[sample(c(1,2,3),1)][[1]] ),\'0.5*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(circ.cv(n, cs[sample(c(1,2,3),1)][[1]] ),\'0.5-abs(0.5*x)\')',
               randrotate=TRUE)
  X <- rbind(X1,X2,X3)
  Xind <- sampleapply(X,c(n),1)
  write.fst(Xind %>% as.data.frame(), sprintf('VAL/dep7n%sSCORE.fst',n))
  Ximage <- sampleapply(X,c(n),0,grid=25)
  write.fst(Ximage %>% as.data.frame(), sprintf('VAL/dep7n%sIMAGE.fst',n))
}
