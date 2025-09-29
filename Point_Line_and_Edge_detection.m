clc
close all
clear all

A=imread('y.jpeg');
I=imbinarize(rgb2gray(A));

M = [ 1 1 1; 1 -8 1;1 1 1];
Filter=imfilter(I,M);

F=abs(Filter);
X=max(F);
T=F>=X;


figure 
subplot(2,2,1)
imshow(A)
title('Image')
subplot(2,2,2)
imshow(I)
title('Binary Image')

subplot(2,2,3)
imshow(Filter)
title('Filtered Image')
subplot(2,2,4)
imshow(T)
title('Point Detected Image')



A1=imread('y.jpeg');
I1=imbinarize(rgb2gray(A1));

M1 = [ 1 1 1; -2 -2 -2; 1 1 1];
Filter1=imfilter(I1,M1);

F1=abs(Filter1);
X1=max(F1);
T1=F1>=X1;

figure(2) 
subplot(2,2,1)
imshow(A1)
title('Image')
subplot(2,2,2)
imshow(I1)
title('Binary Image')
subplot(2,2,3)
imshow(Filter1)
title('Filtered Image')
subplot(2,2,4)
imshow(T1)
title('Line Detected Image - Horizontal')


A2=imread('y.jpeg');
I2=imbinarize(rgb2gray(A1));

M2 = [ 1 -2 1; 1 -2 1; 1 -2 1];
Filter2=imfilter(I2,M2);

F2=abs(Filter2);
X2=max(F2);
T2=F2>=X2;

figure(3) 
subplot(2,2,1)
imshow(A2)
title('Image')
subplot(2,2,2)
imshow(I2)
title('Binary Image')
subplot(2,2,3)
imshow(Filter2)
title('Filtered Image')
subplot(2,2,4)
imshow(T2)
title('Line Detected Image - Vertical')

A3 = imread('y.jpeg');
I3=imbinarize(rgb2gray(A3));

grayImg = rgb2gray(A3);

M3 = edge(grayImg, "prewitt");
M4 = edge(grayImg, "sobel");
M5 = edge(grayImg, "roberts");
M6 = edge(grayImg, "log");
M7 = edge(grayImg, "canny");
M8 = edge(grayImg, "zerocross");


figure(4)
subplot(3,3,1)
imshow(A3)
title('Original Image')

subplot(3,3,2)
imshow(I3)
title('Binary Image')

subplot(3,3,3)
imshow(M3)
title('Prewitt Edge')

subplot(3,3,4)
imshow(M4)
title('Sobel Edge')

subplot(3,3,5)
imshow(M5)
title('Roberts Edge')

subplot(3,3,6)
imshow(M6)
title('LoG Edge')

subplot(3,3,7)
imshow(M7)
title('Canny Edge')

subplot(3,3,8)
imshow(M8)
title('ZeroCross Edge')

