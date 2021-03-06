clear all
close all
 
f = imread('lenna.bmp');
m = 5;

%% ---------- How to transform an image with a Hadamard metrix ----------------------
size = 2^m;
fm = double(f(1:size, 1:size));     % Cropping an mxm top-left image (f).
Hm = (1/sqrt(size))*hadamard(size); % Generating an mxm hadamard matrix.
F = Hm*fm*Hm';                      % transforming the image, fm, to Hadamard domain by Hm.
 
%% ---------- Energy Preservation -----------------------------
e1 = sum(sum(fm.^2));
e2 = sum(sum(F.^2));
 
%% ---------- Energy Compaction -------------------------------
Q = zeros(size, size);          % A selection matrix
Q(1:size/2, 1:size/2) = 1;

% Q = [1 1 0 0 0 0 0 0;         
%      1 0 0 0 0 0 0 0; 
%      0 0 0 0 0 0 0 0;
%      0 0 0 0 0 0 0 0;
%      0 0 0 0 0 0 0 0;
%      0 0 0 0 0 0 0 0;
%      0 0 0 0 0 0 0 0;
%      0 0 0 0 0 0 0 0]; 

Top3 = (F.*Q);               % Selecting top-3 of Hadamard coofficients.
e_Top3 = sum(sum(Top3.^2));  % Energy of top-3 coefficients.
E_compact = (e_Top3/e1)*100; % Calculating percentage of energy compaction.

figure;
subplot(1, 2, 1); imshow(mat2gray(F));
subplot(1, 2, 2); imshow(mat2gray(Top3));

%% ----------- Image Restoration ------------------------------
fo = Hm'*F*Hm
ft = Hm'*Top3*Hm;

figure;
subplot(1, 3, 1); imshow(mat2gray(fm));
subplot(1, 3, 2); imshow(mat2gray(fo));
subplot(1, 3, 3); imshow(mat2gray(ft));
