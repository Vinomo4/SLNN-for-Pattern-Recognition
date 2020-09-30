function [alphas,iout] = uo_find_alpha(isd,f,gL,gk,xk,dk,ialmax,c1,c2,maxiter,eps,k,alk,isg_al0,sg_alpha,sg_k)
    if isd ~= 7 
        if k ==1, alpham = 1;
        else
            if ialmax == 1
                alpham = alk(k-1)*(gk(:,k-1)'*dk(:,k-1))/(gk(:,k)'*dk(:,k));
            else 
                alpham = 2*(f(xk(:,k)) - f(xk(:,k-1)))/(gk(:,k)'*dk(:,k));
            end
        end
        [alphas,iout] = uo_BLSNW32(f,gL,xk(:,k),dk(:,k),alpham,c1,c2,maxiter,eps);
    else
        if k <= sg_k
            alphas = (1-k/sg_k)*isg_al0 + k/sg_k * sg_alpha;  
        else, alphas = sg_alpha;   
        end
    iout = 0;
    end
end

