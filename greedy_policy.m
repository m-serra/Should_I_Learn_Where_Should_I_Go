
function [action] = greedy_policy(start_state, Q)
    %no need to use epsilon-greedy because the environment is stochastic
    
    action =  1; 
    best_a = Q(start_state, 1);
    
    same_val = [-99 -99 -99 -99];
    j = 2;
    
    for i = 2:4    
        if Q(start_state, i) > best_a
            best_a = Q(start_state, i);
            same_val = [-99 -99 -99 -99];
            j = 2;
            action = i;
        
        %if actions have same value register the number of this actions
        elseif Q(start_state, i) == best_a
            same_val(1) = action;
            same_val(j) = i;
            j = j+1;
        end
    end
    
    %if there's actions with same value pick one randomly
    for i=1:4
        if same_val(i) ~= -99
            action = -99;
            while(action == -99) %keep picking while action=-99
                action =  datasample(same_val, 1); %select action randomly among actions with same val
            end
            break;
        end
    end
end