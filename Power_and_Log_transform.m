clc
close all
clear all

A =imread("Y.jpeg");
A1=255-A;
A2=double(A)/255;
A3=power(A2, 0.3);
A4=power(A2, 1);
A5=power(A2, 2.4);

Aa=im2double(A);
C=0.5;
A6=C.*log(Aa + 1);
C=1;
A7=C.*log(Aa + 1);
C=2.5;
A8=C.*log(Aa + 1);

subplot(3,3,1)
imshow(A);
title("Original Image")

subplot(3,3,3)
imshow(A1);
title("Image Negetive ")

subplot(3,3,4)
imshow(A3);
title("Power Law Transformation-(0.3)")

subplot(3,3,5)
imshow(A4);
title("Power Law Transformation-(1) ")

subplot(3,3,6)
imshow(A5);
title("Power Law Transformation-(2.4) ")


subplot(3,3,7)
imshow(A6);
title("Log Transformation(C=0.5) ")

subplot(3,3,8)
imshow(A7);
title("Log Transformation(C=1)")

subplot(3,3,9)
imshow(A8);
title("Log Transformation(C=2.5) ")

% For Dataset
clc;
clear;
close all;

inputFolder = 'Dataset';
outputFolder = 'Dataset_results'; 

fileList = dir(fullfile(inputFolder, '*.jpg'));

C_values = [0.5, 1, 2.5];     
gamma_values = [0.3, 1, 2.4]; 

for i = 1:length(fileList)
    filename = fileList(i).name;
    imgPath = fullfile(inputFolder, filename);
    A = imread(imgPath);

    if size(A, 3) == 3
        A = rgb2gray(A);
    end

    A_neg = 255 - A;
    imwrite(A_neg, fullfile(outputFolder, ['NEG_' filename]));

    A_norm = im2double(A);
    for g = gamma_values
        A_power = A_norm .^ g;
        outName = sprintf('POW_g%.1f_%s', g, filename);
        imwrite(A_power, fullfile(outputFolder, outName));
    end

    for C = C_values
        A_log = C .* log(1 + A_norm);
        A_log = mat2gray(A_log); 
        outName = sprintf('LOG_C%.1f_%s', C, filename);
        imwrite(A_log, fullfile(outputFolder, outName));
    end
end

disp('All transformations saved in Dataset_results folder.');
