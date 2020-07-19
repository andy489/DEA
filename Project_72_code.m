function stringDalambert72
clf; clc
tmax=10; a=1/sqrt(pi);
t=linspace(0,tmax,90);
xmin=0;xmax=2*pi;
x=linspace(xmin,xmax,90);   
    function y=phi(x)
        for i=1:length(x)
                y(i)=sin(x(i)/2);
        end
    end

    function y=psi(x)
        y=2*sin((3*x)/2); 
    end

    function y=dalambert(x,t)
        for j=1:length(x);
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
        clf
        hold on
        plot(x,dalambert(x,t(k)),'k','Linewidth',2)
        plot(0,0,'ko','MarkerFaceColor',[0,0,0])
        axis([0, xmax, -4, 4])
        grid on
        daspect([1,1,1])
        xlabel('x')
        ylabel('u(x,t)')
       M=getframe;
    end
subplot(3,1,1)
plot(x,dalambert(x,0),'k','Linewidth',2)
axis([0,xmax,-4,4])
title('start')
hold on

subplot(3,1,2)
plot(x,dalambert(x,5),'k','Linewidth',2)
axis([0,xmax,-4,4])
title('middle')
hold on

subplot(3,1,3)
plot(x,dalambert(x,10),'k','Linewidth',2)
axis([0,xmax,-4,4])
title('end')
hold on
   
end
