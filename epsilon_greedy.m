function [action] = epsilon_greedy(start_state, Q)


   uniqueVals = unique( Q(start_state,:));
   
   %if all the actions have the same value select one randomly
   if size(uniqueVals) == 1
       action = datasample([1 2 3 4],1);
        
   else    
       possibilities = Q(start_state,:);

       possibilities = sort(possibilities);

       poll = zeros(1, 100);

       poll(1:79) = possibilities(4);
       poll(80:91) = possibilities(3);
       poll(92:97) = possibilities(2);
       poll(98:100) = possibilities(1);
       
       action_v = datasample(poll,1);
       
       for i = 1:4
            if Q(start_state,i) == action_v
               action = i;
            end
       end
   end
    
end