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
To obtain the input data of the SLNN 𝑥, each white pixel is assigned with a value of 10 and each black pixel with a value of −10.

<p align="center">
  <img src='README Images/number_representation.PNG'/ >
</p>

Then this pixels are vectorized and blurred with a Gaussian noise with 𝜇 = 0 and 𝜎 = 𝜎𝑟𝑒𝑙 · 10.

<p align="center">
  <img src='README Images/blurred_number.PNG'/ >
</p>

Once the input of the data is created, several algorithms will be used to train the SLNN. 

After the training phase the SLNN will be used to recognize some new test numbers. Once this testing phase has finished, several  benchmarks will be performed to test the accuracy  and performance of the used [algorithms](#installation)and the selected values for the function hiperparameters.

*Note: In order to check the accuracy, the [uo_nn_Xyplot](uo_nn_Xyplot.m) will be used, where green is used to identify right positive, blue right negative, pink false positive and red false negative*

<p align="center">
  <img src='README Images/benchmarking.PNG'/ >
</p>

## Used algorithms

In order to solve the UO problem, several algorithms have been used:

* Gradient Method (GM).
* Conjugate Gradient Method (CGM) with Polack-Ribiere.
* (BFGS)
* Stochastic Gradient Method (SGM).

## Architecture
The files contained on this repository are:

* All the necessary files for blurred number generation, the UO algorithms used to train the SLNN and the files used to perform, numerically and graphicaly, benchmarking of the obtained results. All this files can be easily   using [MATLAB®](https://es.mathworks.com/products/matlab.html).

* An extensive report about the development and conclusions of this project. 

*Note: The rest of the files in the master branch are auxiliary or license related*

## Team

This bot was developed by:
| [![Vinomo4](https://avatars2.githubusercontent.com/u/49389601?s=60&v=4)](https://github.com/Vinomo4) | [![Marc](https://avatars3.githubusercontent.com/u/49389491?s=60&u=b239b67c3f064bf2dae05e08ae9965b7c7e34c36&v=4)](https://github.com/CarlOwOs) |
| --- | --- |
| [Victor Novelle Moriano](https://github.com/Vinomo4) | [Carlos Hurtado Comin](https://github.com/CarlOwOs) |


Students of Data Science and Engineering at [UPC](https://www.upc.edu/ca).

## License

[MIT License](./LICENSE)
