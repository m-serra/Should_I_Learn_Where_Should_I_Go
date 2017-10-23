function [ neighbor ] = extract_neighbor( i,j,a, noise_prob )
%EXTRACT_NEIGHBOR This function will return all the neighbors with their
% associated probabilities
%   [i, j] is the current position of the agent in the grid
%   a is the action which the agent is going to commit
%   noise_prob is the probability of the noise
%   let's say noise_prob=0.2, then with 80% chance, I would move toward the
%   desired direction, and with 20% bad luck, I may go toward an undesired
%   direction
%   neighbor will contain the positions of the neighboring cell with the
%   probability the agent might end up there

    other_possible_actions=neighboring_actions(a); %v? quais s?o as a??es erradas que podem suceder
    %ex: se a=1 ent?o posso errar e ir para norte 2 ou para sul 4
    
    a1=other_possible_actions(1); %guarda as duas possibilidades de estado errado
    a2=other_possible_actions(2);
    
    temp_neighbor1=move_from_toward(i,j,a);% I may end up at this neighbor with (1-noise_prob) chance
    temp_neighbor2=move_from_toward(i,j,a1);% I may end up at this neighbor with (noise_prob)/2 chance
    temp_neighbor3=move_from_toward(i,j,a2);% I may end up at this neighbor with (noise_prob)/2 chance
    
    neighbor=[temp_neighbor1 (1-noise_prob); %[i j p; i j p; i j p]
              temp_neighbor2 (noise_prob/2);
              temp_neighbor3 (noise_prob/2)];
end

