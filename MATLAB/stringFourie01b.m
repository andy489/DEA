function stringFourie01b
clf; clc

L=pi*sqrt(2); a=1/2;
xx=0:L/100:L;
t0=0;tmax=30;
t=t0:(tmax-t0)/200:tmax;

    function y=phi(x)
%         for i=1:length(x)
%             if 1<x(i) && x(i)<2
%                 y(i)=10*exp(4/((2*x(i)-3)^2-1));
%             else
%                 y(i)=0;
%             end
%         end
        y=0*x;
    end

    function y=psi(x)
        %y=0*x;
        y=sin(5*x*sqrt(2)/4);
    end

    function y=fourieru(x,t) 
        y=0;
        for k=0:30
            Xk=sin(((2*k+1)*pi/(2*L)).*x);
            Ak=(2/L)*trapz(xx,phi(xx).*Xk(1,:));
            Bk=(4/(2*k+1)*pi*a)*trapz(xx,psi(xx).*Xk(1,:));
            Tk=Ak*cos((2*k+1)*pi*a*t/(2*L))+Bk*sin((2*k+1)*pi*a*t/(2*L));
            
            y=y+Tk.*Xk;
        end
    end

for n=1:length(t)
    clf 
    hold on
    y=fourieru(xx,t(n)); 
    plot(xx,y,'LineWidth',2,'Color','r');
    plot(0,y(1),'ko','MarkerFaceColor',[0 0 0]);
    plot(L,y(end),'ko','MarkerFaceColor',[0 0 0]);
    xlabel('x'); ylabel('u(x,t)');
    axis([0 L -3 3]);
    grid on;
    M(n)=getframe;
end

%movie(M,2)

hold off
[X,T]=meshgrid(xx,t);
U=fourieru(X,T);
surf(X,T,U)
xlabel('x')
ylabel('t')
zlabel('u')

end

