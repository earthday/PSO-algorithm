function [F, PI] = fitness( Problem, x )
    
    P = Problem';  %Car6����
%N   %������
%M   %������
    [M, N] = size(Problem);
    
    %ROV���ǹ����ļӹ�˳��
    [~, IX] = sort(x);
    [~, ROV] = sort(IX);
    
    %C(j,k)��ʾ����j�ڻ���k�ϵļӹ����ʱ��
    C = zeros(N, M);    %��ʼ��
    
    %��ʽ��6-1��
    C(ROV(1), 1) = P(ROV(1), 1);
    %��ʽ��6-2��
    for i = 2:N
        C(ROV(i), 1) = C(ROV(i-1), 1) + P(ROV(i), 1);
    end
    %��ʽ��6-3��
    for k = 2:M
        C(ROV(1), k) = C(ROV(1), k-1) + P(ROV(1), k);
    end
    %��ʽ��6-4��
    for i = 2:N
        for k = 2:M
            C(ROV(i), k) = max(C(ROV(i-1), k), C(ROV(i), k-1)) + P(ROV(i), k);
        end
    end    
    %��ʽ��6-5��
    F = C(ROV(N), M);
    %��ʽ��6-6��
    PI = ROV;
end