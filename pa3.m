% ELEC4700 PA3
% Huanyu Liu

nx=50;
ny=50;
k=nx*ny;
G=sparse(k,k);

for i=1:nx
    for j=1:ny
        n = j + (i-1)*ny;
        nxm = j + (i-2)*ny;
        nxp = j + i*ny;
        nym = j-1+(i-1)*ny;
        nyp = j+1+(i-1)*ny;
        if i == 1 || i == nx
            G(n,n)=1;
        elseif j==1 || j==ny
            G(n,n)= 1;
        elseif i>10 && i<20 && j>10 && j<20
            G(n,n)=-2;
        else
            G(n,n)=-4;
            G(n,nxp)=1;
            G(n,nxm)=1;
            G(n,nym)=1;
            G(n,nyp)=1;
        end
    end
end
figure(1)
spy(G);
hold on
[E,D]=eigs(G,9,'SM');
evalue=zeros(1,9);

t1=reshape(E(:,1),nx,ny);
t2=reshape(E(:,2),nx,ny);
t3=reshape(E(:,3),nx,ny);
t4=reshape(E(:,4),nx,ny);
t5=reshape(E(:,5),nx,ny);
t6=reshape(E(:,6),nx,ny);
t7=reshape(E(:,7),nx,ny);
t8=reshape(E(:,8),nx,ny);
t9=reshape(E(:,9),nx,ny);

[X,Y]=meshgrid(1:1:50,1:1:50);
figure(2)
subplot(3,3,1),surf(X,Y,t1);
subplot(3,3,2),surf(X,Y,t2);
subplot(3,3,3),surf(X,Y,t3);
subplot(3,3,4),surf(X,Y,t4);
subplot(3,3,5),surf(X,Y,t5);
subplot(3,3,6),surf(X,Y,t6);
subplot(3,3,7),surf(X,Y,t7);
subplot(3,3,8),surf(X,Y,t8);
subplot(3,3,9),surf(X,Y,t9);
hold on
