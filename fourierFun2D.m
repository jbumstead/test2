% clear all
% close all
% 
% A = imread('/Users/JonBumstead/Desktop/annie.jpg');
% A = imread('/Users/JonBumstead/Desktop/test5.jpg');


% BW=rgb2gray(A);
figure;
BW=A;
imagesc(BW); colormap('gray'); axis image off

F=fft2(BW);
F=fftshift(F);
Fmag=abs(F);
Fphase=(angle(F));

figure;
subplot(1,2,1);
imagesc((Fmag)); colormap('gray'); axis image off
subplot(1,2,2);
imagesc(Fphase); colormap('gray'); axis image off

% figure;
% subplot(1,2,1);
% imagesc(real(F)); colormap('gray'); axis image off
% subplot(1,2,2);
% imagesc(imag(F)); colormap('gray'); axis image off

%% Attempt a reconstruction?
[nPx, nPy]=size(BW);
F2=fft2(BW);
F2mag=abs(F);
F2mag=F2mag(1:floor(nPx/2),1:floor(nPy/2));
F2phase=(angle(F));
F2phase=F2phase(1:floor(nPx/2),1:floor(nPy/2));

xLength=1;
yLength=xLength*nPy/nPx;
fxMax=.5*xLength*nPx;
fyMax=.5*yLength*nPy;

xArr=linspace(0,xLength,nPx);
yArr=linspace(0,yLength,nPy);

xFarr=linspace(0,fxMax,floor(nPx/2));
yFarr=linspace(0,fyMax,floor(nPy/2));

%%% Building blocks:
% figure;
% for j=1:length(xFarr)
% trace=cos(2*pi*xFarr(j)*xArr);
% plot(xArr,trace);
% ylim([-1 1])
% pause;
% clf
% end

IMout=zeros(nPx,nPy);
for j=1:length(xFarr)
    clear temp trace
trace=F2mag(j,1)*cos(2*pi*xFarr(j)*xArr+F2phase(j,1));
temp=repmat(trace,nPy,1);
IMout=temp'+IMout;
%imagesc(IMout); axis image off
end

for j=1:length(yFarr)
    clear temp trace
trace=F2mag(1,j)*cos(2*pi*yFarr(j)*yArr+F2phase(1,j));
temp=repmat(trace,nPx,1);
IMout=temp+IMout;
% imagesc(IMout); axis image off
end

figure;
imagesc(IMout'); axis image off
colormap('gray')

