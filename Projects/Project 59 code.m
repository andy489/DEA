function derivativeEquation59
	%(y')^2-(x-y)*y'-x*y=0
	clc; clf
	axis([-14,14,-10,10])
	hold on
	grid on
	syms x y z
	F=z^2-(x-y)*z-x*y;
	Fz=diff(F,z);
	[y,z]=solve(F,Fz,y,z);
	x=-14:1/100:14;
	plot(x,eval(y),'k')
	[x0,y0]=ginput(1);
	plot(x0,y0,'r*')
	if y0==-x0
		text(x0+0.1,y0, 'other solution')
	else
		y1=dsolve('(Dy)^2-(x-y)*Dy-x*y=0','y(x0)=y0','x');
		plot(x,eval(y1))
	end
end
