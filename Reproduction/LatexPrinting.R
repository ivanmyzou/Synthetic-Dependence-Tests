#Latex Printing

library(depstats)

#####
PowersSummary <- powerssummary(depPowers)

Linear <- PowersSummary[1+c(0,20,40,60,80,100),]
title = 'Linear'
latexpowers(Linear,title,decimals=4)

Diamond <- PowersSummary[2+c(0,20,40,60,80,100),]
title = 'Diamond'
latexpowers(Diamond,title,decimals=4)

Triangle <- PowersSummary[3+c(0,20,40,60,80,100),]
title = 'Triangle'
latexpowers(Triangle,title,decimals=4)

Crescent <- PowersSummary[4+c(0,20,40,60,80,100),]
title = 'Crescent'
latexpowers(Crescent,title,decimals=4)

Pts <- PowersSummary[5+c(0,20,40,60,80,100),]
title = 'Points'
latexpowers(Pts,title,decimals=4)

Exp <- PowersSummary[6+c(0,20,40,60,80,100),]
title = 'Exponential'
latexpowers(Exp,title,decimals=4)

Circles <- PowersSummary[7+c(0,20,40,60,80,100),]
title = 'Circles'
latexpowers(Circles,title,decimals=4)

Cross <- PowersSummary[8+c(0,20,40,60,80,100),]
title = 'Cross'
latexpowers(Cross,title,decimals=4)

Wedge <- PowersSummary[9+c(0,20,40,60,80,100),]
title = 'Wedge'
latexpowers(Wedge,title,decimals=4)

Cubic <- PowersSummary[10+c(0,20,40,60,80,100),]
title = 'Cubic'
latexpowers(Cubic,title,decimals=4)

W <- PowersSummary[11+c(0,20,40,60,80,100),]
title = 'W-shape'
latexpowers(W,title,decimals=4)

Parabola <- PowersSummary[12+c(0,20,40,60,80,100),]
title = 'Parabola'
latexpowers(Parabola,title,decimals=4)

TwoParabola <- PowersSummary[13+c(0,20,40,60,80,100),]
title = 'Two-parabola'
latexpowers(TwoParabola,title,decimals=4)

Sine <- PowersSummary[14+c(0,20,40,60,80,100),]
title = 'Sine'
latexpowers(Sine,title,decimals=4)

Doppler <- PowersSummary[15+c(0,20,40,60,80,100),]
title = 'Doppler'
latexpowers(Doppler,title,decimals=4)

Hsine <- PowersSummary[16+c(0,20,40,60,80,100),]
title = 'Heavy-sine'
latexpowers(Hsine,title,decimals=4)

Heart <- PowersSummary[17+c(0,20,40,60,80,100),]
title = 'Heart'
latexpowers(Heart,title,decimals=4)

Spiral <- PowersSummary[18+c(0,20,40,60,80,100),]
title = 'Spiral'
latexpowers(Spiral,title,decimals=4)

Taegeuk <- PowersSummary[19+c(0,20,40,60,80,100),]
title = 'Taegeuk'
latexpowers(Taegeuk,title,decimals=4)

Samtaegeuk <- PowersSummary[20+c(0,20,40,60,80,100),]
title = 'Samtaegeuk'
latexpowers(Samtaegeuk,title,decimals=4)

#####
PowersSummary <- powerssummary(IPowers)

I1 <- PowersSummary[1+c(0,4,8,12,16,20),]
title = 'Image 1'
latexpowers(I1,title,decimals=4)

I2 <- PowersSummary[2+c(0,4,8,12,16,20),]
title = 'Image 2'
latexpowers(I2,title,decimals=4)

I3 <- PowersSummary[3+c(0,4,8,12,16,20),]
title = 'Image 3'
latexpowers(I3,title,decimals=4)

I4 <- PowersSummary[4+c(0,4,8,12,16,20),]
title = 'Image 4'
latexpowers(I4,title,decimals=4)

#####
PowersSummary <- powerssummary(SPowers)

S1 <- PowersSummary[1+c(0,6,12,18,24,30),]
title = 'Scribble 1'
latexpowers(S1,title,decimals=4)

S2 <- PowersSummary[2+c(0,6,12,18,24,30),]
title = 'Scribble 2'
latexpowers(S2,title,decimals=4)

S3 <- PowersSummary[3+c(0,6,12,18,24,30),]
title = 'Scribble 3'
latexpowers(S3,title,decimals=4)

S4 <- PowersSummary[4+c(0,6,12,18,24,30),]
title = 'Scribble 4'
latexpowers(S4,title,decimals=4)

S5 <- PowersSummary[5+c(0,6,12,18,24,30),]
title = 'Scribble 5'
latexpowers(S5,title,decimals=4)

S6 <- PowersSummary[6+c(0,6,12,18,24,30),]
title = 'Scribble 6'
latexpowers(S6,title,decimals=4)


#####
PowersSummary <- powerssummary(addPowers)

add1 <- PowersSummary[1+seq(0,65,11),]
title = '1A'
latexpowers(add1,title,decimals=4)

add2 <- PowersSummary[2+seq(0,65,11),]
title = '1B'
latexpowers(add2,title,decimals=4)

add3 <- PowersSummary[3+seq(0,65,11),]
title = '2A'
latexpowers(add3,title,decimals=4)

add4 <- PowersSummary[4+seq(0,65,11),]
title = '2B'
latexpowers(add4,title,decimals=4)


add5 <- PowersSummary[5+seq(0,65,11),]
title = '3A'
latexpowers(add5,title,decimals=4)

add6 <- PowersSummary[6+seq(0,65,11),]
title = '3B'
latexpowers(add6,title,decimals=4)


add7 <- PowersSummary[7+seq(0,65,11),]
title = '4A'
latexpowers(add7,title,decimals=4)

add8 <- PowersSummary[8+seq(0,65,11),]
title = '4B'
latexpowers(add8,title,decimals=4)


add9 <- PowersSummary[9+seq(0,65,11),]
title = '5'
latexpowers(add9,title,decimals=4)

add10 <- PowersSummary[10+seq(0,65,11),]
title = '6'
latexpowers(add10,title,decimals=4)

add11 <- PowersSummary[11+seq(0,65,11),]
title = '7'
latexpowers(add11,title,decimals=4)


##relevant
#2A 30 50 100
#3A 30 50 100
#4B 30 50
#5 30 50 100
#6 30 50 100 200
#7 30 50 100

#using rownames instead

ADD1 <- PowersSummary[c('Add2An30','Add2An50','Add2An100',
                        'Add3An30','Add3An50','Add3An100',
                        'Add4Bn30','Add4Bn50'),]
R <- c('n = 30','n = 50','n = 100',
       'n = 30','n = 50','n = 100',
       'n = 30','n = 50')
title = ' '
latexpowers(ADD1,title,rows=R,decimals=4)


ADD2 <- PowersSummary[c('Add5n30','Add5n50','Add5n100',
                        'Add6n30','Add6n50','Add6n100','Add6n100',
                        'Add7n30','Add7n50','Add7n100'),]
R <- c('n = 30','n = 50','n = 100',
       'n = 30','n = 50','n = 100','n = 200',
       'n = 30','n = 50','n = 100')
title = ' '
latexpowers(ADD2,title,rows=R,decimals=4)



#####
PowersSummary <- powerssummary(INCPowers)

circ1 <- PowersSummary[c(1+0:4,1+25:29),]
title = 'Circle (Increasing Noise) n = 30, 50'
row = c('n=30, l=1','n=30, l=2','n=30, l=3','n=30, l=4','n=30, l=5',
        'n=50, l=1','n=50, l=2','n=50, l=3','n=50, l=4','n=50, l=5')
latexpowers(circ1,title,rows=row,decimals=4)

circ2 <- PowersSummary[c(1+50:54,1+75:79),]
title = 'Circle (Increasing Noise) n = 100, 200'
row = c('n=100, l=1','n=100, l=2','n=100, l=3','n=100, l=4','n=100, l=5',
        'n=200, l=1','n=200, l=2','n=200, l=3','n=200, l=4','n=200, l=5')
latexpowers(circ2,title,rows=row,decimals=4)

circ3 <- PowersSummary[c(1+100:104,1+125:129),]
title = 'Circle (Increasing Noise) n = 300, 400'
row = c('n=300, l=1','n=300, l=2','n=300, l=3','n=300, l=4','n=300, l=5',
        'n=400, l=1','n=400, l=2','n=400, l=3','n=400, l=4','n=400, l=5')
latexpowers(circ3,title,rows=row,decimals=4)


cross1 <- PowersSummary[c(6+0:4,6+25:29),]
title = 'Cross (Increasing Noise) n = 30, 50'
row = c('n=30, l=1','n=30, l=2','n=30, l=3','n=30, l=4','n=30, l=5',
        'n=50, l=1','n=50, l=2','n=50, l=3','n=50, l=4','n=50, l=5')
latexpowers(cross1,title,rows=row,decimals=4)

cross2 <- PowersSummary[c(6+50:54,6+75:79),]
title = 'Cross (Increasing Noise) n = 100, 200'
row = c('n=100, l=1','n=100, l=2','n=100, l=3','n=100, l=4','n=100, l=5',
        'n=200, l=1','n=200, l=2','n=200, l=3','n=200, l=4','n=200, l=5')
latexpowers(cross2,title,rows=row,decimals=4)

cross3 <- PowersSummary[c(6+100:104,6+125:129),]
title = 'Cross (Increasing Noise) n = 300, 400'
row = c('n=300, l=1','n=300, l=2','n=300, l=3','n=300, l=4','n=300, l=5',
        'n=400, l=1','n=400, l=2','n=400, l=3','n=400, l=4','n=400, l=5')
latexpowers(cross3,title,rows=row,decimals=4)


pts1 <- PowersSummary[c(11+0:4,11+25:29),]
title = 'Points (Increasing Noise) n = 30, 50'
row = c('n=30, l=1','n=30, l=2','n=30, l=3','n=30, l=4','n=30, l=5',
        'n=50, l=1','n=50, l=2','n=50, l=3','n=50, l=4','n=50, l=5')
latexpowers(pts1,title,rows=row,decimals=4)

pts2 <- PowersSummary[c(11+50:54,11+75:79),]
title = 'Points (Increasing Noise) n = 100, 200'
row = c('n=100, l=1','n=100, l=2','n=100, l=3','n=100, l=4','n=100, l=5',
        'n=200, l=1','n=200, l=2','n=200, l=3','n=200, l=4','n=200, l=5')
latexpowers(pts2,title,rows=row,decimals=4)

pts3 <- PowersSummary[c(11+100:104,11+125:129),]
title = 'Points (Increasing Noise) n = 300, 400'
row = c('n=300, l=1','n=300, l=2','n=300, l=3','n=300, l=4','n=300, l=5',
        'n=400, l=1','n=400, l=2','n=400, l=3','n=400, l=4','n=400, l=5')
latexpowers(pts3,title,rows=row,decimals=4)


sine1 <- PowersSummary[c(16+0:4,16+25:29),]
title = 'Sine (Increasing Noise) n = 30, 50'
row = c('n=30, l=1','n=30, l=2','n=30, l=3','n=30, l=4','n=30, l=5',
        'n=50, l=1','n=50, l=2','n=50, l=3','n=50, l=4','n=50, l=5')
latexpowers(sine1,title,rows=row,decimals=4)

sine2 <- PowersSummary[c(16+50:54,16+75:79),]
title = 'Sine (Increasing Noise) n = 100, 200'
row = c('n=100, l=1','n=100, l=2','n=100, l=3','n=100, l=4','n=100, l=5',
        'n=200, l=1','n=200, l=2','n=200, l=3','n=200, l=4','n=200, l=5')
latexpowers(sine2,title,rows=row,decimals=4)

sine3 <- PowersSummary[c(16+100:104,16+125:129),]
title = 'Sine (Increasing Noise) n = 300, 400'
row = c('n=300, l=1','n=300, l=2','n=300, l=3','n=300, l=4','n=300, l=5',
        'n=400, l=1','n=400, l=2','n=400, l=3','n=400, l=4','n=400, l=5')
latexpowers(sine3,title,rows=row,decimals=4)


spiral1 <- PowersSummary[c(21+0:4,21+25:29),]
title = 'Spiral (Increasing Noise) n = 30, 50'
row = c('n=30, l=1','n=30, l=2','n=30, l=3','n=30, l=4','n=30, l=5',
        'n=50, l=1','n=50, l=2','n=50, l=3','n=50, l=4','n=50, l=5')
latexpowers(spiral1,title,rows=row,decimals=4)

spiral2 <- PowersSummary[c(21+50:54,21+75:79),]
title = 'Spiral (Increasing Noise) n = 100, 200'
row = c('n=100, l=1','n=100, l=2','n=100, l=3','n=100, l=4','n=100, l=5',
        'n=200, l=1','n=200, l=2','n=200, l=3','n=200, l=4','n=200, l=5')
latexpowers(spiral2,title,rows=row,decimals=4)

spiral3 <- PowersSummary[c(21+100:104,21+125:129),]
title = 'Spiral (Increasing Noise) n = 300, 400'
row = c('n=300, l=1','n=300, l=2','n=300, l=3','n=300, l=4','n=300, l=5',
        'n=400, l=1','n=400, l=2','n=400, l=3','n=400, l=4','n=400, l=5')
latexpowers(spiral3,title,rows=row,decimals=4)

#thresholds

for (i in 1:20){
  for (j in c('30','50','100','200','300','400')){
    cat(' & ')
    cat(sprintf(Mthresholds[j][[1]][i],fmt=paste0('%#.',4,'f')))
  }
  cat(' \n')
}


for (j in c('30','50','100','200','300','400')){
    cat(' & ')
    cat(sprintf(allnetthres[j][[1]],fmt=paste0('%#.',8,'f')))
}
cat(' \n')
for (j in c('30','50','100','200','300','400')){
    cat(' & ')
    cat(sprintf(allCNNthres[j][[1]],fmt=paste0('%#.',8,'f')))
}
cat(' \n')
