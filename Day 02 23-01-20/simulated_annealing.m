function sa_demo
clc,clear,close all;
Lb=[-2 -1];
Ub=[10 11];
nd=length(Lb);
T_init=384.25;
T_min=1e-10;
max_run=2;
k=1;
alpha=0.5;
x_init=[4 5];
i=0;totaleval=0;eval=[];opt=[];
T=T_init;
E_init=fobj(x_init);
E_old=E_init;E_new=E_old;
best=x_init;
while(T>T_min)
  i=i+1;
  if(i>=max_run)
      T=alpha*T;
      totaleval=totaleval+i;
      i=1;
  end
  s=0.01*(Ub-Lb);
  ns=best+s.*randn(1,nd);
  E_new=fobj(ns);
  DeltaE=E_new-E_old;
  if(-DeltaE>0)
      best=ns;E_old=E_new;
  end
  if(exp(-DeltaE/(k*T))>rand)
      best=ns;E_old=E_new;
  else
  end
  f_opt=E_old;
  eval=[eval;totaleval];
  opt=[opt;f_opt];
end
disp(strcat("Evaluations:",num2str(totaleval)))
disp(strcat("Best solution:",num2str(best)))
disp(strcat("Best objective:",num2str(f_opt)))
plot(eval,opt)
end
function z=fobj(x)
z=500-20*x(1)-26*x(2)-4*x(1)*x(2)+4*x(1)^2+3*x(2)^2;
end