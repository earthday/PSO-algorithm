function Xinit = Johnson( P )
%JOHNSON算法是求解 F2||Cmax 问题的多项式算法，也成为SPT-LPT算法
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

