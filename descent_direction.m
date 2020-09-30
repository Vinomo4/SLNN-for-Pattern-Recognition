function [d, beta] = descent_direction(xk, gk, Hk, isd, icg, irc, nu, dk, k,sg_m)
    
    gx = gk(:,k); beta = 0;
    
    % Gradient method
    if isd == 1 || (isd == 2 && k == 1), d = -gx;
    
    % Conjugate gradient method
    elseif isd == 2
        gprev = gk(:,k-1);
        
        % If first iteration or must restart betak = 0.
        if ~(irc == 1 && mod(k, length(xk(:, 1))) == 0) && ~(irc == 2 && abs(gx' * gprev / norm(gx)^2) >= nu)
            % Fletcher-Reeves
            if icg == 1, beta = norm(gx)^2 / norm(gprev)^2;
            % Polak-Ribière
            else, beta = max(gx' * (gx - gprev) / norm(gprev)^2,0);
            end
        end
        d = -gx + beta * dk(:, k - 1); % Computation descent direction
    
    % BFGS
    elseif isd == 3, d = -Hk * gx;
    else, d = -gx;
    end
end