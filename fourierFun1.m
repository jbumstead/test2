%% practicing Fourier series

time=0:.01:1;

c1=colormap('jet');
cInd=round(linspace(1,64,3));


figure; hold on
for k=1:3
plot(time,sin(2*pi*k*time),'Color',c1(cInd(k),:),'LineWidth',2)
end

