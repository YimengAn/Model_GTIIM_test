clc;
clear;

% 自变量
x = 0:10;  
y = 0:50; 
% 因变量
xlen = length(x);
ylen = length(y);
z = zeros(ylen,xlen);
for i = 1:xlen
    for j = 1:ylen
        z(j,i) = 1/(1+ x(i) * y(j)); % 关联系数
    end
end

[xx,yy]=meshgrid(x,y);
figure;mesh(xx,yy,z)
xlabel('x');ylabel('y');zlabel('z');
