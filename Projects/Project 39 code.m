function stringDalambert39
	clf; clc
	tmin=0; tmax=10;
	t=linspace(tmin, tmax, 100);
	xmin=-50; xmax=30;
	x=linspace(xmin, xmax, 1000);
   	function y = phi(x)
        		for i=1:length(x)
			if x(i)>=-8 && x(i)<=-5
                			y(i) = ((x(i)+5)*cos((pi/16)*x(i)))^3;
			else 
				y(i) = 0;
			end
        		end
    	end

    	function y = psi(x)
        		y=sin(pi*x); 
		%for less standing flicker
		%y=sin(pi*x)/10;
    	end

	function u=dalambert(x,t)
		a=sqrt(2);
		%for faster moving wave
		%a=3*sqrt(2);
        		for j=1:length(x);
            		if t==0
                			integral=0;
            		else
                			s=linspace(x(j)-a*t,x(j)+a*t);
                			integral=trapz(s,psi(s));
           			end
            		u(j)=(phi(x(j)-a*t)+phi(x(j)+a*t))/2+integral/(2*a);
        		end
     	end

   	for k=1:length(t)
            	plot(x, dalambert(x, t(k)), 'g', 'LineWidth', 2)
               	axis([xmin, xmax, -1, 1])
		%when upper updates
		%axis([xmin, xmax, -0.2, 0.2];
		grid on
        		xlabel('x')
        		ylabel('u(x, t)')
       		M=getframe;
    	end
subplot(3,1,1)
plot(x, dalambert(x, 0), 'g',  'Linewidth', 2)
title('t = 0')
hold on

subplot(3,1,2)
plot(x, dalambert(x, 1), 'g', 'LineWidth', 2)
title('t = 1')
hold on

subplot(3,1,3)
plot(x, dalambert(x, 3), 'g', 'LineWidth', 2)
title('t = 3')
hold on
   
end
