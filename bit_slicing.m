%%% 12/1/2020; Renuka Soman
%%% Bit slicing of an image and then reconstructing back the image from all
%%% the planes

clc; clear all; close all;
img=imread('lena.jpg');   %reading the original image
gray_img=rgb2gray(img);    %grayscale of original image
subplot(2,5,1);
imshow((gray_img));
gray_img=double(gray_img);
bin_img=fliplr(de2bi(gray_img));   %converting pixel values in decimal to binary

plane1=[];     %plane for msb bit
plane1=bin_img(:,1);
mat1=(vec2mat(plane1,225));
subplot(2,5,2);
imshow((mat1'));   %image using the msb bits of all pixel values

plane2=[];
plane2=bin_img(:,2);
mat2=(vec2mat(plane2,225));
subplot(2,5,3);
imshow((mat2'));

plane3=[];
plane3=bin_img(:,3);
mat3=(vec2mat(plane3,225));
subplot(2,5,4);
imshow((mat3'));

plane4=[];
plane4=bin_img(:,4);
mat4=(vec2mat(plane4,225));
subplot(2,5,5);
imshow((mat4'));

plane5=[];
plane5=bin_img(:,5);
mat5=(vec2mat(plane5,225));
subplot(2,5,6);
imshow((mat5'));

plane6=[];
plane6=bin_img(:,6);
mat6=(vec2mat(plane6,225));
subplot(2,5,7);
imshow((mat6'));

plane7=[];
plane7=bin_img(:,7);
mat7=(vec2mat(plane7,225));
subplot(2,5,8);
imshow((mat7'));

plane8=[];     %plane for lsb bit
plane8=bin_img(:,8);
mat8=(vec2mat(plane8,225));
subplot(2,5,9);
imshow((mat8'));     %image using the lsb bits of all pixel values

recomb=[];
%%%%%reconstructing the image by not using the lsb plane
recomb = ((2 * (2 * (2 * (2 * (2 * (2 * mat1 + mat2) + mat3) + mat4) + mat5) + mat6) + mat7));

%%%reconstructing the image by using all the planes
% cc = (2*(2 * (2 * (2 * (2 * (2 * (2 * f1 + f2) + f3) + f4) + f5) + f6) + f7)+f8);
% cc = ((2 * (2 * (2 * (2 * (2 * (2 * f7 + f6) + f5) + f4) + f3) + f2) + f1));
subplot(2,5,10);
imshow(uint8(recomb'));      %plotting the image after recombination of all planes except lsb plane
















% A = imread('lena.jpg');
% C = bitget(A,1);
% 
% clc;
% %[file path]=uigetfile('*.*');
% a=imread('lena.jpg');
% a=rgb2gray(a);
% [r c p]=size(a);
% if (p==3)
%     error('Input image should be Grayscale')
% else
%     [pl1,pl2,pl3,pl4,pl5,pl6,pl7,pl8]=bitplane_code(a);
% end
% figure;
%     subplot(3,3,1);imshow(pl1);title('1st pln');
%     subplot(3,3,2);imshow(pl2);title('2nd pln');
%     subplot(3,3,3);imshow(pl3);title('3rd pln');
%     subplot(3,3,4);imshow(pl4);title('4th pln');
%     subplot(3,3,5);imshow(pl5);title('5th pln');
%     subplot(3,3,6);imshow(pl6);title('6th pln');
%     subplot(3,3,7);imshow(pl7);title('7th pln');
%     subplot(3,3,8);imshow(pl8);title('8th pln')
%     rec=pl1+pl2*2+pl3*4+pl4*8+pl5*16+pl6*32+pl7*64+pl8*128;
%     subplot(3,3,9);imshow(uint8(rec));title('Rec Img')
%  
% %     [file path]=uiputfile('*.bmp');
% %     imwrite(pl8,[path file])
% % pl6=b(:,:,6);
% % pl7=b(:,:,7);
% % pl8=b(:,:,8);
% 
% 
% 
% function [pl1 pl2 pl3 pl4 pl5 pl6 pl7 pl8]=bitplane_code(img)
% [row col]=size(img);
% b=zeros(row,col,8);
% 
% for k=1:8
%     for i=1:row
%         for j=1:col
%             b(i,j,k)=bitget(img(i,j),k);
%         end
%     end
% end
% pl1=b(:,:,1);
% pl2=b(:,:,2);
% pl3=b(:,:,3);
% pl4=b(:,:,4);
% pl5=b(:,:,5);
% pl6=b(:,:,6);
% pl7=b(:,:,7);
% pl8=b(:,:,8);
% end