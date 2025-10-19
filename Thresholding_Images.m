clc;
close all;
clear all;

i = imread("y.jpeg");
gray_i = rgb2gray(i);
subplot(2, 2, 1);
imshow(i);
title('Original Image-221FA16013')

level = graythresh(i); 
a = im2bw(i, level);  
subplot(2, 2, 2);
imshow(a);
title('Thresholded Image-221FA16013')


subplot(2, 2, 3)
imshow(i);
title('Original Image-221FA16013')

levels = multithresh(gray_i, 3);

disp('Thresholds for multi-thresholding:');
disp(levels);

b = imquantize(gray_i, levels); 
subplot(2, 2, 4)
imshow(b, []); 
title(['Multi Thresholded Image-221FA16013'])


i = imread("x.jpeg");
figure(2)
subplot(1, 2, 1);
imshow(i);
title("Original image-221FA16013");

im = rgb2gray(i);  
T = adaptthresh(im, 0.5);  
a = imbinarize(im, T);  
subplot(1, 2, 2);
imshow(a);
title("Adaptive Thresholding-221FA16013");
