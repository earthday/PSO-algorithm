function Xinit = CDS( P )
%CDS�㷨��Campbell������1970�������������� Fm|prmu|Cmax ���������ʽ�㷨��
%�㷨���Ӷ�ΪO(mnlogn + nm^2)

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

