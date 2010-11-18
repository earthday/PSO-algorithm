function Xinit = Palmer( P )
%���ͬ˳����ҵ�������� Fm|prmu|Cmax ��һ������ʽ�㷨
%   ���㷨��Palmer��1965������ģ��㷨�ĸ��Ӷ�ΪO(nlogn+mn)��

[m, n] = size(P);

Pai = zeros(1, n);

for j=1:n
    for k=1:m
        Pai(j) = Pai(j) + (k - (m+1)/2)*P(k, j);
    end
end
[~, b] = sort(Pai);
Xinit = wrev(b);
end

