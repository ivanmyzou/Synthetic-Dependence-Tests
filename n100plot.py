#n100 plot

from Utility import *

import keras
import tensorflow as tf

import numpy as np
import pandas as pd

import matplotlib.pyplot as plt

model = tf.keras.models.load_model('n100.model')

f50 = getfeatures('Test/Threshold Estimation/n50many.txt',
                  '')
f100 = getfeatures('Test/Threshold Estimation/n100many.txt',
                   '')
f200 = getfeatures('Test/Threshold Estimation/n200many.txt',
                   '')
f300 = getfeatures('Test/Threshold Estimation/n300many.txt',
                   '')
###############################################################################
threshold = {}
threshold[50] = getthreshold(model,f50)
threshold[100] = getthreshold(model,f100)
threshold[200] = getthreshold(model,f200)
threshold[300] = getthreshold(model,f300)
###############################################################################
addcompare = {}

addcompare[50] = writepowers(getfeatures('Test/Additional Tests/n50add.txt',
                                         ''),
                             model,50,threshold)
addcompare[100] = writepowers(getfeatures('Test/Additional Tests/n100add.txt',
                                          ''),
                              model,100,threshold)
addcompare[200] = writepowers(getfeatures('Test/Additional Tests/n200add.txt',
                                          ''),
                              model,200,threshold)
addcompare[300] = writepowers(getfeatures('Test/Additional Tests/n300add.txt',
                                          ''),
                              model,300,threshold)

for i in range(3,14+1):
    powerplots(addcompare,i,[50,100,200,300])

###############################################################################
Icompare = { _ : {} for _ in [50,100,200,300] }


for n in Icompare.keys():
    for i in range(1,4+1):
        image = getfeatures('Test/Image Based/images/'+str(n)+'image'+str(i)+'.txt',
                            '')
        Icompare[n][i] = [modelpower(threshold[n],model,image)] + powers(n,image)
    
for i in range(1,4+1):
    powerplots(Icompare,i,[50,100,200,300])

###############################################################################
Scompare = { _ : {} for _ in [50,100,200,300] }


for n in Scompare.keys():
    for i in range(1,6+1):
        image = getfeatures('Test/Image Based/scribbles/'+str(n)+'s'+str(i)+'.txt',
                            '')
        Scompare[n][i] = [modelpower(threshold[n],model,image)] + powers(n,image)
    
for i in range(1,6+1):
    powerplots(Scompare,i,[50,100,200,300])
