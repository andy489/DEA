function stringFourie17
	clf; clc
	a=sqrt(11/4);
	L=9/2;
	tmax=12;

	x=linspace(0,L);
	t=linspace(0,tmax);

	function y=phi(x)
		for i=1:length(x)
			if x(i)>=1 && x(i)<=2
				y(i)=(-5)*((x(i)-1)^3)*(sin(pi*x(i)/2))^3;
			else
				y(i)=0;	
			end
		end
	end
	
	function y=psi(x)
		for i=1:length(x)
			y(i)=sin(2*pi*x(i));
		end
	end

	function y=u(x,t)
		y=0;
		for k=0:54
			Xk=sin((pi/2+k*pi)*x/L);
			Ak=2*trapz(x,phi(x).*Xk)/L;
			Bk=(4*trapz(x,psi(x).*Xk))/(a*(pi+2*k*pi));
			Tk=Ak*cos((a*(pi+2*k*pi)*t)/(2*L))+Bk*sin((a*(pi+2*k*pi)*t)/(2*L));				
			y=y+Tk*Xk;
		end
	end

	for n=1:length(t)
		plot(x, u(x,t(n)), 'r', 'LineWidth', 2);
		axis([0,L,-0.5,0.5 ]);
		grid on;
		getframe;
	end
	subplot(3,1,1);
	plot(x,u(x,0), 'r', 'LineWidth', 2);
	title('t=0');
	grid on;

	subplot(3,1,2);
	plot(x,u(x,6), 'r', 'LineWidth', 2);
	title('t=6');
	grid on;

	subplot(3,1,3);
	plot(x,u(x,tmax), 'r', 'LineWidth', 2);
	title('t=12');
	grid on;
end
