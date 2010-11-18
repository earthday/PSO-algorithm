function [PI, F] = YSPSO_FSP(N, c1, c2, M, D )
%YSPSO 带压缩因子的粒子群算法
%待优化的目标函数：[F, PI] = fitness(x)   
    %最小化最大完成时间的调度排序方案, 
        % x为微粒的位置，F是最小化的最大完成时间， PI是调度排序方案
%粒子数目：N     %机器数
%学习因子1：c1
%学习因子2：c2
%惯性权重：w
%最大迭代次数：M
%问题的维数：D	%工件数
%目标函数取最小值时的自变量值：PI  %调度排序方案
%目标函数的最小值：F     %最小化最大完成时间

x = zeros(N, D);
v = zeros(N, D);
y = zeros(N, D);
p = zeros(1, N);

phi = c1 + c2;
if phi < 4
    disp('c1与c2的和必须大于4！');
    PI = NaN;
    F = NaN;
    return;
end

format long;
for i=1:N
    for j=1:D
        x(i,j)=rand;    %初始化微粒位置
        v(i,j)=rand;    %初始化微粒速度
    end
end

for i=1:N
    p(i) = fitness(x(i,:));
    y(i,:) = x(i,:);
end
pg = x(N,:);
for i=1:N-1
    if fitness(x(i,:)<fitness(pg))
        pg = x(i,:);
    end
end

for t=1:M
    for i=1:N
        ksi = 2/abs(2-phi-sqrt(phi^2 -4*phi));
        v(i,:)=ksi*(v(i,:) + c1*rand*(y(i,:)-x(i,:)) + c2*rand*(pg-x(i,:)));
        x(i,:)=x(i,:) + v(i,:);
        if fitness(x(i,:)) < p(i)
            p(i) = fitness(x(i,:));
            y(i,:) = x(i,:);
        end
        if(p(i)<fitness(pg))
            pg = x(i,:);
        end 
    end
end

%返回结果
[F, PI]=fitness(pg);
end

