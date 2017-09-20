NUM_ROUNDS= 20;

alphabet = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J','K',...
             'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',...
             'W', 'X', 'Y', 'Z'};

NUM_LETTERS = size(alphabet,2);

NUM_ELEMENTS= 15;

set1= {};
set2= {};

numCorrect= 0;

for r=1:1:NUM_ROUNDS,
    
  for elem=1:1:NUM_ELEMENTS,
      
    whichChar= randi(NUM_LETTERS,1);   
    set1{elem}= alphabet{whichChar};
    
    whichChar= randi(NUM_LETTERS,1);
    set2{elem}= alphabet{whichChar};
    
  end
  
    result = FirstNameLastNameIntersect(set1, set2);
  
    msg1 = '';
    msg2= '';
    
    for i=1:1:NUM_ELEMENTS,
        
      if (i==1)
        msg1 = sprintf('%s %s',msg1,set1{i});
        msg2 = sprintf('%s %s',msg2,set2{i});
      else
        msg1 = sprintf('%s, %s',msg1,set1{i});
        msg2 = sprintf('%s, %s',msg2,set2{i});
      end
    end
    
    resultMsg= '';
    
    RESULT_SIZE= size(result,2);
    
    for i=1:1:RESULT_SIZE,
        
      if (i==1)
        resultMsg= sprintf('%s %s',resultMsg,result{i});
      else
        resultMsg= sprintf('%s, %s',resultMsg,result{i});
      end
      
    end
   
    msg = sprintf('set1= {%s}   set2={%s},  set1 AND set2= {%s}',msg1,msg2,resultMsg); 
    disp(msg);
    
    realIntersection= intersect(set1,set2);
    if (isequal(realIntersection, result))
       disp('correct'); 
       numCorrect= numCorrect+1;
    else
       disp('incorrect');
    end
    
    fprintf('\n\n');
end

msg= sprintf('percentage correct = %f\n',100*(numCorrect/NUM_ROUNDS));
disp(msg);


return;