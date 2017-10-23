function [policy] = compute_policy ( Q )
    
    %init policy
    policy = zeros(1,16);
    
    %iterate all states
    for i = 1:16
        
        %if all action values are 0 it's an exit or obstacle
        if( all(Q(i,:) == 0) )
            policy(i) = 0;
            continue;
        end
        
        %find the action with greater value
        [~, max_index] = max( Q(i,:) );
         
        %assign best action to policy
        policy(i) = max_index;
         
    end

end