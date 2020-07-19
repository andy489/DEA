 function stringDalambert03
clf;clc
xmin=0; L=4; xmax=L;
a=2;
tmin=0; tmax=20;
t=linspace(tmin,xmax,80);
x=linspace(xmin,xmax,80);

    function y=phi(x)
        for i=1:length(x)
            if x(i)>=1 && x(i)<=2
                y(i)=sin(pi*x(i))^4;
            else
                y(i)=0;
            end
        end
    end

    function y=psi(x)
        y=0*x;
        %y=cos(11*x*pi/12);
        %y=cos(2*pi*x/L)/2;
    end

    function y=phi_even(x)
        if x>0
            y=phi(x);
        else
            y=phi(-x);
        end
    end

    function y=psi_even(x)
        for j=1:length(x)
            if x(j)>=0
                y(j)=psi(x(j));
            else
                y(j)=psi(-x(j));
            end
        end
    end

    function y=phi_prod(x)
        if x>L
            y=phi_prod(x-2*L);
        elseif x<-L
            y=phi_prod(x+2*L);
        else
            y=phi_even(x);
        end
    end
 
        for k=1:length(x)
            if x(k)>L
                y(k)=psi_prod(x(k)-2*L);
            elseif x(k)<-L
                y(k)=psi_prod(x(k)+2*L);
            else 
                y(k)=psi_even(x(k));
            end
        end
    end
 
    function y=dalambert(x,t)
        for n=1:length(x)
            if t==0
                integral=0;
            else
                s=linspace(x(n)-a*t,x(n)+a*t);
                integral=trapz(s,psi_prod(s));
            end
            y(n)=(phi_prod(x(n)-a*t)+phi_prod(x(n)+a*t))/2+integral/(2*a);
        end
    end

    for m=1:length(t)
        plot(x,dalambert(x,t(m)), 'r','Linewidth',2)
        axis([xmin,L,-0.8,1])
        grid on
        xlabel('x')
        ylabel('u(x,t)')
        getframe;
    end

    subplot(3,1,1)
    plot(x,dalambert(x,0),'r','Linewidth',2)
    title('u(x,0)')
    hold on
    
    subplot(3,1,2)
    plot(x,dalambert(x,1),'r','Linewidth',2)
    title('u(x,1)')
    hold on
    
    subplot(3,1,3)
    plot(x,dalambert(x,2),'r','Linewidth',2)
    title('u(x,2)')
    hold on

end



