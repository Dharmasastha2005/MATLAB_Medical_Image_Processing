clc; 
clear; close all;

A = randi([0 255], 100, 100);       % Random 0–255 grayscale matrix
igray = mat2gray(A);  
figure(1)
imshow(igray),
title('Select Seed Point');
[x, y] = ginput(1);                 % User picks a seed
seed = A(round(y), round(x));       % Seed intensity

thresh = 20;                        % Threshold value
mask = abs(A - seed) < thresh;      % Region where difference < threshold

imshow(mask), 
title('Region Grown (Threshold-based)');



I = imread('tumor.jpg');
igray = rgb2gray(I);
figure(2)
imshow(igray), 
title('Select Seed Point');
[x, y] = ginput(1);

J = regiongrowing(igray, round(y), round(x), 20);   % 10 = threshold
imshow(J), title('Region Grown Image');

function J = regiongrowing(I, x, y, thresh)
    seed = I(x, y);
    J = abs(double(I) - double(seed)) < thresh;
end

