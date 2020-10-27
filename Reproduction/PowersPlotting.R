#Powers Plotting

library(depstats)

#####

par(mfrow = c(2, 5),
    oma = c(5,4,0,0) + 0.75,
    mar = c(0,0,1,1) + 1.75)

Linear <- depPowers[1+c(0,20,40,60,80,100),]
plotpowers(Linear,'Linear')
Diamond <- depPowers[2+c(0,20,40,60,80,100),]
plotpowers(Diamond,'Diamond')
Triangle <- depPowers[3+c(0,20,40,60,80,100),]
plotpowers(Triangle,'Triangle')
Crescent <- depPowers[4+c(0,20,40,60,80,100),]
plotpowers(Crescent,'Crescent')
Pts <- depPowers[5+c(0,20,40,60,80,100),]
plotpowers(Pts,'Points')
Exp <- depPowers[6+c(0,20,40,60,80,100),]
plotpowers(Exp,'Exponential')
Circles <- depPowers[7+c(0,20,40,60,80,100),]
plotpowers(Circles,'Circles')
Cross <- depPowers[8+c(0,20,40,60,80,100),]
plotpowers(Cross,'Cross')
Wedge <- depPowers[9+c(0,20,40,60,80,100),]
plotpowers(Wedge,'Wedge')
Cubic <- depPowers[10+c(0,20,40,60,80,100),]
plotpowers(Cubic,'Cubic')

W <- depPowers[11+c(0,20,40,60,80,100),]
plotpowers(W,'W-shape')
Parabola <- depPowers[12+c(0,20,40,60,80,100),]
plotpowers(Parabola,'Parabola')
TwoParabola <- depPowers[13+c(0,20,40,60,80,100),]
plotpowers(TwoParabola,'Two-Parabola')
Sine <- depPowers[14+c(0,20,40,60,80,100),]
plotpowers(Sine,'Sine')
Doppler <- depPowers[15+c(0,20,40,60,80,100),]
plotpowers(Doppler,'Doppler')
Hsine <- depPowers[16+c(0,20,40,60,80,100),]
plotpowers(Hsine,'Heavy-sine')
Heart <- depPowers[17+c(0,20,40,60,80,100),]
plotpowers(Heart,'Heart')
Spiral <- depPowers[18+c(0,20,40,60,80,100),]
plotpowers(Spiral,'Spiral')
Taegeuk <- depPowers[19+c(0,20,40,60,80,100),]
plotpowers(Taegeuk,'Taegeuk')
Samtaegeuk <- depPowers[19+c(0,20,40,60,80,100),]
plotpowers(Samtaegeuk,'Samtaegeuk')


#####
par(mfrow = c(2, 2),
    oma = c(5,4,0,0) + 0.75,
    mar = c(0,0,1,1) + 1.75)

I1 <- IPowers[1+c(0,4,8,12,16,20),]
plotpowers(I1,'Image 1')

I2 <- IPowers[2+c(0,4,8,12,16,20),]
plotpowers(I2,'Image 2')

I3 <- IPowers[3+c(0,4,8,12,16,20),]
plotpowers(I3,'Image 3')

I4 <- IPowers[4+c(0,4,8,12,16,20),]
plotpowers(I4,'Image 4')



#####
par(mfrow = c(2, 3),
    oma = c(5,4,0,0) + 0.75,
    mar = c(0,0,1,1) + 1.75)


S1 <- SPowers[1+c(0,6,12,18,24,30),]
plotpowers(S1,'Scribble 1')

S2 <- SPowers[2+c(0,6,12,18,24,30),]
plotpowers(S2,'Scribble 2')

S3 <- SPowers[3+c(0,6,12,18,24,30),]
plotpowers(S3,'Scribble 3')

S4 <- SPowers[4+c(0,6,12,18,24,30),]
plotpowers(S4,'Scribble 4')

S5 <- SPowers[5+c(0,6,12,18,24,30),]
plotpowers(S5,'Scribble 5')

S6 <- SPowers[6+c(0,6,12,18,24,30),]
plotpowers(S6,'Scribble 6')


#####
par(mfrow = c(2, 4),
    oma = c(5,4,0,0) + 0.75,
    mar = c(0,0,1,1) + 1.75)
add1 <- addPowers[1+seq(0,65,11),]
plotpowers(add1,'1A')

add2 <- addPowers[2+seq(0,65,11),]
plotpowers(add2,'1B')

add3 <- addPowers[3+seq(0,65,11),]
plotpowers(add3,'2A')

add4 <- addPowers[4+seq(0,65,11),]
plotpowers(add4,'2B')

add5 <- addPowers[5+seq(0,65,11),]
plotpowers(add5,'3A')

add6 <- addPowers[6+seq(0,65,11),]
plotpowers(add6,'3B')

add7 <- addPowers[7+seq(0,65,11),]
plotpowers(add7,'4A')

add8 <- addPowers[8+seq(0,65,11),]
plotpowers(add8,'4B')


par(mfrow = c(1, 3),
    oma = c(5,4,0,0) + 0.75,
    mar = c(0,0,1,1) + 1.75)
add9 <- addPowers[9+seq(0,65,11),]
plotpowers(add9,'5')

add10 <- addPowers[10+seq(0,65,11),]
plotpowers(add10,'6')

add11 <- addPowers[11+seq(0,65,11),]
plotpowers(add11,'7')



#####
par(mfrow = c(1, 5),
    oma = c(5,4,0,0) + 0.75,
    mar = c(0,0,1,1) + 1.75)

circ1 <- INCPowers[1+seq(0,149,25),]
plotpowers(circ1,'Circle 1')
circ2 <- INCPowers[2+seq(0,149,25),]
plotpowers(circ2,'Circle 2')
circ3 <- INCPowers[3+seq(0,149,25),]
plotpowers(circ2,'Circle 3')
circ4 <- INCPowers[4+seq(0,149,25),]
plotpowers(circ2,'Circle 4')
circ5 <- INCPowers[5+seq(0,149,25),]
plotpowers(circ2,'Circle 5')

cross1 <- INCPowers[1+seq(0,149,25)+5,]
plotpowers(cross1,'Cross 1')
cross2 <- INCPowers[2+seq(0,149,25)+5,]
plotpowers(cross2,'Cross 2')
cross3 <- INCPowers[3+seq(0,149,25)+5,]
plotpowers(cross3,'Cross 3')
cross4 <- INCPowers[4+seq(0,149,25)+5,]
plotpowers(cross4,'Cross 4')
cross5 <- INCPowers[5+seq(0,149,25)+5,]
plotpowers(cross5,'Cross 5')

pts1 <- INCPowers[1+seq(0,149,25)+10,]
plotpowers(pts1,'Points 1')
pts2 <- INCPowers[2+seq(0,149,25)+10,]
plotpowers(pts2,'Points 2')
pts3 <- INCPowers[3+seq(0,149,25)+10,]
plotpowers(pts3,'Points 3')
pts4 <- INCPowers[4+seq(0,149,25)+10,]
plotpowers(pts4,'Points 4')
pts5 <- INCPowers[5+seq(0,149,25)+10,]
plotpowers(pts5,'Points 5')

sine1 <- INCPowers[1+seq(0,149,25)+15,]
plotpowers(sine1,'Sine 1')
sine2 <- INCPowers[2+seq(0,149,25)+15,]
plotpowers(sine2,'Sine 2')
sine3 <- INCPowers[3+seq(0,149,25)+15,]
plotpowers(sine3,'Sine 3')
sine4 <- INCPowers[4+seq(0,149,25)+15,]
plotpowers(sine4,'Sine 4')
sine5 <- INCPowers[5+seq(0,149,25)+15,]
plotpowers(sine5,'Sine 5')

spiral1 <- INCPowers[1+seq(0,149,25)+20,]
plotpowers(spiral1,'Spiral 1')
spiral2 <- INCPowers[2+seq(0,149,25)+20,]
plotpowers(spiral2,'Spiral 2')
spiral3 <- INCPowers[3+seq(0,149,25)+20,]
plotpowers(spiral3,'Spiral 3')
spiral4 <- INCPowers[4+seq(0,149,25)+20,]
plotpowers(spiral4,'Spiral 4')
spiral5 <- INCPowers[5+seq(0,149,25)+20,]
plotpowers(spiral5,'Spiral 5')
