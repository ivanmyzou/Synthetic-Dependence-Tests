#n100CNN plots

from Utility import *

import keras
import tensorflow as tf

import numpy as np
import pandas as pd

import matplotlib.pyplot as plt

model = tf.keras.models.load_model('n100CNN.model')

f50 = getfeatures('Test/Threshold Estimation/n50many.txt',
                  'Test/Threshold Estimation/n50manyIMAGE.txt')
f100 = getfeatures('Test/Threshold Estimation/n100many.txt',
                   'Test/Threshold Estimation/n100manyIMAGE.txt')
f200 = getfeatures('Test/Threshold Estimation/n200many.txt',
                   'Test/Threshold Estimation/n200manyIMAGE.txt')
f300 = getfeatures('Test/Threshold Estimation/n300many.txt',
                   'Test/Threshold Estimation/n300manyIMAGE.txt')
###############################################################################
threshold = {}
threshold[50] = getthresholdCNN(model,matrixreshape(f50))
threshold[100] = getthresholdCNN(model,matrixreshape(f100))
threshold[200] = getthresholdCNN(model,matrixreshape(f200))
threshold[300] = getthresholdCNN(model,matrixreshape(f300))
###############################################################################
addcompare = {}

addcompare[50] = writepowersCNN(getfeatures('Test/Additional Tests/n50add.txt',
                                         'Test/Additional Tests/n50addIMAGE.txt'),
                             model,50,threshold)
addcompare[100] = writepowersCNN(getfeatures('Test/Additional Tests/n100add.txt',
                                          'Test/Additional Tests/n100addIMAGE.txt'),
                              model,100,threshold)
addcompare[200] = writepowersCNN(getfeatures('Test/Additional Tests/n200add.txt',
                                          'Test/Additional Tests/n200addIMAGE.txt'),
                              model,200,threshold)
addcompare[300] = writepowersCNN(getfeatures('Test/Additional Tests/n300add.txt',
                                          'Test/Additional Tests/n300addIMAGE.txt'),
                              model,300,threshold)

for i in range(3,14+1):
    print('\n','\n',i)
    powerplots(addcompare,i,[50,100,200,300])

###############################################################################
Icompare = { _ : {} for _ in [50,100,200,300] }

for n in Icompare.keys():
    for i in range(1,4+1):
        image = getfeatures('Test/Image Based/images/'+str(n)+'image'+str(i)+'.txt',
                            'Test/Image Based/images/'+str(n)+'image'+str(i)+'IMAGE.txt')
        Icompare[n][i] = [modelpowerCNN(threshold[n],model,matrixreshape(image))] + powers(n,image)
    
for i in range(1,4+1):
    powerplots(Icompare,i,[50,100,200,300])

###############################################################################
Scompare = { _ : {} for _ in [50,100,200,300] }

for n in Scompare.keys():
    for i in range(1,6+1):
        image = getfeatures('Test/Image Based/scribbles/'+str(n)+'s'+str(i)+'.txt',
                            'Test/Image Based/scribbles/'+str(n)+'s'+str(i)+'IMAGE.txt')
        Scompare[n][i] = [modelpowerCNN(threshold[n],model,matrixreshape(image))] + powers(n,image)
    
for i in range(1,6+1):
    print('\n','\n',i)
    powerplots(Scompare,i,[50,100,200,300])


