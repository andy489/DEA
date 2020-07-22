function fourieThermalConductivityEquation41
clf; clc
	a=0.2;
	L=3*pi;
	tmax=2;

	x=0:L/100:L;
	t=0:tmax/50:tmax;

	function y=phi(x)
		for i=1:length(x)
			if x(i)>=7 && x(i)<=8
				y(i)=20*sin(x(i))-18*sin(x(i)/2);
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
		for k=0:13
			Xk=sin(((2*k+1)*x)/6);
			Ak=2*trapz(x,phi(x).*Xk)/L;
			Tk=Ak*exp(-(a*(2*k+1)/6).^2*t);				
			y=y+Tk*Xk;
		end
	end

	for n=1:length(t)
		plot(x, u(x,t(n)), 'r', 'LineWidth', 2);
		axis([0, L, -30, 30]);
		grid on;
		M(n)=getframe;
	end
	subplot(3,1,1);
	plot(x,u(x,0), 'r', 'LineWidth', 2);
	axis([0, L, -30, 30]);
	title('t=0');
	grid on;

	subplot(3,1,2);
	plot(x,u(x,6), 'r', 'LineWidth', 2);
	axis([0, L, -30, 30]);
	title('t=1');
	grid on;

	subplot(3,1,3);
	plot(x,u(x,3/2), 'r', 'LineWidth', 2);
	axis([0, L, -30, 30]);
	title('t=1.5');
	grid on;
end
