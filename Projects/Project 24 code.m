function plotSlope24
x=-5:0.3:5;
y=-5:0.3:4;
axis([-5,5,-5,4])
    function z= ff(x, y)
        z=x.*(y+2).*sin(x.*x-1);
    end
hold on 
delta=0.1;
for k = 1:length(x)
    for m = 1:length(y)
        plot(x(k),y(m),'k')
        eps= delta/(sqrt(ff(x(k), y(m)).^2+1));
        plot([x(k)-eps, x(k)+ eps],[y(m)- eps*ff(x(k),y(m)), y(m)+eps*ff(x(k), y(m))])
    end
end
[x0, y0] = ginput(1);
diff_eq = dsolve('Dy=x*(y+2)*sin(x*x-1)','y(x0)=y0','x')
x= -5:0.01:5;
plot(x,eval(diff_eq),'r')
end
