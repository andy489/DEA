function plotString

    function y=sw(x,t)
        y=sin(3*pi*x).*sin(3*pi*t)%-cos(4*pi*x).*cos(4*pi*t);
    end

    L=1;
    x=linspace(0,L);
    t=linspace(0,2);
%     for k=1:length(t)
%         plot(x,sw(x,t(k)))
%         grid on
%         axis([0,L,-1,1]);
%         M(k)=getframe;
%     end

[X,T]=meshgrid(x,t);
surf(X,T,sw(X,T))

end
