#consolidation of data

library(fst)
library(dplyr)
library(progress)

sample_sizes <- c(30, 50, 100, 200, 300, 400)

for (n in sample_sizes){ #creates folders
  dir.create(as.character(n))
}

set.seed(0)

pb <- progress_bar$new(total = 6)

for (n in sample_sizes){
  pb$tick()
  d <- foreach(i=1:20, .combine = 'rbind') %do% {
    scores <- sprintf('VAL/dep%sn%sSCORE.fst', i, n) %>% read.fst()
    images <- sprintf('VAL/dep%sn%sIMAGE.fst', i, n) %>% read.fst()
    cbind(scores, n, images)
  }
  d %>% write.fst(sprintf('%s/deptest.fst', n))
}
