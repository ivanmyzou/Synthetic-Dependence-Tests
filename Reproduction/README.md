# Reproducing Results

This part concerns reproducing the exact results. For tutorial on creating customised dependece structures to be tested, see Walkthrough.

## 1 Feature Generation

- Download **samplegeneration.rar** and have it extracted.
- Have **R** package **depstats** installed.
- Run all **R** files in the extracted folders with working directory set to the location of each **R** file. This should create some **txt** files in the correct directory. The files in the folder **Train** may be ignored.
- This step may be skept by downloading **generatedsamples.rar** from https://www.dropbox.com/sh/l4rkxkh5w1asury/AABbBT2n-ip3hKeCRiLep27Ga?dl=0 and have it extracted. This file have all the **txt** files included.

## 2 Powers Computation

- Have the previous part set up.
- Run **threshold.R**, the values produced can be checked with attached threshold data in **depstats**.
- Run **powercompare.R**, the values produced can be checked with attached power data in **depstats**.

## 3 Summary of Powers 

- As long as **R** package **depstats** is installed, the previous parts may be skept.
- Run **PowersPlotting.R** for all the powerplots.
- Run **LatexPrinting.R** for all the power tables in LaTex format.
