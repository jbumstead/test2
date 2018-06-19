%% Gaussian Beams
close all
w0=3*10^-3; % mm
lambda=633*10^-9;

z=5:.01:200; %distance from laser aperture

R=z.*(1+(pi.*w0^2./(lambda.*z)).^2);
w=w0*(1+(lambda.*z./(pi*w0^2)).^2).^.5;
wApp=lambda*z./(pi*w0);

jfigure;
subplot(2,1,1)
plot(z,R); hold on;
plot(z,z,'-r'); 
xlabel('Distance from aperture (m)')
ylabel('Radius of wavefront (m)')
legend({'Theoretical','Approximation'})

subplot(2,1,2)
plot(z,w); hold on;
plot(z,wApp,'-r'); 
xlabel('Distance from aperture (m)')
ylabel('Beam Waist (m)')
legend({'Theoretical','Approximation'})

%% Diffraction Gratings
close all
clear theta thetaD
theta0D=0;
theta0=rad2deg(theta0D);
lambda=633*10^-9;
lambda2=400*10^-9;
spacing=lambda*20; % diffraction grating spacing

q=-3:1:3;

theta(:,1)=theta0+q*lambda/spacing;
theta(:,2)=theta0+q*lambda2/spacing;
thetaD=rad2deg(theta);

%%% Plot example
Lg=1*10^-3; % length of diffraction grating
d=0.001; % distance to screen and diffraction grating
Sg=-Lg/2:spacing:Lg/2; % points on diffraction grating
z=tan(theta)*d;

jfigure; hold on;
plot(zeros(length(Lg),1),Sg,'ok'); 
% plot(ones(length(z),1)*d,z,'or')
for j=1:length(z)
    
    plot([0 d],[0 z(j,1)],'-r');
    plot([0 d],[0 z(j,2)],'-b');
    
end


%% Add a new big part

x = 1:10;
y =2:2:20;

plot(x,y);

%% Add another part

x = 1:10;
y =2:2:20;

plot(x,y);

