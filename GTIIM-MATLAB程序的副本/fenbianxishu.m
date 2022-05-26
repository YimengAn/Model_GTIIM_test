clc;
clear;

% �Ա���
x = 0:10;  
y = 0:50; 
% �����
xlen = length(x);
ylen = length(y);
z = zeros(ylen,xlen);
for i = 1:xlen
    for j = 1:ylen
        z(j,i) = 1/(1+ x(i) * y(j)); % ����ϵ��
    end
end

[xx,yy]=meshgrid(x,y);
figure;mesh(xx,yy,z)
xlabel('x');ylabel('y');zlabel('z');
