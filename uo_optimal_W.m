function [wk,gk,dk,alk,ioutk,betak,Hk] = uo_optimal_W(L,gL,gL_sg,epsG,kmax,ialmax,kmaxBLS,epsal,c1,c2,isd,sg_m,isg_al0,sg_alpha,sg_k,icg,irc,nu,Xtr,ytr)

    %Inicialització de les variables
    wk = zeros(35,kmax);
    gk = zeros(35,kmax);
    dk = zeros(35,kmax);
    alk = zeros(1,kmax);
    ioutk = zeros(1,kmax);
    betak = zeros(1,kmax);
    Hk = zeros(35,35,kmax);
    
    %Valors inicials
    k = 1;
    Hk(:,:,k) = eye(35);
    
    %Stochastic Gradient
    if isd == 7
    p = size(Xtr,2);
    batch = randi([1,p],1,sg_m);
    X_sg = Xtr(:,batch);
    y_sg = ytr(:,batch);
    end
    
    if isd == 7 
    %We select the stochastic gradient as our main gradient.
    gk(:, 1) = gL_sg(wk(:,1),X_sg,y_sg);
    else
        gk(:, 1) = gL(wk(:,1));
    end
    
    while norm (gk(:,k)) > epsG && k < kmax   
        [dk(:,k),betak(k)] = descent_direction(wk, gk, Hk(:,:,k), isd, icg, irc, nu, dk, k,sg_m);
        [alk(k),ioutk(k)] = uo_find_alpha(isd,L,gL,gk,wk,dk,ialmax,c1,c2,kmaxBLS,epsal,k,alk,isg_al0,sg_alpha,sg_k);
        wk(:,k+1) = wk(:,k) + alk(k)*dk(:,k);
        
        %Re-batch.
        if isd == 7
        batch = randi([1,p],1,sg_m);
        X_sg = Xtr(:,batch);
        y_sg = ytr(:,batch);
        end
        
        %Update of the gradient
        if isd ~= 7, gk(:,k+1) = gL(wk(:,k+1));
        else, gk(:,k+1) = gL_sg(wk(:,k+1),X_sg,y_sg);
        end
        
        %Computation of Hk in the BFGS method.
        if isd == 3,[Hk] = uo_Hk_BFGS(wk,gk,k,Hk); end
        k = k+1; 
    end 
    %Escollim els valors que han estat calculats 
    wk = wk(:,1:k);
    dk = dk(:,1:k);
    gk = gk(:,1:k);
    alk = alk(1,1:k);
    ioutk = ioutk(1,1:k);
    betak = betak(1,1:k);
    Hk = Hk(:,:,1:k);
end

