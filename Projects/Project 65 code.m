function pikar65 
	clc; clf 
	xmin=1; xmax=3; 
	x0=1; y0=-2; 
	hold on; grid on 
	axis([xmin xmax -40 20]); 
	y=dsolve('Dy=((y*6)/t)+4','y(x0)=y0','t'); 
	t=linspace(xmin,xmax); 
	p=plot(t,eval(y), 'k'); N=6; 
	x=linspace(x0,xmin); 
	xx=linspace(x0,xmax); 
	z=y0*ones(1,length(x)); 
	zz=y0*ones(1,length(xx)); 
	p0=plot(x,z,'b'); 
	plot(xx,zz,'b'); 
	for k=1:N 
		z=y0+cumtrapz(x,ff(x,z)); 
		zz=y0+cumtrapz(xx,ff(xx,zz)); 
		if k== 1 
			p1=plot(x,z,'r'); 
			plot(xx,zz,'r'); 
		elseif k==5 
			p5=plot(x,z,'g'); 
			plot(xx,zz,'g'); 
		end 
	end
	legend( [ p p0 p1 p5 ], ... 
	{ 'y(x)', ... 
	'y0(x)', ... 
	'y1(x)', ... 
	'y5(x)'}); 
	function z=ff(x,y) 
		z=((6*y)./(x))+4; 
	end 
end 
