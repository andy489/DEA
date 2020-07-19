function stringFourie02
    clf; clf
    L=pi*sqrt(2); a=1/2;
    x=0:L/100:L;
    t0=0; tmax=30;
    t=t0:(tmax-t0)/100:tmax;
    
    function y=phi(x)
        for i=1:length(x)
            if 1<x(i) && x(i)<2
                y(i)=10*exp(4/((2*x(i)-3)^2-1));
            else
                y(i)=0;
            end
        end
        %y=sin(2*x*sqrt(2));
        %y=0;
    end

    function y=psi(x)
        y=0;
        %y=sin(2*x*sqrt(2));
    end

    function y=fourieru(x,t)
        y=0;
        for k=1:30
            Xk=sin(k*pi*x/L);
            Ak=(2/L)*trapz(x,phi(x).*Xk);
            Bk=2/(a*k*pi)*trapz(x,psi(x).*Xk);
            Tk=Ak*cos(a*k*pi*t/L)+Bk*cos(a*k*pi*t/L);
            
            y=y+Tk*Xk;
        end
    end

    for n=1:length(t)
        clf
        hold on
        y=fourieru(x,t(n));
        plot(x,y,'LineWidth',2,'Color','r');
        plot(0,y(1),'ko','MarkerFaceColor',[0 0 0]);
        plot(L,y(length(y)),'ko','MarkerFaceColor',[0 0 0]);
        xlabel('x');
        ylabel('u(x,t)');
        axis([0 L -1 1]);
        grid on
        M(n)=getframe;
    end
    
    %movie(M,2);
end
    
