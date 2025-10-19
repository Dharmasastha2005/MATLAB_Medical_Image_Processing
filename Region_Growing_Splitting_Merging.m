clc
close all
clear all

I = uint8(randi([0 255], 7,7));  
figure
subplot(2,1,1)
imshow(I, []); 
title('Grayscale Image Matrix');

seed = [1,5];                     
T = 70;                         

mask = abs(double(I) - double(I(seed(1), seed(2)))) < T;
subplot(2,1,2)
imshow(mask, []);
title('Region Grown Output');




I = [0 1 2 0; 2 5 6 1; 1 4 7 3; 0 2 5 1];
igray = mat2gray(I);  
figure(2)
subplot(2,1,1)
imshow(igray, []), 
title('Image Matrix');

seed = 7;      
threshold = 2; 
region = (I >= (seed - threshold)) & (I <= (seed + threshold));
subplot(2,1,2)
imshow(region),
title('Region Grown from Seed = 7');



A = imread("tumor.jpg");
grayA = rgb2gray(A);
igray = mat2gray(grayA);
figure(3)
subplot(2,1,1)
imshow(igray, []), 
title('Image');

seed = [7,9];      
threshold = 120;

mask1 = abs(double(grayA) - double(grayA(seed(1), seed(2)))) < threshold;
subplot(2,1,2)
imshow(mask1),
title('Region Grown from Seed');








I = uint8(randi([0 255], 8, 8));

figure;
subplot(2,1,1);
imshow(I, []);
title('Random Grayscale Image');

low1 = 0;     high1 = 85;    % Region 1: Dark
low2 = 86;    high2 = 170;   % Region 2: Medium
low3 = 171;   high3 = 255;   % Region 3: Bright

% Masks
region1 = I >= low1  & I <= high1;
region2 = I >= low2  & I <= high2;
region3 = I >= low3  & I <= high3;

result = uint8(region1)*85 + uint8(region2)*170 + uint8(region3)*255;

subplot(2,1,2);
imshow(result, []);
title('Region Splitting on Random Image ');



A = imread("tumor.jpg");
grayA = rgb2gray(A);
figure;
subplot(2,1,1);
imshow(grayA, []);
title('Original Image');

low1 = 0;     high1 = 85;    % Region 1: Dark
low2 = 86;    high2 = 170;   % Region 2: Medium
low3 = 171;   high3 = 255;   % Region 3: Bright

% Masks
region1 = grayA >= low1  & grayA <= high1;
region2 = grayA >= low2  & grayA <= high2;
region3 = grayA >= low3  & grayA <= high3;

result = uint8(region1)*85 + uint8(region2)*170 + uint8(region3)*255;

subplot(2,1,2);
imshow(result, []);
title('Very Simple Region Splitting by Intensity');















%Merging
I = uint8(randi([0 255], 8, 8));
figure;
subplot(2,1,1);
imshow(I, []);
title('Random Grayscale Image');


seed1 = 50;
seed2 = 130;
seed3 = 220;


T = 40;

region1 = abs(double(I) - seed1) < T;
region2 = abs(double(I) - seed2) < T;
region3 = abs(double(I) - seed3) < T;

result = uint8(region1)*85 + uint8(region2)*170 + uint8(region3)*255;

subplot(2,1,2);
imshow(result, []);
title('Simple Region Merging');



A = imread("tumor.jpg");
grayA = rgb2gray(A);

figure;
subplot(2,1,1);
imshow(grayA, []);
title('Tumor Image (Grayscale)');

seed1 = 50;
seed2 = 130;
seed3 = 220;

T = 40;

region1 = abs(double(grayA) - seed1) < T;
region2 = abs(double(grayA) - seed2) < T;
region3 = abs(double(grayA) - seed3) < T;

merged = uint8(region1)*85 + uint8(region2)*170 + uint8(region3)*255;

subplot(2,1,2);
imshow(merged, []);
title('Region Merged Output');


