#Threshold set independent sample

library(depstats)
library(progress)
library(fst)
library(dplyr)

sample_sizes <- c(30, 50, 100, 200, 300, 400)

#only generate samples for the remaining ones
sample_sizes_remain <- as.character(sample_sizes) %>% setdiff(list.dirs('./threshold/'))

for (sample_size in sample_sizes_remain) {
  cat('working on sample size', sample_size, '...\n')

  n <- as.integer(sample_size)

  set.seed(2*n)

  N <- 50000 #number of samples

  #generate independent samples
  X <- indgen(N,c(n))

  cat('working on dependence measures ...\n')
  Xind <- sampleapply(X,c(n),1) %>% as.data.frame()

  cat('working on images ...\n')
  Ximage <- sampleapply(X, c(n), 0, grid=25) %>% as.data.frame()

  cat('writing files ...\n')
  dir.create(paste0('./threshold/', sample_size)) #create folder

  write.fst(Xind, paste0('./threshold/', sample_size, '/', 'thres.fst'))
  write.fst(Ximage, paste0('./threshold/', sample_size, '/', 'thres_image.fst'))
}


