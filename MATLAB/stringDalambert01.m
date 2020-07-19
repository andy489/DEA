function stringDalambert01
clf; clc
tmax=6; a=1/2;
t=linspace(0,tmax);
xmin=-1; xmax=4;
x=linspace(xmin,xmax,200);
    function y=phi(x) %start position
        for i=1:length(x)
            if x(i)>=1 && x(i)<=2
                y(i)=sin(pi*x(i))^4; %y(i)=0*y(i);
            else
                y(i)=0;
            end
        end
    end

%plot(x,phi(x));

    function y=psi(x) %start speed
        y=sin(3*pi*x)/2;
        %y=0*x;
    end

    function y=dalambert(x,t)
        for j=1:length(x)
            if t==0
                integral=0;
            else
                s=linspace(x(j)-a*t,x(j)+a*t);
                integral=trapz(s,psi(s));
            end
            y(j)=(phi(x(j)-a*t)+phi(x(j)+a*t))/2+integral/(2*a);
        end
    end

    for k=1:length(t)
        plot(x,dalambert(x,t(k)),'b','Linewidth',2)
        axis([xmin,xmax,-0.5,1])
        daspect([1,1,1])
        grid on
        xlabel('x')
        ylabel('u(x,t)')
        getframe
    end

subplot(3,1,1)
plot(x,dalambert(x,t(1)),'k','Linewidth',2) %t(1)=0
hold on
subplot(3,1,2)
plot(x,dalambert(x,3),'k','Linewidth',2)
hold on
subplot(3,1,3)
plot(x,dalambert(x,5),'k','Linewidth',2)
hold on

end
