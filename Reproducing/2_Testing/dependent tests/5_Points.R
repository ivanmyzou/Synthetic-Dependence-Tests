#Points

library(depstats)
library(tidyverse)
library(foreach)
library(fst)

sizes = c(30,50,100,200,300,400)

for(n in sizes){
  set.seed(n)
  cat('\n',n,'\n')
  pts1 <- matrix(c(1,0,
                   -1,0,
                   0,1),ncol=2,byrow=TRUE)
  pts2 <- matrix(c(1,0,
                   -1,0,
                   0,0,
                   0,1,
                   0,-1),ncol=2,byrow=TRUE)
  pts3 <- matrix(c(1,1,
                   -1,1,
                   0,0,
                   1,-1,
                   -1,-1),ncol=2,byrow=TRUE)
  pts <- list(pts1,pts2,pts3)
  X <- depgen(1000,n,'normnoise(pt.cld(n, pts[sample(c(1,2,3),1)][[1]] ), runif(1,0.05,0.5),TRUE)',
              randrotate=TRUE)
  Xind <- sampleapply(X,c(n),1)
  write.fst(Xind %>% as.data.frame(), sprintf('VAL/dep5n%sSCORE.fst',n))
  Ximage <- sampleapply(X,c(n),0,grid=25)
  write.fst(Ximage %>% as.data.frame(), sprintf('VAL/dep5n%sIMAGE.fst',n))
}



