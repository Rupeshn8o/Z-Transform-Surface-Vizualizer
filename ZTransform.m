clc; close all; clear all;

num=[1];
den=[1 -0.8];
%% Grid
N=400;
[Si,W]=meshgrid(linspace(-2,2,N),linspace(-2,2,N));
Z=Si+1j*W;
H=polyval(num,Z)./polyval(den,Z);

ph=mod(angle(H),2*pi)/(2*pi);
RGB=hsv2rgb(cat(3,ph,ones(size(ph)),ones(size(ph))));

roc=max(abs(roots(den)));

line=linspace(-2,2,200);
zc=exp(1j*line*pi);
Hc=polyval(num,zc)./polyval(den,zc);
Hr=polyval(num,roc*zc)./polyval(den,roc*zc);

%% Figure Layout
fig=figure('Color','k');

axMag=axes(fig,'Position',[0.08 0.32 0.38 0.65]);
axPhase=axes(fig,'Position',[0.50 0.32 0.38 0.65]);
axFreq=axes(fig,'Position',[0.10 0.07 0.78 0.18]);
axL=axes(fig,'Position',[0.02 0.32 0.025 0.65]);

phi=linspace(0,2*pi,600)';
[Xl,Yl]=meshgrid([0 1],phi);
RGBL=hsv2rgb(cat(3,repmat(phi/(2*pi),1,2),ones(600,2),ones(600,2)));

surf(axL,Xl,Yl,zeros(size(Xl)),RGBL,'EdgeColor','none');
view(2); axis tight
yticks([0 pi/2 pi 3*pi/2 2*pi])
yticklabels({'0','\pi/2','\pi','3\pi/2','2\pi'})
title('Phase','Color','w')
set(axL,'Color','k','XTick',[],'YColor','w')

%% Reimann Surface
axes(axMag)
surf(Si,W,abs(H),RGB,'EdgeColor','none')
axis equal;view(45,55)
zlim([0 5]);
title('|H(z)|');
xlabel('Re(z)');
ylabel('Im(z)');
camlight;lighting phong;

hold on;
plot3(real(zc),imag(zc),abs(Hc),'w');
plot3(real(roc*zc),imag(roc*zc),abs(Hr),'w');
hold off;

%% Phase Surface
axes(axPhase)
surf(Si,W,ph*(2*pi),RGB,'EdgeColor','none');
axis equal; view(45,55)
zlim([0 2*pi]);
title('\angleH(z)')
xlabel('Re(z)')
ylabel('Im(z)')
camlight;lighting phong;

hold on;
plot3(real(zc),imag(zc),mod(angle(Hc),2*pi),'w');
plot3(real(roc*zc),imag(roc*zc),mod(angle(Hr),2*pi),'w');
hold off;

%% Fourier Transform
axes(axFreq)
w=linspace(-pi,pi,3000);
ejw=exp(1j*w);
Hjw=polyval(num,ejw)./polyval(den,ejw);

yyaxis left;
plot(w/pi,abs(Hjw));
ylabel('|H(e^{j\omega})|');
yyaxis right;
plot(w/pi,unwrap(angle(Hjw)));
ylabel('\angleH(e^{j\omega})');
xlabel('Normalized Frequency (\times\pi)');
title('Unit Circle Slice');
legend('|H(e^{j\omega})|','\angleH(e^{j\omega})');
grid on;