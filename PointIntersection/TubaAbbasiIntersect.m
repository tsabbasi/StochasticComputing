function result= FirstNameLastNameIntersect(set1, set2)

%  FirstNameLastNameIntersect
%
%  set1- an input set for intersection
%  set2- set with which to perform intersection
%
%  result:  the intersection set1 AND set2


% Dummy sets
% set1 = {'A', 'C', 'B', 'D'}
% set2 = {'B', 'C', 'E', 'D'}

set3 = {};

   for i = set1    
       for j = set2
           if i{:} == j{:}
               if ~any(strcmp(set3,i))
                   set3 = [set3, i];
                   set3 = sort(set3);
               end
           end
       end
   end

result = set3;

end