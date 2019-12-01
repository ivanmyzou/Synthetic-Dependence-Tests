#AllCNN Plots


from Utility import *

import keras
import tensorflow as tf

import numpy as np
import pandas as pd

import matplotlib.pyplot as plt

model = tf.keras.models.load_model('allCNN.model')

f30  = getfeatures('Test/Threshold Estimation/n30many.txt',
                   'Test/Threshold Estimation/n30manyIMAGE.txt',
                   30)
f50 = getfeatures('Test/Threshold Estimation/n50many.txt',
                  'Test/Threshold Estimation/n50manyIMAGE.txt',
                  50)
f100 = getfeatures('Test/Threshold Estimation/n100many.txt',
                   'Test/Threshold Estimation/n100manyIMAGE.txt',
                   100)
f200 = getfeatures('Test/Threshold Estimation/n200many.txt',
                   'Test/Threshold Estimation/n200manyIMAGE.txt',
                   200)
f300 = getfeatures('Test/Threshold Estimation/n300many.txt',
                   'Test/Threshold Estimation/n300manyIMAGE.txt',
                   200)

###############################################################################
threshold = {}
threshold[30] = getthresholdCNN(model,matrixreshape(f30,start=21,add=4))
threshold[50] = getthresholdCNN(model,matrixreshape(f50,start=21,add=4))
threshold[100] = getthresholdCNN(model,matrixreshape(f100,start=21,add=4))
threshold[200] = getthresholdCNN(model,matrixreshape(f200,start=21,add=4))
threshold[300] = getthresholdCNN(model,matrixreshape(f300,start=21,add=4))

###############################################################################
addcompare = {}

addcompare[30] = writepowersCNN(getfeatures('Test/n30add.txt','Test/n30addIMAGE.txt',30),
                             model,30,threshold,start=21,add=4)
addcompare[50] = writepowersCNN(getfeatures('Test/Additional Tests/n50add.txt',
                                         'Test/Additional Tests/n50addIMAGE.txt',50),
                             model,50,threshold,start=21,add=4)
addcompare[100] = writepowersCNN(getfeatures('Test/Additional Tests/n100add.txt',
                                          'Test/Additional Tests/n100addIMAGE.txt',100),
                              model,100,threshold,start=21,add=4)
addcompare[200] = writepowersCNN(getfeatures('Test/Additional Tests/n200add.txt',
                                          'Test/Additional Tests/n200addIMAGE.txt',200),
                              model,200,threshold,start=21,add=4)
addcompare[300] = writepowersCNN(getfeatures('Test/Additional Tests/n300add.txt',
                                          'Test/Additional Tests/n300addIMAGE.txt',300),
                              model,300,threshold,start=21,add=4)

for i in range(3,14+1):
    print('\n','\n',i)
    powerplots(addcompare,i,[30,50,100,200,300])

###############################################################################
Icompare = { _ : {} for _ in [30,50,100,200,300] }

for n in Icompare.keys():
    for i in range(1,4+1):
        image = getfeatures('Test/Image Based/images/'+str(n)+'image'+str(i)+'.txt',
                            'Test/Image Based/images/'+str(n)+'image'+str(i)+'IMAGE.txt',
                            n)
        Icompare[n][i] = [modelpowerCNN(threshold[n],model,matrixreshape(image,start=21,add=4))] + powers(n,image)

for i in range(1,4+1):
    print('\n','\n',i)
    powerplots(Icompare,i,[30,50,100,200,300])

###############################################################################
Scompare = { _ : {} for _ in [30,50,100,200,300] }

for n in Scompare.keys():
    for i in range(1,6+1):
        image = getfeatures('Test/Image Based/scribbles/'+str(n)+'s'+str(i)+'.txt',
                            'Test/Image Based/scribbles/'+str(n)+'s'+str(i)+'IMAGE.txt',
                            n)
        Scompare[n][i] = [modelpowerCNN(threshold[n],model,matrixreshape(image,start=21,add=4))] + powers(n,image)
    
for i in range(1,6+1):
    print('\n','\n',i)
    powerplots(Scompare,i,[30,50,100,200,300])

###############################################################################
crosscompare = { _ : {} for _ in [30,50,100,200,300] }

for n in crosscompare.keys():
    crosscompare[n] = writepowersCNN(getfeatures('Test/Increasing Noises/INCcross'+str(n)+'.txt',
                                              'Test/Increasing Noises/INCcross'+str(n)+'IMAGE.txt',
                                         n),
                             model,n,threshold,start=21,add=4)

for i in range(1,5+1):
    print('\n','\n',i)
    powerplots(crosscompare,i,[30,50,100,200,300])

###############################################################################
circcompare = { _ : {} for _ in [30,50,100,200,300] }

for n in circcompare.keys():
    circcompare[n] = writepowersCNN(getfeatures('Test/Increasing Noises/INCcirc'+str(n)+'.txt',
                                              'Test/Increasing Noises/INCcirc'+str(n)+'IMAGE.txt',
                                         n),
                             model,n,threshold,start=21,add=4)

for i in range(1,5+1):
    print('\n','\n',i)
    powerplots(circcompare,i,[30,50,100,200,300])

###############################################################################
sinecompare = { _ : {} for _ in [30,50,100,200,300] }

for n in sinecompare.keys():
    sinecompare[n] = writepowersCNN(getfeatures('Test/Increasing Noises/INCsine'+str(n)+'.txt',
                                              'Test/Increasing Noises/INCsine'+str(n)+'IMAGE.txt',
                                         n),
                             model,n,threshold,start=21,add=4)
            
for i in range(1,5+1):
    print('\n','\n',i)
    powerplots(sinecompare,i,[30,50,100,200,300])

###############################################################################
ptscompare = { _ : {} for _ in [30,50,100,200,300] }

for n in sinecompare.keys():
    ptscompare[n] = writepowersCNN(getfeatures('Test/Increasing Noises/INCpts'+str(n)+'.txt',
                                               'Test/Increasing Noises/INCpts'+str(n)+'IMAGE.txt',
                                         n),
                             model,n,threshold,start=21,add=4)
            
for i in range(1,5+1):
    print('\n','\n',i)
    powerplots(ptscompare,i,[30,50,100,200,300])
