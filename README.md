# SLNN for Pattern Recognition

> Singular Layer Neuronal Network for recognition of blurred digits sequences.

The aim of this project is to develop an application, based on unconstrained optimization algorithms, that allow to recognize the numbers in a sequence of blurred digits.

The procedure to achieve that goal will be to formulate a Single Layer
Neural Network that is going to be trained to recognize the different
numbers with First Derivative Optimization methods.

<p align="center">
  <img src='README Images/blurred_numbers.PNG'/ >
</p>

## Introduction and basics

The SLNN will be used to solve a problem of pattern recognition over a small 7x5 pixels matrix picturing the 10 digits.
To obtain the input data of the SLNN 𝑥, each white pixel is assigned with a value of 10 and each black pixel with a value of −10

<p align="center">
  <img src='README Images/number_representation.PNG'/ >
</p>

Then this pixels are vectorized and blurred with a Gaussian noise with 𝜇 = 0 and 𝜎 = 𝜎𝑟𝑒𝑙 · 10.

<p align="center">
  <img src='README Images/blurred_number.PNG'/ >
</p>

Once the input of the data is created, several algorithms will be used to train the SLNN. 

After the training phase the SLNN will be used to recognize some new test numbers. Once this testing phase has finished, several  benchmarks will be performed to test the accuracy  and performance of the used algorithms and the selected values for the function hiperparameters.

*Note: In order to check the accuracy, the [uo_nn_Xyplot](uo_nn_Xyplot.m) will be used, where green is used to identify right positive, blue right negative, pink false positive and red false negative*

<p align="center">
  <img src='README Images/benchmarking.PNG'/ >
</p>

## Used algorithms

In order to solve the UO problem, several algorithms have been used:

* Gradient Method (GM).
* 
* Stochastic Gradient Method (SGM).

