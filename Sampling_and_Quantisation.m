clc
close all
clear all

A =imread("spine.jpeg");
A1=imresize(A,[1024 1024]);
A2=imresize(A,[1024 1024]/2);
A3=imresize(A,[1024 1024]/4);
A4=imresize(A,[1024 1024]/8);
A5=imresize(A,[1024 1024]/16);
A6=imresize(A,[1024 1024]/32);
A7=imresize(A,[1024 1024]/64);
A8=imresize(A,[1024 1024]/128);

figure
subplot(3,3,1)
imshow(A)
title('Original Image --221FA16013')

subplot(3,3,2)
imshow(A1)
title('Resized Image --221FA16013')

subplot(3,3,3)
imshow(A2)
title('Resized Image x 2 --221FA16013')

subplot(3,3,4)
imshow(A3)
title('Resized Image x 4 --221FA16013')

subplot(3,3,5)
imshow(A4)
title('Resized Image x 8 --221FA16013')
subplot(3,3,6)
imshow(A5)
title('Resized Image x 16 --221FA16013')

subplot(3,3,7)
imshow(A6)
title('Resized Image x 32 --221FA16013')

subplot(3,3,8)
imshow(A7)
title('Resized Image x 64 --221FA16013')

subplot(3,3,9)
imshow(A8)
title('Resized Image x 128 --221FA16013')

A =imread("spine.jpeg");
A1=gray2ind(A);
A2=gray2ind(A,2^7);
A3=gray2ind(A,2^6);
A4=gray2ind(A,2^5);
A5=gray2ind(A,2^4);
A6=gray2ind(A,2^3);
A7=gray2ind(A,2^2);
A8=gray2ind(A,2^1);

figure
subplot(3,3,1)
imshow(A)
title('Original Image --221FA16013')

subplot(3,3,2)
imshow(A1)
title('Indexed image --221FA16013')

subplot(3,3,3)
imshow(A2)
title('Indexed Image x 2^7 --221FA16013')

subplot(3,3,4)
imshow(A3)
title('Indexed Image x 2^6 --221FA16013')

subplot(3,3,5)
imshow(A4)
title('Indexed Image x 2^5 --221FA16013')

subplot(3,3,6)
imshow(A5)
title('Indexed Image x 2^4 --221FA16013')

subplot(3,3,7)
imshow(A6)
title('Indexed Image x 2^3 --221FA16013')

subplot(3,3,8)
imshow(A7)
title('Indexed Image x 2^2 --221FA16013')

subplot(3,3,9)
imshow(A8)
title('Indexed Image x 2^1 --221FA16013')

A = imread('spine.jpeg');

% Quantization Levels 
levels = [256, 128, 64, 32, 16, 8, 4, 3, 2];

figure
for i = 1:length(levels)
    q_level = levels(i);
    Aq = floor(double(A) / (256/q_level)) * (256/q_level);  
    Aq = uint8(Aq); 
    
    subplot(3,3,i)
    imshow(Aq)
    title(sprintf('221FA16047 -- %d Quantised level', q_level))
end


A = imread("spine.jpeg");
A_base = imresize(A, [64 64]); 

A1 = imresize(A_base, 2);      
A2 = imresize(A_base, 4);     
A3 = imresize(A_base, 8);      
A4 = imresize(A_base, 16);     
A5 = imresize(A_base, 32);    
A6 = imresize(A_base, 64);    
A7 = imresize(A_base, 128);    

figure
subplot(3,3,1)
imshow(A)
title('Original Image --221FA16013')
subplot(3,3,2)
imshow(A_base)
title('64x64')
subplot(3,3,3)
imshow(A1)
title('Upsampled x2')
subplot(3,3,4)
imshow(A2)
title('Upsampled x4 ')
subplot(3,3,5)
imshow(A3)
title('Upsampled x8 ')
subplot(3,3,6)
imshow(A4)
title('Upsampled x16 ')
subplot(3,3,7)
imshow(A5)
title('Upsampled x32 ')
subplot(3,3,8)
imshow(A6)
title('Upsampled x64 ')
subplot(3,3,9)
imshow(A7)
title('Upsampled x128')

