clear all
close all
 
f = imread('lenna.bmp');
[out_1, outtop_1] = hadamard_encoding(f, 1);
[out_2, outtop_2] = hadamard_encoding(f, 2);
[out_3, outtop_3] = hadamard_encoding(f, 3);
[out_4, outtop_4] = hadamard_encoding(f, 4);
[out_5, outtop_5] = hadamard_encoding(f, 5);

figure;
imshow(mat2gray(f));

figure;
subplot(2, 5, 1); imshow(mat2gray(out_1)); 
subplot(2, 5, 2); imshow(mat2gray(out_2));
subplot(2, 5, 3); imshow(mat2gray(out_3));
subplot(2, 5, 4); imshow(mat2gray(out_4));
subplot(2, 5, 5); imshow(mat2gray(out_5));
subplot(2, 5, 6); imshow(mat2gray(outtop_1));
subplot(2, 5, 7); imshow(mat2gray(outtop_2));
subplot(2, 5, 8); imshow(mat2gray(outtop_3));
subplot(2, 5, 9); imshow(mat2gray(outtop_4));
subplot(2, 5, 10); imshow(mat2gray(outtop_5));
