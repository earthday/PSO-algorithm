function [PI, F] = BasicPSO_FSP(P, M, c1, c2, w)
%待优化的目标函数：[F, PI] = fitness(x)   
    %最小化最大完成时间的调度排序方案, 
        % x为微粒的位置，F是最小化的最大完成时间， PI是调度排序方案
%粒子数目：N     %机器数
%学习因子1：c1   %c1过大会使粒子过多地在局部范围内徘徊
%学习因子2：c2   %c2过大会使粒子过早的收敛到局部最小值
%惯性权重：w     %大有利于提高算法的全局搜索能力，小增强局部搜索能力，便于收敛。
%最大迭代次数：M
%问题的维数：D	%工件数
%目标函数取最小值时的自变量值：PI  %调度排序方案
%目标函数的最小值：F     %最小化最大完成时间


format long;

[N, D] = size(P);

x = zeros(N, D);
v = zeros(N, D);
y = zeros(N, D);
p = zeros(1, N);
Pbest = zeros(1, M);

%微粒位置上的上下界值
xmin = 0;
xmax = 1;

FIT = @(x) fitness(P, x);

%为了使初始种群具备一定的质量和分散度。
%用启发式算法生成第一、二个解，其余解随机生成。
%temp_palmer = Palmer(P);    %Palmer启发式算法
%temp_CDS = CDS(P);          %CDS启发式算法
for j=1:D
    %x(1, j) = xmin + ((xmax-xmin)/2)*(temp_palmer(j) - 1 + rand);
    %x(2, j) = xmin + ((xmax-xmin)/2)*(temp_CDS(j) - 1 + rand);
end
for i=1:N
    for j=1:D
        x(i, j)=xmin + rand*(xmax - xmin);  %随机初始化位置
        v(i, j)=xmin + rand*(xmax - xmin);  %随机初始化速度
    end
end

for i=1:N
    p(i)=FIT(x(i,:));
    y(i,:)=x(i,:);
end

pg=x(N,:);  %pg为全局最优
for i=1:(N-1)
    if FIT(x(i,:))<FIT(pg)
        pg=x(i,:);
    end
end

%开始迭代计算
for t=1:M
	for i=1:N
		v(i,:)=w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:));
		x(i,:)=x(i,:) + v(i,:);
		if FIT(x(i,:)) < p(i)
			p(i)=FIT(x(i,:));
			y(i,:)=x(i,:);
		end
		if p(i)<FIT(pg)
			pg=y(i,:);
		end
	end
	Pbest(t)=FIT(pg);
end

%返回结果
plot(1:M, Pbest);
[F, PI]=FIT(pg);
%fprintf('Cmax is %s, order is %s\n', num2str(F), num2str(PI));
end
