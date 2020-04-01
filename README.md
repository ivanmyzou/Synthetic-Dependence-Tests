# Synthetic-Dependence-Tests
This repository provides all files needed to reproduce the results in the thesis **Synthetic Dependence Tests Based on Deep Learning** as well as a tutorial to produce new dependence structures to be tested.

Author: Ivan Muyun Zou

Contact Email: ivanmyzou@gmail.com

## List of Files:

- **depstats.rar** : R package source for the package depstats.
- **sample generations.rar** : R codes used to generate txt files that represent the features (requires installation of the package depstats).
- **models.rar** : python Keras model files that store the trained parameters for the synthetic dependence tests (can be read with python codes); 5 models are included.
- **results.rar** : python files that can be used to produce the powerplots shown in the thesis as well as more detailed numerical results (require the used of python library for machine learning Keras as well as the Keras model files and txt files for features in the same directory); other required python libraries are: numpy, pandas and matplotlib.pyplot.

## Reproduction of Results:

- **Download and Decompress Files** :

- **Sample Generations** :

This step may be skipped by downloading the two large compressed files under the link below:
https://www.dropbox.com/sh/l4rkxkh5w1asury/AABbBT2n-ip3hKeCRiLep27Ga?dl=0
The two compressed files should be uncompressed in the same home directory which should create two new folders named `Train' and `Test' 

## Tutorial for Testing with New Dependence Structures:
