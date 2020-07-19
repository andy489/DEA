function task03_1
    tmax=5;
    
    function z=ff(t,y) %y1'=y1*y2; y2'=-y1^2
        z=[y(1)*y(2); -y(1)^2];
    end

ak=0;
bk=2;

x=ak-4 : 1 : ak+4;
y=bk-4 : 1 : bk+4;

[X Y]=meshgrid(x,y);
    for i=1:length(x)
        for j=1:length(y)
                [T,Z]=ode45(@ff, [0,tmax], [X(i,j), Y(i,j)]);
                [T1,Z1]=ode45(@ff, [0,-tmax], [X(i,j), Y(i,j)]);
         
                plot(ak,bk,'r')
                hold on
                plot(Z(:,1),Z(:,2),Z1(:,1),Z1(:,2));
                axis([ak-7.5 ak+7.5 bk-9.5 bk+5.5]);
        end
    end 
    DX=X.*Y;
    DY=-X.^2;
    quiver(X,Y,DX,DY,1.8,'k');
end
