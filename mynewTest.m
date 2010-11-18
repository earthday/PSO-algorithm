function R = mynewTest()
   result = zeros(20, 9);
   for i=1:20
       [result(i,1:8), result(i, 9)] = BasicPSO_FSP(9, 2, 2, 2, 10000, 8);
   end
   R = result;
end

