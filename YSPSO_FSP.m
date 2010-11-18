function [PI, F] = YSPSO_FSP(N, c1, c2, M, D )
%YSPSO ��ѹ�����ӵ�����Ⱥ�㷨
%���Ż���Ŀ�꺯����[F, PI] = fitness(x)   
    %��С��������ʱ��ĵ������򷽰�, 
        % xΪ΢����λ�ã�F����С����������ʱ�䣬 PI�ǵ������򷽰�
%������Ŀ��N     %������
%ѧϰ����1��c1
%ѧϰ����2��c2
%����Ȩ�أ�w
%������������M
%�����ά����D	%������
%Ŀ�꺯��ȡ��Сֵʱ���Ա���ֵ��PI  %�������򷽰�
%Ŀ�꺯������Сֵ��F     %��С��������ʱ��

x = zeros(N, D);
v = zeros(N, D);
y = zeros(N, D);
p = zeros(1, N);

phi = c1 + c2;
if phi < 4
    disp('c1��c2�ĺͱ������4��');
    PI = NaN;
    F = NaN;
    return;
end

format long;
for i=1:N
    for j=1:D
        x(i,j)=rand;    %��ʼ��΢��λ��
        v(i,j)=rand;    %��ʼ��΢���ٶ�
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

%���ؽ��
[F, PI]=fitness(pg);
end

