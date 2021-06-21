#Latex Tables
#Power tables are included in the package depstats as datasets

library(depstats)

##################################################
##################################################
#Validation Set
Group = c('Linear','Diamond','Triangle','Crescent','Points','Expo-nential','Circles',
          'Cross','Wedge','Cubic','W-shape','Parabola','Two-parabola','Sine','Doppler',
          'Heavy-sine','Heart','Spiral','Taegeuk','Samtaegeuk')

latexpowers(ValidationPowers,Group)

##################################################
##################################################
#Additional Set
Group <- c('\\text{1A}','\\text{1B}',
           '\\text{2A}','\\text{2B}',
           '\\text{3A}','\\text{3B}',
           '\\text{4A}','\\text{4B}',
           '\\text{5A}','\\text{5B}',
           '\\text{6A}','\\text{6B}',
           '\\text{7A}','\\text{7B}')

latexpowers(AdditionalPowers,Group)

##################################################
##################################################
#Images
Group <- c('Image 1','Image 2','Image 3','Image 4')
latexpowers(ImagesPowers,Group)

##################################################
##################################################
#Scribbles
Group <- c('Scribble 1','Scribble 2','Scribble 3','Scribble 4','Scribble 5','Scribble 6')
latexpowers(ScribblesPowers,Group)

##################################################
##################################################
#Increasing Noise Set

Group = foreach(i=1:4, .combine='c') %do% {sprintf('Noise Level %s',i)}

D <- foreach(i=1:4, .combine='rbind') %do% {INCcircPowers[seq(i,24,4),]}
latexpowers(D,Group)

D <- foreach(i=1:4, .combine='rbind') %do% {INCcrossPowers[seq(i,24,4),]}
latexpowers(D,Group)

D <- foreach(i=1:4, .combine='rbind') %do% {INCsinePowers[seq(i,24,4),]}
latexpowers(D,Group)

D <- foreach(i=1:4, .combine='rbind') %do% {INCspiralPowers[seq(i,24,4),]}
latexpowers(D,Group)
