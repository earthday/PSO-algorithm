function Xinit = CDS( P )
%CDS算法是Campbell等人于1970年给出的求解问题 Fm|prmu|Cmax 问题的启发式算法。
%算法复杂度为O(mnlogn + nm^2)

[M, N] = size(P);

a = zeros(M-1, N);
b = zeros(M-1, N);

for i=1:M-1
    for j=1:N
        for k=1:i
            a(i, j) = a(i, j) + P(k, j);
            b(i, j) = b(i, j) + P(M-k+1, j);
        end
    end
end

for i=1:M-1
    [ta, tb] = fitness(P, Johnson([a(i,:); b(i, :)]));
    Cmax(i, :) = [ta, tb];
end

temp = sortrows(Cmax, 1);

Xinit = temp(1, 2:N+1);

end

