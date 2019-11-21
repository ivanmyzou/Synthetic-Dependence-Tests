#All net

from Utility import *

import keras
import tensorflow as tf

import numpy as np
import pandas as pd

xdep50 = getfeatures('Train/n50/n50dep.txt','Train/n50/n50depIMAGE.txt',50)
xind50 = getfeatures('Train/n50/n50ind.txt','Train/n50/n50indIMAGE.txt',50)
xdep100 = getfeatures('Train/n100/n100dep.txt','Train/n100/n100depIMAGE.txt',100)
xind100 = getfeatures('Train/n100/n100ind.txt','Train/n100/n100indIMAGE.txt',100)
xdep200 = getfeatures('Train/n200/n200dep.txt','Train/n200/n200depIMAGE.txt',200)
xind200 = getfeatures('Train/n200/n200ind.txt','Train/n200/n200indIMAGE.txt',200)
xdep400 = getfeatures('Train/n400/n400dep.txt','Train/n400/n400depIMAGE.txt',400)
xind400 = getfeatures('Train/n400/n400ind.txt','Train/n400/n400indIMAGE.txt',400)

x = np.concatenate((xind50,xind100,xind200,xind400,
                    xdep50,xdep100,xdep200,xdep400),axis=0) #independent and dependent
y = np.array( [0]*len(xind50)*4 + [1]*len(xdep50)*4 ) #independent and dependent

#model architecture
model = tf.keras.models.Sequential()
model.add(tf.keras.layers.Flatten())
model.add(tf.keras.layers.Dense(128, activation=tf.nn.relu))
model.add(tf.keras.layers.Dropout(0.25))
model.add(tf.keras.layers.Dense(128, activation=tf.nn.tanh))
model.add(tf.keras.layers.Dropout(0.25))
model.add(tf.keras.layers.Dense(128, activation=tf.nn.relu))
model.add(tf.keras.layers.Dropout(0.25))
model.add(tf.keras.layers.Dense(128, activation=tf.nn.tanh))
model.add(tf.keras.layers.Dropout(0.25))
model.add(tf.keras.layers.Dense(64, activation=tf.nn.relu))
model.add(tf.keras.layers.Dropout(0.25))
model.add(tf.keras.layers.Dense(64, activation=tf.nn.tanh))
model.add(tf.keras.layers.Dropout(0.25))
model.add(tf.keras.layers.Dense(1, activation=tf.nn.sigmoid))

model.compile(optimizer='adam',
              loss='binary_crossentropy',
              metrics=['accuracy'])

model.fit(x, y, epochs=10, batch_size=1000, 
          validation_split=0.05, shuffle=True)

#model.save('allnet.model')
#model = tf.keras.models.load_model('allnet.model')

f50 = getfeatures('Test/Threshold Estimation/n50many.txt',
                  'Test/Threshold Estimation/n50manyIMAGE.txt',
                  50)
f100 = getfeatures('Test/Threshold Estimation/n100many.txt',
                   'Test/Threshold Estimation/n100manyIMAGE.txt',
                   100)
f200 = getfeatures('Test/Threshold Estimation/n200many.txt',
                   'Test/Threshold Estimation/n200manyIMAGE.txt',
                   200)
f400 = getfeatures('Test/Threshold Estimation/n400many.txt',
                   'Test/Threshold Estimation/n400manyIMAGE.txt',
                   400)

f30  = getfeatures('Test/Threshold Estimation/n30many.txt',
                   'Test/Threshold Estimation/n30manyIMAGE.txt',
                   30)
threshold[30] = getthreshold(model,f30)

threshold = {}
threshold[50] = getthreshold(model,f50)
threshold[100] = getthreshold(model,f100)
threshold[200] = getthreshold(model,f200)
threshold[400] = getthreshold(model,f400)

indtest = getfeatures('Test/n30ind.txt','Test/n30indIMAGE.txt',30) 
alpha = modelpower(threshold[30],model,indtest)
print('Over 10000 independent samples')
print('rate of type I error:', alpha)

indtest = getfeatures('Test/n50/n50indtest.txt','Test/n50/n50indtestIMAGE.txt',50) 
alpha = modelpower(threshold[50],model,indtest)
print('Over 10000 independent samples')
print('rate of type I error:', alpha)

indtest = getfeatures('Test/n100/n100indtest.txt','Test/n100/n100indtestIMAGE.txt',100) 
alpha = modelpower(threshold[100],model,indtest)
print('Over 10000 independent samples')
print('rate of type I error:', alpha)

indtest = getfeatures('Test/n200/n200indtest.txt','Test/n200/n200indtestIMAGE.txt',200) 
alpha = modelpower(threshold[200],model,indtest)
print('Over 10000 independent samples')
print('rate of type I error:', alpha)

indtest = getfeatures('Test/n400/n400indtest.txt','Test/n400/n400indtestIMAGE.txt',400) 
alpha = modelpower(threshold[400],model,indtest)
print('Over 10000 independent samples')
print('rate of type I error:', alpha)



#30
addtest = getfeatures('Test/n30add.txt','Test/n30addIMAGE.txt',30)

for i in range(14):
    print('\n', i+1 )        
    competitorspower = powers(30,addtest[(i*1000):(i*1000)+1000])
    powermatch = { competitors[i]:competitorspower[i] for i in range(20) }
    print('powers from competitors', max(powermatch.values()) )
    print('Model power', modelpower(threshold[30],model,addtest[(i*1000):(i*1000)+1000]) )



#50
addtest = getfeatures('Test/Additional Tests/n50add.txt','Test/Additional Tests/n50addIMAGE.txt',50)

p = powers(50,addtest)
pmodel = modelpower(threshold[50],model,addtest)
print('Additional Tests')
print('Powers from competitors',p)
print('Model power', pmodel)

for i in range(14):
    print('\n', i+1 )        
    competitorspower = powers(50,addtest[(i*1000):(i*1000)+1000])
    powermatch = { competitors[i]:competitorspower[i] for i in range(20) }
    print('powers from competitors', max(powermatch.values()) )
    print('Model power', modelpower(threshold[50],model,addtest[(i*1000):(i*1000)+1000]) )


#100
addtest = getfeatures('Test/Additional Tests/n100add.txt','Test/Additional Tests/n100addIMAGE.txt',100)

p = powers(100,addtest)
pmodel = modelpower(threshold[100],model,addtest)
print('Additional Tests')
print('Powers from competitors',p)
print('Model power', pmodel)

for i in range(14):
    print('\n', i+1 )         
    competitorspower = powers(100,addtest[(i*1000):(i*1000)+1000])
    powermatch = { competitors[i]:competitorspower[i] for i in range(20) }
    print('powers from competitors', max(powermatch.values()) )
    print('Model power', modelpower(threshold[100],model,addtest[(i*1000):(i*1000)+1000]) )

#200
addtest = getfeatures('Test/Additional Tests/n200add.txt','Test/Additional Tests/n200addIMAGE.txt',200)

p = powers(200,addtest)
pmodel = modelpower(threshold[200],model,addtest)
print('Additional Tests')
print('Powers from competitors',p)
print('Model power', pmodel)

for i in range(14):
    print('\n', i+1 )     
    competitorspower = powers(200,addtest[(i*1000):(i*1000)+1000])
    powermatch = { competitors[i]:competitorspower[i] for i in range(20) }
    print('powers from competitors', max(powermatch.values()) )
    print('Model power', modelpower(threshold[200],model,addtest[(i*1000):(i*1000)+1000]) )

#400
addtest = getfeatures('Test/Additional Tests/n400add.txt','Test/Additional Tests/n400addIMAGE.txt',400)

p = powers(400,addtest)
pmodel = modelpower(threshold[400],model,addtest)
print('Additional Tests')
print('Powers from competitors',p)
print('Model power', pmodel)

for i in range(14):
    print('\n', i+1 )     
    competitorspower = powers(400,addtest[(i*1000):(i*1000)+1000])
    powermatch = { competitors[i]:competitorspower[i] for i in range(20) }
    print('powers from competitors', max(powermatch.values()) )
    print('Model power', modelpower(threshold[400],model,addtest[(i*1000):(i*1000)+1000]) )





#300
threshold[300] = getthreshold(model,getfeatures('Test/Threshold Estimation/n300many.txt',
                                                'Test/Threshold Estimation/n300manyIMAGE.txt',
                                                 300))

indtest = getfeatures('Test/n300/n300ind.txt','Test/n300/n300indIMAGE.txt',300) 
alpha = modelpower(threshold[300],model,indtest)
print('Over 10000 independent samples')
print('rate of type I error:', alpha)

addtest = getfeatures('Test/Additional Tests/n300add.txt','Test/Additional Tests/n300addIMAGE.txt',300)

p = powers(300,addtest)
pmodel = modelpower(threshold[300],model,addtest)
print('Additional Tests')
print('Powers from competitors',p)
print('Model power', pmodel)

for i in range(14):
    competitorspower = powers(300,addtest[(i*1000):(i*1000)+1000])
    powermatch = { competitors[i]:competitorspower[i] for i in range(20) }
    print('powers from competitors', powermatch )
    print('Model power', modelpower(threshold[300],model,addtest[(i*1000):(i*1000)+1000]) )

#500
threshold[500] = getthreshold(model,getfeatures('Test/Threshold Estimation/n500many.txt',
                                                'Test/Threshold Estimation/n500manyIMAGE.txt',
                                                 500))

indtest = getfeatures('Test/n500/n500ind.txt','Test/n500/n500indIMAGE.txt',500) 
alpha = modelpower(threshold[500],model,indtest)
print('Over 10000 independent samples')
print('rate of type I error:', alpha)

addtest = getfeatures('Test/Additional Tests/n500add.txt','Test/Additional Tests/n500addIMAGE.txt',300)

p = powers(500,addtest)
pmodel = modelpower(threshold[500],model,addtest)
print('Additional Tests')
print('Powers from competitors',p)
print('Model power', pmodel)

for i in range(14):
    competitorspower = powers(500,addtest[(i*1000):(i*1000)+1000])
    powermatch = { competitors[i]:competitorspower[i] for i in range(20) }
    print('powers from competitors', powermatch )
    print('Model power', modelpower(threshold[500],model,addtest[(i*1000):(i*1000)+1000]) )


###############################################################################
###############################################################################
###############################################################################
###############################################################################
###############################################################################
n = 400
print('image 1')
image = getfeatures('Test/Image Based/images/' + str(n) + 'image1.txt',
                    'Test/Image Based/images/' + str(n) + 'image1IMAGE.txt',
                    n)

p = powers(n,image)
pmodel = modelpower(threshold[n],model,image)
print('Max Powers from competitors', max(p))
print('Model power', pmodel)

print('image 2')
image = getfeatures('Test/Image Based/images/' + str(n) + 'image2.txt',
                    'Test/Image Based/images/' + str(n) + 'image2IMAGE.txt',
                    n)

p = powers(n,image)
pmodel = modelpower(threshold[n],model,image)
print('Max Powers from competitors', max(p))
print('Model power', pmodel)

print('image 3')
image = getfeatures('Test/Image Based/images/' + str(n) + 'image3.txt',
                    'Test/Image Based/images/' + str(n) + 'image3IMAGE.txt',
                    n)

p = powers(n,image)
pmodel = modelpower(threshold[n],model,image)
print('Max Powers from competitors', max(p))
print('Model power', pmodel)

print('image 4')
image = getfeatures('Test/Image Based/images/' + str(n) + 'image4.txt',
                    'Test/Image Based/images/' + str(n) + 'image4IMAGE.txt',
                    n)

p = powers(n,image)
pmodel = modelpower(threshold[n],model,image)
print('Max Powers from competitors', max(p))
print('Model power', pmodel)




print('sribble 1')
scribble = getfeatures('Test/Image Based/scribbles/' + str(n) + 's1.txt',
                       'Test/Image Based/scribbles/' + str(n) + 's1IMAGE.txt',
                       n)
p = powers(n,scribble)
pmodel = modelpower(threshold[n],model,scribble)
print('Max Powers from competitors', max(p))
print('Model power', pmodel)

print('sribble 2')
scribble = getfeatures('Test/Image Based/scribbles/' + str(n) + 's2.txt',
                       'Test/Image Based/scribbles/' + str(n) + 's2IMAGE.txt',
                       n)
p = powers(n,scribble)
pmodel = modelpower(threshold[n],model,scribble)
print('Max Powers from competitors', max(p))
print('Model power', pmodel)

print('sribble 3')
scribble = getfeatures('Test/Image Based/scribbles/' + str(n) + 's3.txt',
                       'Test/Image Based/scribbles/' + str(n) + 's3IMAGE.txt',
                       n)
p = powers(n,scribble)
pmodel = modelpower(threshold[n],model,scribble)
print('Max Powers from competitors', max(p))
print('Model power', pmodel)

print('sribble 4')
scribble = getfeatures('Test/Image Based/scribbles/' + str(n) + 's4.txt',
                       'Test/Image Based/scribbles/' + str(n) + 's4IMAGE.txt',
                       n)
p = powers(n,scribble)
pmodel = modelpower(threshold[n],model,scribble)
print('Max Powers from competitors', max(p))
print('Model power', pmodel)

print('sribble 5')
scribble = getfeatures('Test/Image Based/scribbles/' + str(n) + 's5.txt',
                       'Test/Image Based/scribbles/' + str(n) + 's5IMAGE.txt',
                       n)
p = powers(n,scribble)
pmodel = modelpower(threshold[n],model,scribble)
print('Max Powers from competitors', max(p))
print('Model power', pmodel)

print('sribble 6')
scribble = getfeatures('Test/Image Based/scribbles/' + str(n) + 's6.txt',
                       'Test/Image Based/scribbles/' + str(n) + 's6IMAGE.txt',
                       n)
p = powers(n,scribble)
pmodel = modelpower(threshold[n],model,scribble)
print('Max Powers from competitors', max(p))
print('Model power', pmodel)


n = 400
deptest = getfeatures('Test/Increasing Noises/INCcross' + str(n) + '.txt',
                      'Test/Increasing Noises/INCcross' + str(n) + 'IMAGE.txt',
                      n)
for i in range(2,5):
    print('\n', i+1)          
    competitorspower = powers(n,deptest[(i*1000):(i*1000)+1000])
    print('powers from competitors', max(competitorspower) )
    print('Model power', modelpower(threshold[n],model,deptest[(i*1000):(i*1000)+1000]) )

deptest = getfeatures('Test/Increasing Noises/INCsine' + str(n) + '.txt',
                      'Test/Increasing Noises/INCsine' + str(n) + 'IMAGE.txt',
                      n)
for i in range(2,5):
    print('\n', i+1)          
    competitorspower = powers(n,deptest[(i*1000):(i*1000)+1000])
    print('powers from competitors', max(competitorspower) )
    print('Model power', modelpower(threshold[n],model,deptest[(i*1000):(i*1000)+1000]) )


deptest = getfeatures('Test/Increasing Noises/INCcirc' + str(n) + '.txt',
                      'Test/Increasing Noises/INCcirc' + str(n) + 'IMAGE.txt',
                      n)
for i in range(2,5):
    print('\n', i+1)          
    competitorspower = powers(n,deptest[(i*1000):(i*1000)+1000])
    print('powers from competitors', max(competitorspower) )
    print('Model power', modelpower(threshold[n],model,deptest[(i*1000):(i*1000)+1000]) )



deptest = getfeatures('Test/Increasing Noises/INCpts' + str(n) + '.txt',
                      'Test/Increasing Noises/INCpts' + str(n) + 'IMAGE.txt',
                      n)
for i in range(2,5):
    print('\n', i+1)          
    competitorspower = powers(n,deptest[(i*1000):(i*1000)+1000])
    print('powers from competitors', max(competitorspower) )
    print('Model power', modelpower(threshold[n],model,deptest[(i*1000):(i*1000)+1000]) )


