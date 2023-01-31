
library(depstats)
library(progress)
library(fst)
library(dplyr)
#Additional Tests
#Dependence Structures from Recent Papers

##1
#Correlated Gaussian
t1 <- function(n,rho=0.5){
  x <- rnorm(n,0,1)
  y <- rho*x + (1-rho)*rnorm(n,0,1)
  X <- cbind(x,y)
  return(X)
}
##2
#Quantile of t distribution with df=1
t2 <- function(n,rho=0.5){
  xs <- rnorm(n,0,1)
  ys <- rho*xs + (1-rho)*rnorm(n,0,1)
  x <- qt(pnorm(xs), df=1)
  y <- qt(pnorm(ys), df=1)
  nx <- length(x[x == Inf])
  x[x == Inf] <- abs(rnorm(nx,50,1))
  nx <- length(x[x == -Inf])
  x[x == -Inf] <- -abs(rnorm(nx,50,1))
  ny <- length(y[y == Inf])
  y[y == Inf] <- abs(rnorm(ny,50,1))
  ny <- length(y[y == -Inf])
  y[y == -Inf] <- -abs(rnorm(ny,50,1))
  X <- cbind(x,y)
  return(X)
}
##3
#Correlated Laplace
t3 <- function(n,rho){
  X <- LaplacesDemon::rmvl(n, c(0,0),
                           matrix(c(1,rho,
                                    rho,1),nrow=2,byrow=TRUE))
  return(X)
}
##4
#tanh
t4 <- function(n){
  x <- rnorm(n,0,1)
  y <- tanh(x)
  X <- cbind(x,y)
  return(X)
}
##5
#Ishigami Style
t5 <- function(n){
  U <- runif(n)
  V <- runif(n)
  W <- runif(n)
  x <- U
  y <- sin(U) + 4*sin(V)^2 + 0.5*W^4*sin(U)
  X <- cbind(x,y)
  return(X)
}
##6
#Tree Ring
t6 <- function(n,sigma=0.1,rings=10){
  L <- sample(1:rings,n,replace=TRUE)
  theta <- runif(n,0,2*pi)
  epsilonx <- rnorm(n,0,sigma)
  epsilony <- rnorm(n,0,sigma)
  x <- L*cos(theta) + epsilonx/4
  y <- L*sin(theta) + epsilony/4
  X <- cbind(x,y)
  return(X)
}
##7
#Change in variance
t7 <- function(n,p){
  x <- runif(n)
  e <- rnorm(n)
  y <- abs(x)^p * e
  X <- cbind(x,y)
  return(X)
}

sample_sizes <- c(30, 50, 100, 200, 300, 400)

#only generate samples for the remaining ones
sample_sizes_remain <- as.character(sample_sizes) %>% setdiff(list.dirs('./additional tests/'))

for (sample_size in sample_sizes_remain) {
  cat('working on sample size', sample_size, '...\n')

  n <- as.integer(sample_size)

  set.seed(10*n)

  #generate additional test samples
  X <- c()
  set.seed(n/1000)
  X1 <- depgen(1000,n,'t1(n,runif(1,0.1,0.2))',
               randrotate=FALSE)
  X2 <- depgen(1000,n,'t1(n,runif(1,0.2,0.3))',
               randrotate=FALSE)
  X <- rbind(X,X1,X2)
  X1 <- depgen(1000,n,'t2(n,runif(1,0.1,0.2))',
               randrotate=FALSE)
  X2 <- depgen(1000,n,'t2(n,runif(1,0.2,0.3))',
               randrotate=FALSE)
  X <- rbind(X,X1,X2)
  X1 <- depgen(1000,n,'t3(n,runif(1,0.05,0.1))',
               randrotate=FALSE)
  X2 <- depgen(1000,n,'t3(n,runif(1,0.1,0.2))',
               randrotate=FALSE)
  X <- rbind(X,X1,X2)
  X1 <- depgen(1000,n,'normnoise(t4(n),runif(1,2,3))',
               randrotate=FALSE)
  X2 <- depgen(1000,n,'normnoise(t4(n),runif(1,3,4))',
               randrotate=FALSE)
  X <- rbind(X,X1,X2)
  X1 <- depgen(1000,n,'normnoise(t5(n),runif(1,0.25,0.5))',
               randrotate=FALSE)
  X2 <- depgen(1000,n,'normnoise(t5(n),runif(1,0.5,0.75))',
               randrotate=FALSE)
  X <- rbind(X,X1,X2)
  X1 <- depgen(1000,n,'t6(n,runif(1,0,0.5),sample(2:10,1))',
               randrotate=FALSE)
  X2 <- depgen(1000,n,'t6(n,runif(1,0,1),sample(2:10,1))',
               randrotate=FALSE)
  X <- rbind(X,X1,X2)
  X1 <- depgen(1000,n,'t7(n,runif(1,0.2,0.3))',
               randrotate=FALSE)
  X2 <- depgen(1000,n,'t7(n,runif(1,0.1,0.2))',
               randrotate=FALSE)
  X <- rbind(X,X1,X2)

  cat('working on dependence measures ...\n')
  Xind <- sampleapply(X,c(n),1) %>% as.data.frame()

  cat('working on images ...\n')
  Ximage <- sampleapply(X, c(n), 0, grid=25) %>% as.data.frame()

  cat('writing files ...\n')
  dir.create(paste0('./additional tests/', sample_size)) #create folder

  write.fst(Xind, paste0('./additional tests/', sample_size, '/', 'add.fst'))
  write.fst(Ximage, paste0('./additional tests/', sample_size, '/', 'add_image.fst'))
}


