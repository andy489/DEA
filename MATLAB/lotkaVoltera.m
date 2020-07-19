function lotkaVoltera
    tmax=10;
   
    a=1;
    b=0.3;
    c=1;
    d=0.2;
    
    plot(0,0,'m*',c/d,a/b,'m*');
    hold on
    
    x=-1:0.5:c/d+5;
    y=-1:0.5:a/b+5;
    [X, Y]=meshgrid(x,y);
    
    DX=a*X-b*X.*Y;
    DY=-c*Y+d*X.*Y;
    
    quiver(X,Y,DX,DY,1.2,'k');
    
    %анимация на движението на точката x(t),y(t) по кривата, която при t=0
    %минава през някоя въведена от клавиатурата точка (x0,y0);
    
    [x0,y0]=ginput(1);
    plot(x0,y0,'go');
    
    [T,Y]=ode45(@ff,[0 tmax],[x0;y0]);
    
for k=1:length(T)
    plot(Y(1:k,1),Y(1:k,2),'r');
    getframe
end
    
    function z=ff(t,y)
        z=[a*y(1)-b*y(1)*y(2); -c*y(2)+d*y(1)*y(2)];
    end
end
