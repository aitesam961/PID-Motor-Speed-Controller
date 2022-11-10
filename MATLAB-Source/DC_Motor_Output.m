clc;
clear all;
close all;
Vin = 0:1:13;
Vout = [0 0.01 0.6 0.916 1.26 1.60 1.93 2.27 2.58 2.76 3.08 3.4 3.68 3.95];
plot(Vin,Vout);
step(tf1);
