%function numerically43 
%   		clc; clf 
%    		ff = @(t,y)[y(2); 2*y(2)-17*y(1)]; 
%    		initial_conditions = [-1;1]; 
%    		[T,Z] = ode45(ff, [0,3], initial_conditions); 
%   	 	plot(T, Z(:, 1), T, Z(:, 2)) 
%    		legend('Solution', 'First derivative') 
%    		grid on
%end


function symbolically43 
    		[x,y]=dsolve('Dx=y', 'Dy=2*y-17*x', 'x(0)=1', 'y(0)=1') 
    		t=0:0.1:8; 
    		plot(t, eval(x), 'g', t, eval(y)); 
    		grid on 
    		hold on
    		[M, tM] = max(eval(x)); 
    		plot(t(tM), M, 'r*'); 
end 
