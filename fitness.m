function [F, PI] = fitness( Problem, x )
    
    P = Problem';  %Car6问题
%N   %工件数
%M   %机器数
    [M, N] = size(Problem);
    
    %ROV就是工件的加工顺序
    [~, IX] = sort(x);
    [~, ROV] = sort(IX);
    
    %C(j,k)表示工件j在机器k上的加工完毕时间
    C = zeros(N, M);    %初始化
    
    %公式（6-1）
    C(ROV(1), 1) = P(ROV(1), 1);
    %公式（6-2）
    for i = 2:N
        C(ROV(i), 1) = C(ROV(i-1), 1) + P(ROV(i), 1);
    end
    %公式（6-3）
    for k = 2:M
        C(ROV(1), k) = C(ROV(1), k-1) + P(ROV(1), k);
    end
    %公式（6-4）
    for i = 2:N
        for k = 2:M
            C(ROV(i), k) = max(C(ROV(i-1), k), C(ROV(i), k-1)) + P(ROV(i), k);
        end
    end    
    %公式（6-5）
    F = C(ROV(N), M);
    %公式（6-6）
    PI = ROV;
end