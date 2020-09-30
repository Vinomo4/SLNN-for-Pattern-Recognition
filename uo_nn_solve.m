function [Xtr,ytr,wo,fo,tr_acc,Xte,yte,te_acc,niter,tex] = uo_nn_solve(num_target, tr_freq,tr_seed,tr_p,te_seed,te_q,la,epsG,kmax,ialmax,kmaxBLS,epsal,c1,c2,isd,isg_m,isg_al0,isg_k,icg,irc,nu)

%Generation of the training dataset.

[Xtr,ytr] = uo_nn_dataset(tr_seed,tr_p,num_target,tr_freq);

% Finding optimal weights.

%Definition of the necessary function.
sig = @(X) 1./(1+exp(-X));
y = @(X,w) sig(w'*sig(X));
L = @(w) norm(y(Xtr,w)-ytr)^2 + (la*norm(w)^2)/2;
gL = @(w) 2*sig(Xtr)*((y(Xtr,w)-ytr).*y(Xtr,w).*(1-y(Xtr,w)))'+la*w;

%Variables and function for Stochastic Gradient.
gL_sg = @(w,X_sg,y_sg) 2*sig(X_sg)*((y(X_sg,w)-y_sg).*y(X_sg,w).*(1-y(X_sg,w)))'+la*w;
sg_m = floor(isg_m*tr_p);
sg_alpha = 0.01*isg_al0; 
sg_k = floor(isg_k*kmax);


%Function that calculates the W's.
t1=clock;
[wk,gk,dk,alk,ioutk,betak,Hk] = uo_optimal_W(L,gL,gL_sg,epsG,kmax,ialmax,kmaxBLS,epsal,c1,c2,isd,sg_m,isg_al0,sg_alpha,sg_k,icg,irc,nu,Xtr,ytr);
t2 = clock;
%Finding the training accuracy

niter = length(wk(1,:));

wo = wk(:,niter);

fo = L(wo);

ytr_pred= round(y(Xtr,wo));

tr_acc = 100/tr_p*sum(ytr_pred == ytr);

%Generation of the test dataset.

[Xte,yte] = uo_nn_dataset(te_seed,te_q,num_target,-1);

yte_pred = round(y(Xte,wo));

te_acc = 100/te_q*sum(yte_pred == yte);

%Calculation of the execution time

tex = etime(t2,t1);
end

