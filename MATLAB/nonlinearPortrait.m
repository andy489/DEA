function nonlinearPortrait
    tmax=5;
    
    function z=ff(t,y) %y1'=y2; y2'=sin(y1+y2)
        z=[y(2); sin(y(1)+y(2))];
    end

k=1;
A=[0 1; (-1)^k, (-1)^k];

ak=k*pi;
bk=0;

    function u=lin(t,y)
        u=A*(y-[ak;bk]);
    end

x=ak-4 : 0.5 : ak+4;
y=bk-4 : 0.5 : bk+4;

[X Y]=meshgrid(x,y);
    for i=1:length(x)
        for j=1:length(y)
                [T,Z]=ode45(@ff, [0,tmax], [X(i,j), Y(i,j)]);
                [T1,Z1]=ode45(@ff, [0,-tmax], [X(i,j), Y(i,j)]);
                
                [T,Z2]=ode45(@lin, [0,tmax], [X(i,j), Y(i,j)]);
                [T1,Z3]=ode45(@lin, [0,-tmax], [X(i,j), Y(i,j)]);
                
                subplot(2,1,1);
         
                plot(ak,bk,'r')
                hold on
                plot(Z(:,1),Z(:,2),Z1(:,1),Z1(:,2));
                axis([ak-4 ak+4 bk-4 bk+4]);
                subplot(2,1,2);
         
                plot(ak,bk,'r')
                hold on
                axis([ak-4 ak+4 bk-4 bk+4]);
                plot(Z2(:,1),Z2(:,2),Z3(:,1),Z3(:,2));
        end
    end
    
    DX=Y;
    DY=sin(X+Y);
    subplot(2,1,1)
    quiver(X,Y,DX,DY,0.5,'k');
    
    DXL=A(1,1)*(X-ak)+A(1,2)*(Y-bk);
    DYL=A(2,1)*(X-ak)+A(2,2)*(Y-bk);
    subplot(2,1,2)
    quiver(X,Y,DXL,DYL,0.5,'k');
end
