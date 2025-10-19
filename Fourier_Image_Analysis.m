clc
close all
clear all
A=imread("y.jpeg");
figure
subplot(1,3,1)
imshow(A)
title('Original Image --221FA16013')
X=fft2(A);
subplot(1,3,2)
imshow(X)
title('Transformed Image --221FA16013')
Y=ifft2(X);
Y=real(Y);
Y=uint8(Y);
subplot(1,3,3)
imshow(Y)
title('Inverse Transformed Image --221FA16013')


C=zeros(512,512);
D=ones(512,512);
I=[C,C,C; C,D,C; C,C,C];
J=[D,D,D; D,C,D; D,D,D];
figure
subplot(2,3,1)
imshow(I)
title('Original Image --221FA16013')
subplot(2,3,4)
imshow(J)
title('Original Image --221FA16013')

S=fft2(I);
subplot(2,3,2)
imshow(S)
title('Transformed Image --221FA16013')
Z=ifft2(S);
subplot(2,3,3)
imshow(Z)
title('Inverse Transformed Image --221FA16013')

R=fft2(J);
subplot(2,3,5)
imshow(R)
title('Transformed Image --221FA16013')
L=ifft2(R);
subplot(2,3,6)
imshow(L)
title('Inverse Transformed Image --221FA16013')













clc;
close all;
clear all;

% ---------------------- Part 1: FFT on Real Image ---------------------- %
A = imread("y.jpeg");
A = im2gray(A); % Ensure grayscale
figure
subplot(1,3,1)
imshow(A)
title('Original Image --221FA16013')

X = fft2(A);
subplot(1,3,2)
imshow(log(1 + abs(X)),[]) % Displaying magnitude spectrum for visibility
title('Transformed Image --221FA16013')

Y = ifft2(X);
Y = real(Y);
Y = uint8(Y);
subplot(1,3,3)
imshow(Y)
title('Inverse Transformed Image --221FA16013')

% ---------------------- Part 2: Synthetic Image (512x512) ---------------------- %
C = zeros(512,512);
D = ones(512,512);
I = [C,C,C; C,D,C; C,C,C];
J = [D,D,D; D,C,D; D,D,D];

figure
subplot(2,3,1)
imshow(I)
title('Synthetic Image I --221FA16013')
subplot(2,3,4)
imshow(J)
title('Synthetic Image J --221FA16013')

S = fft2(I);
subplot(2,3,2)
imshow(log(1+abs(S)),[])
title('FFT of I --221FA16013')
Z = ifft2(S);
subplot(2,3,3)
imshow(real(Z),[])
title('IFFT of I --221FA16013')

R = fft2(J);
subplot(2,3,5)
imshow(log(1+abs(R)),[])
title('FFT of J --221FA16013')
L = ifft2(R);
subplot(2,3,6)
imshow(real(L),[])
title('IFFT of J --221FA16013')

% ---------------------- Part 3: Synthetic Image (256x256) ---------------------- %
A = zeros(256,256);
B = ones(256,256);
I = [A,A,A; A,B,A; A,A,A];
J = [B,B,B; B,A,B; B,B,B];

figure
subplot(2,3,1)
imshow(I)
title('Synthetic Image I (256x256) --221FA16013')
subplot(2,3,4)
imshow(J)
title('Synthetic Image J (256x256) --221FA16013')

C = fft2(I);
subplot(2,3,2)
imshow(log(1+abs(C)),[])
title('FFT of I --221FA16013')
D = ifft2(C);
subplot(2,3,3)
imshow(real(D),[])
title('IFFT of I --221FA16013')

E = fft2(J);
subplot(2,3,5)
imshow(log(1+abs(E)),[])
title('FFT of J --221FA16013')
F = ifft2(E);
subplot(2,3,6)
imshow(real(F),[])
title('IFFT of J --221FA16013')

% ---------------------- Part 4: Synthetic Image (100x100) ---------------------- %
G = zeros(100,100);
H = ones(100,100);
L = [G,G,G; G,H,G; G,G,G];
M = [H,H,H; H,G,H; H,H,H];

figure
subplot(2,3,1)
imshow(L)
title('Synthetic Image L (100x100) --221FA16013')
subplot(2,3,4)
imshow(M)
title('Synthetic Image M (100x100) --221FA16013')

N = fft2(L);
subplot(2,3,2)
imshow(log(1+abs(N)),[])
title('FFT of L --221FA16013')
O = ifft2(N);
subplot(2,3,3)
imshow(real(O),[])
title('IFFT of L --221FA16013')

P = fft2(M);
subplot(2,3,5)
imshow(log(1+abs(P)),[])
title('FFT of M --221FA16013')
Q = ifft2(P);
subplot(2,3,6)
imshow(real(Q),[])
title('IFFT of M --221FA16013')

% ---------------------- Part 5: Real Image at Multiple Scales ---------------------- %
A = imread("y.jpeg");
A = im2gray(A); % Ensure grayscale
A1 = imresize(A,[256 256]);
B = imresize(A,[64 64]);
C = imresize(A,[1024 1024]);

% -- A1 --
figure
subplot(1,3,1)
imshow(A1)
title('Original (256x256) --221FA16013')
X = fft2(A1);
subplot(1,3,2)
imshow(log(1+abs(X)),[])
title('FFT --221FA16013')
Y = ifft2(X);
Y = real(Y);
Y = uint8(Y);
subplot(1,3,3)
imshow(Y)
title('IFFT --221FA16013')

% -- B --
figure
subplot(1,3,1)
imshow(B)
title('Original (64x64) --221FA16013')
D = fft2(B);
subplot(1,3,2)
imshow(log(1+abs(D)),[])
title('FFT --221FA16013')
E = ifft2(D);
E = real(E);
E = uint8(E);
subplot(1,3,3)
imshow(E)
title('IFFT --221FA16013')

% -- C --
figure
subplot(1,3,1)
imshow(C)
title('Original (1024x1024) --221FA16013')
F = fft2(C);
subplot(1,3,2)
imshow(log(1+abs(F)),[])
title('FFT --221FA16013')
G = ifft2(F);
G = real(G);
G = uint8(G);
subplot(1,3,3)
imshow(G)
title('IFFT --221FA16013')



