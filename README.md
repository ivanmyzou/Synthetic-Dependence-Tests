# Synthetic-Dependence-Tests
This repository provides all files needed to reproduce the results in the thesis **Synthetic Dependence Tests Based on Deep Learning** as well as a tutorial to produce new dependence structures to be tested.

Author: Ivan Muyun Zou

Contact Email: ivanmyzou@gmail.com

## List of Files:

- **depstats.rar** : R package source for the package depstats.
- **sample generations.rar** : R codes used to generate txt files that represent the features (requires installation of the package depstats and imager, the latter is not included in depstats). 
- **models.rar** : python Keras model files that store the trained parameters for the synthetic dependence tests (can be read with python codes); 5 models are included.
- **results.rar** : python files that can be used to produce the powerplots shown in the thesis as well as more detailed numerical results (require the used of python library for machine learning Keras as well as the Keras model files and txt files for features in the same directory); other required python libraries are: numpy, pandas and matplotlib.pyplot; 6 files are included with 5 of them each corresponding to the production of results under the 5 models; 1 file named 'Utility' stores the functions used to produce those results.
- **tutorial.rar** : a pdf file demonstrating the entire process of producing new dependence structures in R and then testing in Python; all relevant files are also included.

## Reproduction of Results:

- **Download and Decompress Files** : All compressed files except **tutorial.rar** should be downloaded and decompressed at a home directory. Such home directory should be set as the working directory for both R and Python.

- **Sample Generations** : It would take a very long time to produce all results in R so it is recommended to simply download the exported results. The R file 'dircreate' should be run first to create folders. All other R files can be then run in any order to produce needed txt files where held the exported values of competitor (measures and dependent tests) values or greyscale pixel values. This step may be skipped by downloading the two large compressed files under the link:
https://www.dropbox.com/sh/l4rkxkh5w1asury/AABbBT2n-ip3hKeCRiLep27Ga?dl=0. The compressed file 'Test' should be uncompressed in the same home directory which should create a new folder 'Test'. The compressed file 'Train' was used for model training and has no used in model assessment.

## Tutorial for Testing with New Dependence Structures:

For the detailed tutorial, see the pdf file in **tutorial.rar**. The entire process can be listed as:

In R:
- Creation of random sample pairs under the new dependence structure;
- Applying measures and dependence tests (competitors) over the samples to obtain estimated values;
- Producing image pixel values from density plots of the samples;
- Exporting the values to txt files.

In Python:
- Loading the models;
- Loading the values from txt files;
- Testing with the models against other competitors.
