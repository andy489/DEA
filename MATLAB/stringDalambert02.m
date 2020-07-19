function stringDalambert02
clf; clc
tmax=8; a=1/2;
t=linspace(0,tmax,200);
xmin=0;xmax=6;
x=linspace(xmin,xmax,200);
    
    function y=phi(x)
        for i=1:length(x)
            if x(i)>=1 && x(i) <=2
                y(i)=sin(pi*x(i))^4;
            else
                y(i)=0;
            end
        end
    end

    function y=psi(x)
        %y=0.*x;
        y=sin(3*pi*x)/2; 
    end

    function y=phi_odd(x)
        if x>=0
            y=phi(x);
        else
            y=-phi(-x);
            %y=phi(-x);
        end
    end

    function y=dalambert(x,t)
        for j=1:length(x);
            if t==0
                integral=0;
            else
                s=linspace(x(j)-a*t,x(j)+a*t);
                integral=trapz(s,psi(s));
            end
            y(j)=(phi_odd(x(j)-a*t)+phi_odd(x(j)+a*t))/2+integral/(2*a);
        end
	end

    for k=1:length(t)
        clf
        hold on
        plot(x,dalambert(x,t(k)),'r','Linewidth',2)
        plot(0,0,'ko','MarkerFaceColor',[0,0,0])
        axis([0,xmax,-1.05,1.05])
        grid on
        daspect([1,1,1])
        xlabel('x')
        ylabel('u(x,t)')
       M=getframe;
    end
    
subplot(2,2,1)
plot(x,dalambert(x,0),'k','Linewidth',2)
title('u(x,0)')
hold on

subplot(2,2,2)
plot(x,dalambert(x,2),'k','Linewidth',2)
title('u(x,2)')
hold on

subplot(2,2,3)
plot(x,dalambert(x,4),'k','Linewidth',2)
title('u(x,4)')
hold on

subplot(2,2,4)
plot(x,dalambert(x,8),'k','Linewidth',2)
title('u(x,8)')
hold on
    
end
