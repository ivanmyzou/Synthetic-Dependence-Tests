#Power Plots
#Power tables are included in the package depstats as datasets

library(depstats)

par(mfrow = c(1, 1))

##################################################
##################################################
#Validation Set
par(mfrow = c(2, 5),
    oma = c(5,4,0,0) + 0.75,
    mar = c(0,0,1,1) + 1.75)

depstructures <- c('Linear','Diamond','Triangle','Crescent','Points','Exponential','Circles',
                   'Cross','Wedge','Cubic','W-shape','Parabola','Two-parabola','Sine','Doppler',
                   'Heavy-sine','Heart','Spiral','Taegeuk','Samtaegeuk')

for(i in 1:10){
  plotpowers(ValidationPowers[(i-1)*6+1:6,],depstructures[i],showpowerdrop=FALSE)
}

for(i in 11:20){
  plotpowers(ValidationPowers[(i-1)*6+1:6,],depstructures[i],showpowerdrop=FALSE)
}

##################################################
##################################################
#Additional Set
par(mfrow = c(2, 4),
    oma = c(5,4,0,0) + 0.75,
    mar = c(0,0,1,1) + 1.75)

tags <- c('1A','1B','2A','2B','3A','3B','4A','4B','5A','5B','6A','6B','7A','7B')

for (i in 1:14){
  plotpowers(AdditionalPowers[(i-1)*6+1:6,],tags[i],showpowerdrop=FALSE)
}

##################################################
##################################################
#Images
par(mfrow = c(1, 4),
    oma = c(5,4,0,0) + 0.75,
    mar = c(0,0,1,1) + 1.75)

plotpowers(ImagesPowers[1:6*4-3,],'Image 1',showpowerdrop=FALSE)
plotpowers(ImagesPowers[1:6*4-2,],'Image 2',showpowerdrop=FALSE)
plotpowers(ImagesPowers[1:6*4-1,],'Image 3',showpowerdrop=FALSE)
plotpowers(ImagesPowers[1:6*4-0,],'Image 4',showpowerdrop=FALSE)

##################################################
##################################################
#Scribbles
par(mfrow = c(2, 3),
    oma = c(5,4,0,0) + 0.75,
    mar = c(0,0,1,1) + 1.75)

plotpowers(ScribblesPowers[1:6*6-5,],'Scribble 1',showpowerdrop=FALSE)
plotpowers(ScribblesPowers[1:6*6-4,],'Scribble 2',showpowerdrop=FALSE)
plotpowers(ScribblesPowers[1:6*6-3,],'Scribble 3',showpowerdrop=FALSE)
plotpowers(ScribblesPowers[1:6*6-2,],'Scribble 4',showpowerdrop=FALSE)
plotpowers(ScribblesPowers[1:6*6-1,],'Scribble 5',showpowerdrop=FALSE)
plotpowers(ScribblesPowers[1:6*6-0,],'Scribble 6',showpowerdrop=FALSE)

##################################################
##################################################
#Increasing Noise Set

par(mfrow = c(1, 4),
    oma = c(5,4,0,0) + 0.75,
    mar = c(0,0,1,1) + 1.75)

plotpowers(INCcircPowers[1+seq(0,20,4),],'Circles Noise Level 1',showpowerdrop=FALSE)
plotpowers(INCcircPowers[2+seq(0,20,4),],'Circles Noise Level 2',showpowerdrop=FALSE)
plotpowers(INCcircPowers[3+seq(0,20,4),],'Circles Noise Level 3',showpowerdrop=FALSE)
plotpowers(INCcircPowers[4+seq(0,20,4),],'Circles Noise Level 4',showpowerdrop=FALSE)


plotpowers(INCcrossPowers[1+seq(0,20,4),],'Cross Noise Level 1',showpowerdrop=FALSE)
plotpowers(INCcrossPowers[2+seq(0,20,4),],'Cross Noise Level 2',showpowerdrop=FALSE)
plotpowers(INCcrossPowers[3+seq(0,20,4),],'Cross Noise Level 3',showpowerdrop=FALSE)
plotpowers(INCcrossPowers[4+seq(0,20,4),],'Cross Noise Level 4',showpowerdrop=FALSE)


plotpowers(INCsinePowers[1+seq(0,20,4),],'Sine Noise Level 1',showpowerdrop=FALSE)
plotpowers(INCsinePowers[2+seq(0,20,4),],'Sine Noise Level 2',showpowerdrop=FALSE)
plotpowers(INCsinePowers[3+seq(0,20,4),],'Sine Noise Level 3',showpowerdrop=FALSE)
plotpowers(INCsinePowers[4+seq(0,20,4),],'Sine Noise Level 4',showpowerdrop=FALSE)


plotpowers(INCspiralPowers[1+seq(0,20,4),],'Spiral Noise Level 1',showpowerdrop=FALSE)
plotpowers(INCspiralPowers[2+seq(0,20,4),],'Spiral Noise Level 2',showpowerdrop=FALSE)
plotpowers(INCspiralPowers[3+seq(0,20,4),],'Spiral Noise Level 3',showpowerdrop=FALSE)
plotpowers(INCspiralPowers[4+seq(0,20,4),],'Spiral Noise Level 4',showpowerdrop=FALSE)

