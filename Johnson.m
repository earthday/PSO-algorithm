function Xinit = Johnson( P )
%JOHNSON�㷨����� F2||Cmax ����Ķ���ʽ�㷨��Ҳ��ΪSPT-LPT�㷨
%

P3 = P;

[~, N] = size(P);

i1 = 1;
i2 = 1;

for j=1:N
    P3(3, j) = j;
    if P3(1, j) < P3(2, j)
        J1(:, i1, :) = P3(:, j, :);
        i1 = i1 + 1;
    else
        J2(:, i2, :) = P3(:, j, :);
        i2 = i2 + 1;
    end
end

temp = [sortrows(J1', 1)', sortrows(J2', -1)'];

Xinit = temp(3, :); 

end

