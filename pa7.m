G=[10 -1 0 0;10 0 -1 0;100000 0 0 -1000.1;1 0 1.5 0];
C=[0 0 0 0;0.2 0 0 0;0 0 0 0;0 0 0.25 0];
% % % V=[I3;V3;V2;Vo];
figure(1)
for V1=-10:1:10
    FDC=[0;0;0;V1];
    DC=G\FDC;
    plot(V1,DC(4),'r*');
    hold on
    plot(V1,DC(2),'b*');
    hold on
end
xlabel('V1');
ylabel('Vo (red) & V3 (blue)');

figure(2)
for w=logspace(-2,4,1000)
    FAC=[0;0;0;1+0.25*w*1i];
    left=G+C*w*1i;
    AC=left\FAC;
    Vo=abs(AC(4));
    subplot(1,2,1),semilogx(w,Vo,'g*');
    title('Vo vs. log10(w)');
    hold on
    grid on
    subplot(1,2,2),semilogx(w,20*log10(Vo),'b*');
    title('(Vo/V1)dB vs. log10(w)');
    hold on
    grid on
end

w=pi;
n=500;
c=zeros(1,n);
gain=zeros(1,n);
for m=1:n
    c(m)=normrnd(0.25,0.05);
    nC=[0 0 0 0;0.2 0 0 0;0 0 0 0;0 0 c(m) 0];
    nFAC=[0;0;0;1+c(m)*w*1i];
    nleft=G+nC*w*1i;
    nAC=nleft\nFAC;
    nVo=abs(nAC(4));
    gain(m)=20*log10(nVo);
end
figure(3)
histogram(gain);