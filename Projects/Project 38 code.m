function stringDalambert38
	clf; clc
	tmax=10;
	t=linspace(0, tmax);
	xmin=0; xmax=20;
	x=xmin: 0.1: xmax;   
   	function y = phi(x)
        		for i=1:length(x)
			if x(i)>=1 && x(i)<=2
                			y(i) = -10*(x(i)-1)^3*cos(pi*x(i)/4)^3;
			else 
				y(i) = 0;
			end
        		end
    	end

	function y = phi_even(x)
       	 	if x>=0 
                		y = phi(x);
		else 
			y = phi(-x);
		end
   	end

    	function y = psi(x)
        		y=sin(pi*x); 
    	end

	function y = psi_even(x)
       	 	for n=1:length(x)
			if x(n)>=0
                			y(n) = psi(x(n));
			else 
				y(n) = psi(-x(n));
			end
        		end
   	end

	function u=dalambert(x,t)
		a=sqrt(2/15);
        		for j=1:length(x);
            		if t==0
                			integral=0;
            		else
                			s=linspace(x(j)-a*t,x(j)+a*t);
                			integral=trapz(s,psi_even(s));
           			end
            		u(j)=(phi_even(x(j)-a*t)+phi(x(j)+a*t))/2+integral/(2*a);
        		end
     	end

   	for k=1:length(t)
            	plot(0, dalambert(0, t(k)), 'k*', x, dalambert(x, t(k)), 'm', 'Linewidth', 2)
               	axis([xmin, xmax, -2, 2])
       		daspect([1,1,1])
		grid on
        		xlabel('x')
        		ylabel('u(x, t)')
       		M=getframe;
    	end
subplot(3,1,1)
plot(0, dalambert(0, 0), 'k*', x, dalambert(x, 0), 'm', 'Linewidth', 2)
title('t = 0')
hold on

subplot(3,1,2)
plot(0, dalambert(0, 5), 'k*', x, dalambert(x, 5), 'm', 'Linewidth', 2)
title('t = 5')
hold on

subplot(3,1,3)
plot(0, dalambert(0, tmax), 'k*', x, dalambert(x, tmax), 'm', 'Linewidth', 2)
title(['t = ', num2str(tmax)])
hold on
   
end
