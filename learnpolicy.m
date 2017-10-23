function [ policy ] = learnpolicy( environment, start_state )
%LEARNPOLICY Summary of this function goes here
%   environment is just a function handle to next_state
%   start_state is the index of the starting state
%   policy will be a vector of size 1*16 
%   each element of this vector will be a positive integer from 1 to 4
%   This vector should contain the learned policy
%   For example, policy(1) should be the best action for state=1
%                policy(2) should be the best action for state=2                  
%                                       .
%                                       .
%                                       .
%                policy(16) should be the best action for state=16                  

%   Implement an RL method here
%---------------------------------------------------------------------

    %The RL algorithm chosen to solve the problem is SARSA Lambda

    %Initialize Q(s,a) arbitrarily, for all s in S, a in A(s)
    %The agent knows that a can take the values {1,2,3,4}
    %The agent knows that s can take the values {1,...,16}
    Q = zeros(16,4);

    %number of episodes
    n_episodes = 10000;
    
    %discount factor
    discount_factor=0.9;
    
    %Lambda
    lambda = 0.7;
        
    %Repeat for each episode
    for i = 1:n_episodes
        
        %init the elegibility trace at zero for each state-action pair
        Z = zeros(16,4);
        
        %init S and A
        S = start_state;
        A = epsilon_greedy(S, Q);
        
        terminal = 0;
        
        steps=1;
        
        %Repeat for each step of the episode
        while(terminal == 0 )
            
            %Take action A, observe reward and next state
            [terminal, Snext, reward] = environment(S,A);
            
            %Snext 
            alfa = 1/steps;
            steps = steps+1;
            
            %Choose Anext from Snext using greedy policy
            Anext = epsilon_greedy(Snext, Q);
            
            %Compute error
            delta = reward + discount_factor * Q(Snext, Anext) - Q(S, A);
            
            %Increment Elegibility
            Z(S,A) = Z(S,A) + 1;
            
            %For all states and actions
            for state_i = 1:16
                for action_j = 1:4
                    
                    %Update all state-action pairs value
                    Q(state_i,action_j) = Q(state_i,action_j) + alfa * delta * Z(state_i,action_j);
                    
                    %Update all Elegibility traces
                    Z(state_i,action_j) = discount_factor * lambda * Z(state_i,action_j);
                end            
            end
            S = Snext; A = Anext;
            
        end
    end
    
    policy = compute_policy ( Q );

end

