function phasePortrait12
	function z=ff(t,y)
		z=[-2*y(1)-2; -y(2)];
	end
clf; clc
tmax=5; 
hold on
grid on
daspect([1 1 1])

% можем да изобразим повече фазови криви като намалим стъпката
x=-3:0.5:3;
y=-3:0.5:3;

[X,Y]=meshgrid(x,y);
% чертаем равновесните точки на системата
plot(0, 0, 'k*', -1, 0, 'k*', 1, 0, 'k*')

% чертаем фазов портрет
for i=1:length(x)
	for j=1:length(y)
		[T,Z]=ode45(@ff, [0, tmax], [X(i,j), Y(i,j)]);
		[T1,Z1]=ode45(@ff, [0, -tmax], [X(i,j), Y(i,j)]);
		
		plot(Z(:,1), Z(:,2), Z1(:, 1), Z1(:, 2))
		axis([-4, 4, -4, 4])
	 end
end

% тангенциални вектори:
DX= -2*X - 2;
DY=-Y;

% чертаем ненормирани тангенциални вектори
% quiver(X, Y, DX, DY, 1.5, 'k');

% нормираме тангенциалните вектори
D=sqrt(DX.^2+DY.^2);

% чертаем нормираните тангенциални вектори
quiver(X, Y, DX./D, DY./D, 0.5, 'k')
end
