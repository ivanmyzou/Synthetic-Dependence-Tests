
library(dplyr)
library(foreach)
library(data.table)
library(depstats)

defaultcol = c('combined','score','image',
               'ACE','AUK','Blom','dcor','Hell','Hoeff','HSIC',
               'Info','Ken','Martdiff','MIC','Rand','Spear',
               'ddrV','ddrTS2','hhgPs','hhgGs','hhgPm','hhgGm',
               "avgPower","bestPower","avgGap","worstGap",
               "combined gap","score gap","image gap")

##################################################

powers <- readRDS('5. Powers/dep_powers.RDS') %>% as.data.table

Group <- c("Linear", "Diamond", "Triangle", "Crescent", "Points", "Expo-nential",
           "Circles", "Cross", "Wedge", "Cubic", "W-shape", "Parabola", "Two-parabola",
           "Sine", "Doppler", "Heavy-sine", "Heart", "Spiral", "Taegeuk", "Sam-taegeuk")

Powers <- foreach(i = 1:20, .combine = 'rbind') %do% {powers[scenario == i, 1:22]} %>% as.matrix

colnames(Powers) <- defaultcol[1:22]

latexpowers(Powers, Group)

##################################################

powers <- readRDS('5. Powers/add_powers.RDS') %>% as.data.table

Group <- paste0(rep(1:7, each = 2), c('A', 'B'))

Powers <- foreach(i = 1:14, .combine = 'rbind') %do% {powers[scenario == i, 1:22]} %>% as.matrix

colnames(Powers) <- defaultcol[1:22]

latexpowers(Powers, Group)

##################################################
#image

powers <- readRDS('5. Powers/image_powers.RDS') %>% as.data.table

Group <- paste0('Image ', 1:4)

Powers <- foreach(i = 1:4, .combine = 'rbind') %do% {powers[scenario == i, 1:22]} %>% as.matrix

colnames(Powers) <- defaultcol[1:22]

latexpowers(Powers, Group)

##################################################
#scribble

powers <- readRDS('5. Powers/scribble_powers.RDS') %>% as.data.table

Group <- paste0('Scribble ', 1:6)

Powers <- foreach(i = 1:6, .combine = 'rbind') %do% {powers[scenario == i, 1:22]} %>% as.matrix

colnames(Powers) <- defaultcol[1:22]

latexpowers(Powers, Group)


##################################################
#INC

powers <- readRDS('5. Powers/increasingnoise_powers.RDS')

#Circles
Group <- paste0('Noise Level ', 1:4)
Powers <- foreach(i = 1:4, .combine = 'rbind') %do% {powers[scenario == i, 1:22]} %>% as.matrix
colnames(Powers) <- defaultcol[1:22]
latexpowers(Powers, Group)

#Cross
Group <- paste0('Noise Level ', 1:4)
Powers <- foreach(i = 1:4, .combine = 'rbind') %do% {powers[scenario == i + 4, 1:22]} %>% as.matrix
colnames(Powers) <- defaultcol[1:22]
latexpowers(Powers, Group)

#Sine
Group <- paste0('Noise Level ', 1:4)
Powers <- foreach(i = 1:4, .combine = 'rbind') %do% {powers[scenario == i + 8, 1:22]} %>% as.matrix
colnames(Powers) <- defaultcol[1:22]
latexpowers(Powers, Group)

#Spiral
Group <- paste0('Noise Level ', 1:4)
Powers <- foreach(i = 1:4, .combine = 'rbind') %do% {powers[scenario == i + 12, 1:22]} %>% as.matrix
colnames(Powers) <- defaultcol[1:22]
latexpowers(Powers, Group)



