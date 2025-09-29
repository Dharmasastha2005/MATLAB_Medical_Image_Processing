clc
close all
clear all

C=zeros(512,512);
D=ones(512,512);
I=[C,C,C,C,C; C,D,C,D,C; C,C,D,C,C; C,D,C,D,C; C,C,C,C,C];
figure
subplot(1,2,1)
imshow(I)
title('Image Matrix --221FA16022')

mask=fspecial("average",[3 3]);
O=imfilter(I,mask);
subplot(1,2,2)
imshow(O)
title('Filtered Image Matrix --221FA16022')

A=imread("x.jpeg");
A = im2gray(A); 
A1 = imresize(A,[256 256]);
figure
subplot(2,2,1)
imshow(A1)
title('Original Image --221FA16022')

IMmask=fspecial("average",[3 3]);
Result=imfilter(A1,IMmask);
subplot(2,2,2)
imshow(Result)
title('Avg Filtered Image --221FA16022')


X=imnoise(A1, 'salt & pepper', 0.02);
subplot(2,2,3)
imshow(X);
title('Salt and Pepper Noise Image --221FA16022')
output= medfilt2(X);
subplot(2,2,4)
imshow(output)
title('Median Filtered Image --221FA16022')

clc;
close all;
clear all;

% Read and preprocess image
A = imread("x.jpeg");
A = im2gray(A);
A = imresize(A,[256 256]);

figure;
%subplot(3,6,1);
imshow(A);
title('Original Image-221FA16022');

figure
% 1. Salt & Pepper Noise
sp = imnoise(A,'salt & pepper',0.02);
subplot(5,4,1); imshow(sp); title('Salt & Pepper');

sp_med = medfilt2(sp);
subplot(5,4,2); imshow(sp_med); title('Median');

avgMask = fspecial('average',[3 3]);
sp_avg = imfilter(sp,avgMask);
subplot(5,4,3); imshow(sp_avg); title('Avg');


wavgMask = fspecial('gaussian',[3 3],0.5);
sp_wavg = imfilter(sp,wavgMask);
subplot(5,4,4); imshow(sp_wavg); title('Weighted Avg');

% 2. Gaussian Noise
gn = imnoise(A,'gaussian',0,0.01);
subplot(5,4,5); imshow(gn); title('Gaussian');

gn_med = medfilt2(gn);
subplot(5,4,6); imshow(gn_med); title('Median');

gn_avg = imfilter(gn,avgMask);
subplot(5,4,7); imshow(gn_avg); title('Avg');

gn_wavg = imfilter(gn,wavgMask);
subplot(5,4,8); imshow(gn_wavg); title('Weighted Avg');

% 3. White Noise (simulate with randn)
wn = double(A)/255 + 0.05*randn(size(A));
wn = im2uint8(mat2gray(wn));
subplot(5,4,9); imshow(wn); title('White');

wn_med = medfilt2(wn);
subplot(5,4,10); imshow(wn_med); title('Median');

wn_avg = imfilter(wn,avgMask);
subplot(5,4,11); imshow(wn_avg); title('Avg');

wn_wavg = imfilter(wn,wavgMask);
subplot(5,4,12); imshow(wn_wavg); title('Weighted Avg');

% 4. Gamma Noise (simulate with gamrnd)
gammaNoise = im2uint8(mat2gray(double(A)/255 + 0.05*gamrnd(2,2,size(A))));
subplot(5,4,13); imshow(gammaNoise); title('Gamma');

g_med = medfilt2(gammaNoise);
subplot(5,4,14); imshow(g_med); title('Median');

g_avg = imfilter(gammaNoise,avgMask);
subplot(5,4,15); imshow(g_avg); title('Avg');

g_wavg = imfilter(gammaNoise,wavgMask);
subplot(5,4,16); imshow(g_wavg); title('Weighted Avg');

% 5. Uniform Noise
uni = double(A)/255 + 0.05*rand(size(A));
uni = im2uint8(mat2gray(uni));
subplot(5,4,17); imshow(uni); title('Uniform');

u_med = medfilt2(uni);
subplot(5,4,18); imshow(u_med); title('Median');

u_avg = imfilter(uni,avgMask);
subplot(5,4,19); imshow(u_avg); title('Avg');

u_wavg = imfilter(uni,wavgMask);
subplot(5,4,20); imshow(u_wavg); title('Weighted Avg');


