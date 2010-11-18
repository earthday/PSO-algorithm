function [PI, F] = BasicPSO_FSP(P, M, c1, c2, w)
%���Ż���Ŀ�꺯����[F, PI] = fitness(x)   
    %��С��������ʱ��ĵ������򷽰�, 
        % xΪ΢����λ�ã�F����С����������ʱ�䣬 PI�ǵ������򷽰�
%������Ŀ��N     %������
%ѧϰ����1��c1   %c1�����ʹ���ӹ�����ھֲ���Χ���ǻ�
%ѧϰ����2��c2   %c2�����ʹ���ӹ�����������ֲ���Сֵ
%����Ȩ�أ�w     %������������㷨��ȫ������������С��ǿ�ֲ���������������������
%������������M
%�����ά����D	%������
%Ŀ�꺯��ȡ��Сֵʱ���Ա���ֵ��PI  %�������򷽰�
%Ŀ�꺯������Сֵ��F     %��С��������ʱ��


format long;

[N, D] = size(P);

x = zeros(N, D);
v = zeros(N, D);
y = zeros(N, D);
p = zeros(1, N);
Pbest = zeros(1, M);

%΢��λ���ϵ����½�ֵ
xmin = 0;
xmax = 1;

FIT = @(x) fitness(P, x);

%Ϊ��ʹ��ʼ��Ⱥ�߱�һ���������ͷ�ɢ�ȡ�
%������ʽ�㷨���ɵ�һ�������⣬�����������ɡ�
%temp_palmer = Palmer(P);    %Palmer����ʽ�㷨
%temp_CDS = CDS(P);          %CDS����ʽ�㷨
for j=1:D
    %x(1, j) = xmin + ((xmax-xmin)/2)*(temp_palmer(j) - 1 + rand);
    %x(2, j) = xmin + ((xmax-xmin)/2)*(temp_CDS(j) - 1 + rand);
end
for i=1:N
    for j=1:D
        x(i, j)=xmin + rand*(xmax - xmin);  %�����ʼ��λ��
        v(i, j)=xmin + rand*(xmax - xmin);  %�����ʼ���ٶ�
    end
end

for i=1:N
    p(i)=FIT(x(i,:));
    y(i,:)=x(i,:);
end

pg=x(N,:);  %pgΪȫ������
for i=1:(N-1)
    if FIT(x(i,:))<FIT(pg)
        pg=x(i,:);
    end
end

%��ʼ��������
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

%���ؽ��
plot(1:M, Pbest);
[F, PI]=FIT(pg);
%fprintf('Cmax is %s, order is %s\n', num2str(F), num2str(PI));
end
