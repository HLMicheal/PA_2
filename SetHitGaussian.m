Coupled = 1;
TwoCarriers = 1;
RC = 1;

nx = 201;
l = 1e-6;

x =linspace(0,l,nx);
dx = x(2)-x(1);
xm = x(1:nx-1) + 0.5*dx;

% Nd = 1e16 * 1e6; % Const. 1/cm3 (100 cm/m)^3
% Nd = 1 + 10e14 * x;
% NetDoping = ones(1,nx).*Nd; % doping
NetDoping = linspace(1e16,20e16,nx)
x0 = l/2;
nw = l/20;
npDisturbance = 0e16*1e6*exp(-((x-x0)/nw).^2);

LVbc = 0;
RVbc = 0;

TStop = 14200000*1e-18;
PlDelt = 100000*1e-18;

PlotYAxis = {[-1e-6 1e-6] [-10 10] [-0.01 0.01]...
    [0 2e17] [0 4e15] [0 5.1e31]...
    [-2e27 2e27] [-5e25 5e25] [-100 100] ...
    [-2 2] [0 0.012] [0 2e17]};

doPlotImage = 0;
PlotFile = 'Gau2CarRC.gif';
