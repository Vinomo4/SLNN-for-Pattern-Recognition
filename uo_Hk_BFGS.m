function [Hk] = uo_Hk_BFGS(xk,gk,k,Hk)
  sk = xk(:,k+1) - xk(:,k);
  yk = gk(:,k+1) - gk(:,k);
  pk = 1/(yk'*sk);
  Hk(:,:,k+1) = (eye(35) - pk*sk*yk')*Hk(:,:,k)*(eye(35)-pk*yk*sk') + pk*(sk*sk');
end
