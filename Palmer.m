function Xinit = Palmer( P )
%求解同顺序作业排序问题 Fm|prmu|Cmax 的一种启发式算法
%   该算法是Palmer于1965年提出的，算法的复杂度为O(nlogn+mn)。

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

