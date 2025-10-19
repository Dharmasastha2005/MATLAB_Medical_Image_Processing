clc; clear; close all;

I = [0 1 2 0; 2 5 6 1; 1 4 7 3; 0 2 5 1];
seed = 7;           % intensity of seed point
T = 2;              % threshold
[row, col] = find(I == seed); % find seed position

% region growing based on threshold difference
mask = abs(I - seed) <= T;    % thresholding

% find connected region (4-connectivity)
CC = bwconncomp(mask, 4);
region = false(size(I));
for k = 1:CC.NumObjects
    if ismember(sub2ind(size(I), row, col), CC.PixelIdxList{k})
        region(CC.PixelIdxList{k}) = true;
    end
end

disp('Original Image Matrix:');
disp(I);
disp('Region Grown Mask:');
disp(region);

% Show min-max range
minVal = min(I(region));
maxVal = max(I(region));
fprintf('Min intensity in region: %d\nMax intensity in region: %d\n', minVal, maxVal);




I = [0 1 2 0; 2 5 6 1; 1 4 7 3; 0 2 5 1];
igray = mat2gray(I);  
figure(2)

subplot(3,2,1)
imshow(igray, []), 
title('Image Matrix');

seed = 5;      
threshold = 2; 
region = (I >= (seed - threshold)) & (I <= (seed + threshold));
subplot(3,2,2)
imshow(region),
title('Region Grown from Seed = 7');

% Simple image splitting into 4 quadrants
topLeft = I(1:2, 1:2);
topRight = I(1:2, 3:4);
bottomLeft = I(3:4, 1:2);
bottomRight = I(3:4, 3:4);

X = mat2gray(topLeft)
Y = mat2gray(topRight)
Z = mat2gray(bottomLeft)
W = mat2gray(bottomRight)

subplot(3,2,3)
imshow(X, [])
title('Top Left Quadrant');

subplot(3,2,4)
imshow(Y, [])
title('Top Right Quadrant');

subplot(3,2,5)
imshow(Z , [])
title('Bottom Left Quadrant');

subplot(3,2,6)
imshow(W, [])
title('Bottom Right Quadrant');

