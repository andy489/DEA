function harmonicОscillator48
clf; clc

t0=0;
tmax=30;

% symbolic solution at a=0
y=simplify(dsolve('D2y+y=0','y(0)=-1','Dy(0)=-1'));

% resonance at a=5 and 
p=simplify(dsolve('D2y+y=0','y(0)=-1','Dy(0)=-1'));
     
% beats at a=5 and w0=1.4
q=simplify(dsolve('D2y+y=5*(sin(1.4*t))+cos(1.4*t)','y(0)=-1','Dy(0)=-1'));

t=t0:0:0.10:tmax;

Y=eval(y);
P=eval(p);
Q=eval(q);
for k=1:length(t)
	% periodic movement
	subplot(3,1,1);
	plot(t(1:k), Y(1:k), 'r', 'LineWidth', 2)
	axis([t0, tmax, -2, 2])
	grid on
	grid minor
	title('Periodic movement', 'Color', 'b');
	xlabel('t', 'Color', 'b');
	ylabel('y(t)', 'Color', 'b');

	% resonance 
	subplot(3,1,2);
	plot(t(1:k), P(1:k), 'r', 'LineWidth', 2)
	axis([t0, tmax, -100, 100])
	grid on
	grid minor
	title('Resonance', 'Color', 'b');
	xlabel('t', 'Color', 'b');
	ylabel('y(t)', 'Color', 'b');

	% beats 
	subplot(3,1,3);
	plot(t(1:k), Q(1:k), 'r', 'LineWidth', 2)
	axis([t0, tmax, -20, 20])
	grid on
	grid minor
	title('Beats', 'Color', 'b');
	xlabel('t', 'Color', 'b');
	ylabel('y(t)', 'Color', 'b');

	М(k)=getframe;
end
end
