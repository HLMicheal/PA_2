Is=0.01e-12;
Ib=0.1e-12;
Vb=1.3;
Gp=0.1;
V=linspace(-1.95,0.7,200);
I1=Is*(exp(1.2/0.025*V)-1)+Gp*V+Ib*exp(-1.2/0.025*(V+Vb));
I2=I1+(rand(1,200)-0.5)*0.4.*I1;
figure(1)
plot(V,I1,'b');
hold on
c1=polyfit(V,I1,4);
f1=polyval(c1,V);
plot(V,f1);
hold on
c2=polyfit(V,I1,8);
f2=polyval(c2,V);
plot(V,f2);
hold on
plot(V,I2,'g');
grid on
hold off
figure(2)
semilogy(V,abs(I1),'b');
hold on
c3=polyfit(V,abs(I1),4);
f3=polyval(c3,V);
plot(V,f3);
hold on
c4=polyfit(V,abs(I1),8);
f4=polyval(c4,V);
plot(V,f4);
hold on
semilogy(V,abs(I2),'g');
grid on
hold off

figure(3)
plot(V,I1,'r');
grid on
hold on
f0a=fittype('A.*(exp(1.2*x/25e-3)-1)+0.1*x-C*(exp(1.2*(-(x+1.3))/25e-3)-1)');
ffa=fit(V.',I1.',f0a);
Ifa=ffa(V);
plot(V,Ifa,'p');
hold on
f0b=fittype('A.*(exp(1.2*x/25e-3)-1)+B*x-C*(exp(1.2*(-(x+1.3))/25e-3)-1)');
ffb=fit(V.',I1.',f0b);
Ifb=ffb(V);
plot(V,Ifb,'g');
hold on
f0c=fittype('A.*(exp(1.2*x/25e-3)-1)+B*x-C*(exp(1.2*(-(x+D))/25e-3)-1)');
ffc=fit(V.',I1.',f0c);
Ifc=ffc(V);
plot(V,Ifc,'b');
hold off

inputs=V.';
targets=I1.';
hiddenLayerSize=10;
net=fitnet(hiddenLayerSize);
net.divideParam.trainRatio=70/100;
net.divideParam.valRatio=15/100;
net.divideParam.testRatio=15/100;
[net,tr]=train(net,inputs,targets);
outputs=net(inputs);
errors=gsubtract(outputs,targets);
performance=perform(net,targets,outputs);
view(net);
Inn=outputs;