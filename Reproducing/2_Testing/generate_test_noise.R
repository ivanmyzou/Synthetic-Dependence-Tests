#Training set dependent sample

library(depstats)
library(progress)
library(fst)
library(dplyr)

sample_sizes <- c(30, 50, 100, 200, 300, 400)

randpts <- function(){
  n <- sample(1:5,1)
  output <- matrix(runif(2*n,-2,2), byrow = TRUE, ncol = 2)
  return(output)
}

#only generate samples for the remaining ones
sample_sizes_remain <- as.character(sample_sizes) %>% setdiff(list.dirs('./noise tests/', full.names = FALSE))

for (sample_size in sample_sizes_remain) {

  X <- c()

  cat('working on sample size', sample_size, '...\n')

  n <- as.integer(sample_size)

  set.seed(-1)

  X1 <- depgen(1000,n,'normnoise(circ.cv(n,randpts()),0.25)',
               randrotate=FALSE)
  X2 <- depgen(1000,n,'normnoise(circ.cv(n,randpts()),0.5)',
               randrotate=FALSE)
  X3 <- depgen(1000,n,'normnoise(circ.cv(n,randpts()),0.75)',
               randrotate=FALSE)
  X4 <- depgen(1000,n,'normnoise(circ.cv(n,randpts()),1)',
               randrotate=FALSE)
  X <- rbind(X,X1,X2,X3,X4)

  X1 <- depgen(1000,n,'normnoise(rotate(cross.cv(n),runif(1,0,pi/6)),0.25)',
               randrotate=FALSE)
  X2 <- depgen(1000,n,'normnoise(rotate(cross.cv(n),runif(1,0,pi/6)),0.5)',
               randrotate=FALSE)
  X3 <- depgen(1000,n,'normnoise(rotate(cross.cv(n),runif(1,0,pi/6)),0.75)',
               randrotate=FALSE)
  X4 <- depgen(1000,n,'normnoise(rotate(cross.cv(n),runif(1,0,pi/6)),1)',
               randrotate=FALSE)
  X <- rbind(X,X1,X2,X3,X4)

  X1 <- depgen(1000,n,'normnoise(sine.cv(n,runif(1,1,4)),0.25)',
               randrotate=FALSE)
  X2 <- depgen(1000,n,'normnoise(sine.cv(n,runif(1,1,4)),0.5)',
               randrotate=FALSE)
  X3 <- depgen(1000,n,'normnoise(sine.cv(n,runif(1,1,4)),0.75)',
               randrotate=FALSE)
  X4 <- depgen(1000,n,'normnoise(sine.cv(n,runif(1,1,4)),1)',
               randrotate=FALSE)
  X <- rbind(X,X1,X2,X3,X4)

  X1 <- depgen(1000,n,'normnoise(spiral.cv(n,runif(1,2,4)),0.25)',
               randrotate=FALSE)
  X2 <- depgen(1000,n,'normnoise(spiral.cv(n,runif(1,2,4)),0.5)',
               randrotate=FALSE)
  X3 <- depgen(1000,n,'normnoise(spiral.cv(n,runif(1,2,4)),0.75)',
               randrotate=FALSE)
  X4 <- depgen(1000,n,'normnoise(spiral.cv(n,runif(1,2,4)),1)',
               randrotate=FALSE)
  X <- rbind(X,X1,X2,X3,X4)

  cat('working on dependence measures ...\n')
  Xind <- sampleapply(X,c(n),1) %>% as.data.frame()

  cat('working on images ...\n')
  Ximage <- sampleapply(X, c(n), 0, grid=25) %>% as.data.frame()

  cat('writing files ...\n')
  dir.create(paste0('./noise tests/', sample_size)) #create folder

  write.fst(Xind, paste0('./noise tests/', sample_size, '/', 'noise.fst'))
  write.fst(Ximage, paste0('./noise tests/', sample_size, '/', 'noise_image.fst'))
}
