function zad3
clear ;
clf ; 
tmax=5;
function z=ff (t ,y)
    z=[y(2)*y(1); -y(1)*y(1)]; 
end
k=1;
A=[0,k;0,0 ] ; 
ak=0 ;
bk=k;
function u=fl (t ,y) 
    u=A*(y-[ak ;bk ] ) ;
end
d=5;
s=1;
x=ak-d: s : ak+d;
y=bk-d: s :bk+d;

[X,Y]=meshgrid(x ,y );
for i =1:length (x)
    for j =1:length (y)
        [T,Z]=ode45(@fl ,[0 , tmax ] ,[X( i , j ) ,Y( i , j ) ] ) ; 
        [T1,Z1]=ode45(@fl ,[0 ,-tmax ] ,[X( i , j ) , Y( i , j ) ] ) ;
        [T2,Z2]=ode45(@ff ,[0 , tmax ] ,[X( i , j ) ,Y( i , j ) ] ) ; 
        [T3,Z3]=ode45(@ff ,[0 ,-tmax ] ,[X( i , j ) , Y( i , j ) ] ) ;
subplot (2 ,1 ,2) 
title ( ' Linearization ') 
hold on 
plot (ak ,bk , ' r*') 
axis ([ ak*d-1, ak+d+1,bk-d-1,bk+d+1]);
plot (Z(: ,1) ,Z(: ,2) ,Z1(: ,1) ,Z1(: ,2) , 'b ')
xlabel ( 'x ') 
ylabel ( 'y ')
subplot (2 ,1 ,1) 
title ( ' Nonlinear aysytem ') 
hold on 
plot (ak ,bk , ' r*' ,ak-pi ,bk , ' g*' ,ak+pi ,bk , ' g*') 
plot (Z2(: ,1) ,Z2(: ,2) ,Z3(: ,1) ,Z3(: ,2) , 'b ')
axis ([ ak-d-1,ak+d+1,bk-d-1,bk+d+1]) 
xlabel ( 'x ')
ylabel ( 'y ')
    end
end

end
