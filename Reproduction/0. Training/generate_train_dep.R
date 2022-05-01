#Training set dependent sample

library(depstats)
library(progress)
library(fst)
library(dplyr)

sample_sizes <- c(50, 100, 200, 400)


#only generate samples for the remaining ones
sample_sizes_remain <- as.character(sample_sizes) %>% setdiff(list.dirs('./depedent samples/', full.names = FALSE))

for (sample_size in sample_sizes_remain) {
  cat('working on sample size', sample_size, '...\n')

  n <- as.integer(sample_size)

  set.seed(n)

  #generate dependent samples
  X <- c() #will be 20000 samples
  ############################################################
  #Linear
  X1 <- depgen(600,n,'normnoise(randlin(n),runif(1,0,1))',
               randrotate=FALSE)
  X2 <- depgen(200,n,'varnormnoise(randlin(n),\'0.5*x\')',
               randrotate=FALSE)
  X3 <- depgen(200,n,'varnormnoise(randlin(n),\'0.5-abs(0.5*x)\')',
               randrotate=FALSE)
  X <- rbind(X,X1,X2,X3)
  ############################################################
  #Diamond
  X1 <- depgen(600,n,'normnoise(diam.cld(n,runif(1,pi/6,pi/3)),runif(1,0,0.25))',
               randrotate=FALSE)
  X2 <- depgen(200,n,'varnormnoise(diam.cld(n,runif(1,pi/6,pi/3)),\'0.2*x\')',
               randrotate=FALSE)
  X3 <- depgen(200,n,'varnormnoise(diam.cld(n,runif(1,pi/6,pi/3)),\'0.2-abs(0.2*x)\')',
               randrotate=FALSE)
  X <- rbind(X,X1,X2,X3)
  ############################################################
  #Triangle
  X1 <- depgen(600,n,'normnoise(tri.cld(n,runif(1,0,1),runif(1,0,1)),runif(1,0,0.5))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(tri.cld(n,runif(1,0,1),runif(1,0,1)),\'0.3*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(tri.cld(n,runif(1,0,1),runif(1,0,1)),\'0.3-abs(0.3*x)\')',
               randrotate=TRUE)
  X <- rbind(X,X1,X2,X3)
  #Crescent
  X1 <- depgen(600,n,'normnoise(cre.cld(n,runif(1,0.5,1)),runif(1,0,0.5))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(cre.cld(n,runif(1,0.5,1)),\'0.3*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(cre.cld(n,runif(1,0.5,1)),\'0.3-abs(0.3*x)\')',
               randrotate=TRUE)
  X <- rbind(X,X1,X2,X3)
  #Point Clouds
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
  X1 <- depgen(1000,n,'normnoise(pt.cld(n, pts[sample(c(1,2,3),1)][[1]] ),runif(1,0.05,0.5),TRUE)',
               randrotate=TRUE)
  X <- rbind(X,X1)
  #Exp
  X1 <- depgen(600,n,'normnoise(exp.cv(n,runif(1,2,4)),runif(1,0,0.5))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(exp.cv(n,runif(1,2,4)),\'0.3*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(exp.cv(n,runif(1,1.5,3)),\'0.3-abs(0.3*x)\')',
               randrotate=TRUE)
  X <- rbind(X,X1,X2,X3)
  #circular
  c1 <- matrix(c(0,0),ncol=2,byrow=TRUE)
  c2 <- matrix(c(1,0,
                 -1,0,
                 0,1),ncol=2,byrow=TRUE)
  c3 <- matrix(c(1,1,
                 -1,1,
                 1,-1,
                 -1,-1),ncol=2,byrow=TRUE)
  cs <- list(c1,c2,c3)
  X1 <- depgen(600,n,'normnoise(circ.cv(n, cs[sample(c(1,2,3),1)][[1]] ),runif(1,0,0.5))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(circ.cv(n, cs[sample(c(1,2,3),1)][[1]] ),\'0.3*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(circ.cv(n, cs[sample(c(1,2,3),1)][[1]] ),\'0.3-abs(0.3*x)\')',
               randrotate=TRUE)
  X <- rbind(X,X1,X2,X3)
  #Cross
  X1 <- depgen(600,n,'normnoise(rotate(cross.cv(n),runif(1,-pi/6,pi/6)),runif(1,0,0.5))',
               randrotate=FALSE)
  X2 <- depgen(200,n,'varnormnoise(rotate(cross.cv(n),runif(1,-pi/6,pi/6)),\'0.3*x\')',
               randrotate=FALSE)
  X3 <- depgen(200,n,'varnormnoise(rotate(cross.cv(n),runif(1,-pi/6,pi/6)),\'0.3-abs(0.3*x)\')',
               randrotate=FALSE)
  X <- rbind(X,X1,X2,X3)
  #wedge
  X1 <- depgen(600,n,'normnoise(wedge.cv(n),runif(1,0,1))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(wedge.cv(n),\'0.5*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(wedge.cv(n),\'0.5-abs(0.5*x)\')',
               randrotate=TRUE)
  X <- rbind(X,X1,X2,X3)
  #cubic
  X1 <- depgen(600,n,'normnoise(cubic.cv(n),runif(1,0,0.25))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(cubic.cv(n),\'0.2*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(cubic.cv(n),\'0.2-abs(0.2*x)\')',
               randrotate=TRUE)
  X <- rbind(X,X1,X2,X3)
  #w-shape
  X1 <- depgen(600,n,'normnoise(w.cv(n),runif(1,0,0.3))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(w.cv(n),\'0.2*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(w.cv(n),\'0.2-abs(0.2*x)\')',
               randrotate=TRUE)
  X <- rbind(X,X1,X2,X3)
  #parabola
  X1 <- depgen(600,n,'normnoise(parabola.cv(n),runif(1,0,0.3))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(parabola.cv(n),\'0.2*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(parabola.cv(n),\'0.2-abs(0.2*x)\')',
               randrotate=TRUE)
  X <- rbind(X,X1,X2,X3)
  #2-parabola
  X1 <- depgen(600,n,'normnoise(twoparabola.cv(n),runif(1,0,0.4))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(twoparabola.cv(n),\'0.3*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(twoparabola.cv(n),\'0.3-abs(0.3*x)\')',
               randrotate=TRUE)
  X <- rbind(X,X1,X2,X3)
  #sine
  X1 <- depgen(600,n,'normnoise(sine.cv(n,runif(1,1,4)),runif(1,0,1))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(sine.cv(n,runif(1,1,4)),\'0.5*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(sine.cv(n,runif(1,1,4)),\'0.5-abs(0.5*x)\')',
               randrotate=TRUE)
  X <- rbind(X,X1,X2,X3)
  #doppler
  X1 <- depgen(600,n,'normnoise(doppler.cv(n,runif(1,2,4)),runif(1,0,1))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(doppler.cv(n,runif(1,2,4)),\'0.5*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(doppler.cv(n,runif(1,2,4)),\'0.5-abs(0.5*x)\')',
               randrotate=TRUE)
  X <- rbind(X,X1,X2,X3)
  #heavy sine
  X1 <- depgen(600,n,'normnoise(heavysine.cv(n),runif(1,0,1))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(heavysine.cv(n),\'0.5*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(heavysine.cv(n),\'0.5-abs(0.5*x)\')',
               randrotate=TRUE)
  X <- rbind(X,X1,X2,X3)
  #heart
  X1 <- depgen(600,n,'normnoise(heart.cv(n),runif(1,0,0.5))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(heart.cv(n),\'0.3*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(heart.cv(n),\'0.3-abs(0.3*x)\')',
               randrotate=TRUE)
  X <- rbind(X,X1,X2,X3)
  #spiral
  X1 <- depgen(600,n,'normnoise(spiral.cv(n,runif(1,2.5,3.5)),runif(1,0,0.3))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(spiral.cv(n,runif(1,2.5,3.5)),\'0.2*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(spiral.cv(n,runif(1,2.5,3.5)),\'0.2-abs(0.2*x)\')',
               randrotate=TRUE)
  X <- rbind(X,X1,X2,X3)
  #taegeuk
  X1 <- depgen(600,n,'normnoise(taegeuk.cv(n),runif(1,0,0.3))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(taegeuk.cv(n),\'0.2*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(taegeuk.cv(n),\'0.2-abs(0.2*x)\')',
               randrotate=TRUE)
  X <- rbind(X,X1,X2,X3)
  #samtaegeuk
  X1 <- depgen(600,n,'normnoise(samtaegeuk.cv(n),runif(1,0,0.3))',
               randrotate=TRUE)
  X2 <- depgen(200,n,'varnormnoise(samtaegeuk.cv(n),\'0.2*x\')',
               randrotate=TRUE)
  X3 <- depgen(200,n,'varnormnoise(samtaegeuk.cv(n),\'0.2-abs(0.2*x)\')',
               randrotate=TRUE)
  X <- rbind(X,X1,X2,X3)

  cat('working on dependence measures ...\n')
  Xind <- sampleapply(X,c(n),1) %>% as.data.frame()

  cat('working on images ...\n')
  Ximage <- sampleapply(X, c(n), 0, grid=25) %>% as.data.frame()

  cat('writing files ...\n')
  dir.create(paste0('./depedent samples/', sample_size)) #create folder

  write.fst(Xind, paste0('./depedent samples/', sample_size, '/', 'dep.fst'))
  write.fst(Ximage, paste0('./depedent samples/', sample_size, '/', 'dep_image.fst'))
}
