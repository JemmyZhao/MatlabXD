function XYt = cal_cov(x, y)

XYt = [sum(x(:,1).*y(:,1)) sum(x(:,1).*y(:,2)) sum(x(:,1).*y(:,3));
       sum(x(:,2).*y(:,1)) sum(x(:,2).*y(:,2)) sum(x(:,2).*y(:,3));
       sum(x(:,3).*y(:,1)) sum(x(:,3).*y(:,2)) sum(x(:,3).*y(:,3));];
       
