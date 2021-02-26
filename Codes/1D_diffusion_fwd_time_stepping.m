%Unsteady diffusion
%prob_parm
D=0.05;
dt=0.001;
dx=0.01;
timesteps=10000;
%100 for 0.1s
%1000 for 1s
%10000 for 10s
%mesh arrrays 
c=zeros(1,101);
%ICs
c(1)=1;c(end)=1;
%solver
CFL=D*dt/(dx)^2;
x=linspace(0,1,101);
for i = 1:timesteps
    c_n=c;
    for j=2:100
        c(j)=c_n(j)+CFL*(c_n(j+1)+c_n(j-1)-2*c_n(j));
    end
    if (rem(i,1000)==0)
        plot(x,c,'-r');
        hold on;
    end
end
hold off;
