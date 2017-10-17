clearvars; close all; clc;

load 'funkcjeLUT.mat'

imgName = 'lena.bmp';





myLut(imgName, kwadratowa);
myLut(imgName, log);
myLut(imgName, odwlog);
myLut(imgName, odwrotna);
myLut(imgName, pierwiastkowa);
myLut(imgName, pila);
myLut(imgName, wykladnicza);