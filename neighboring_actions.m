function [ neighbors ] = neighboring_actions( a )
%NEIGHBORING_ACTIONS This function returns the neighboring actions

    if ((a==1) || (a==3))
        neighbors=[2 4]; %se tentar ir para este ou oeste posso acabar por ir para norte ou sul
    else
        neighbors=[1 3]; %o oposto
    end


end

