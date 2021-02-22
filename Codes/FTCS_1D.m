%====================ABOUT================================================%
%Numerical solution to transient PDEs
%Author-R Surya Narayan
%MATLAB script to solve the 1-D advection equation
%Method: FTCS, time explicit (third-order accurate)
%Note: FTCS: Forward-Time Centered-Space
%==============================problem setup==============================%
length_u=1; %length of the domain
c=1;%wave speed, (m/s)
%===================discretization parameters=============================%
mesh_u=100;%spatial mesh 
mesh_t=3;%temporal mesh-number of time steps
%compute dx dt Co
dt = time/mesh_t;%time advance
du = length_u/(mesh_u);%spacing along x
Co=0.99; %courant number
dt=Co*du/c;
%========================ICs and BCs======================================%
%declare u(x)
u=ones(mesh_u,1);
%compute x-coordinates
x=linspace(0,length_u,mesh_u);
%set the IC
u(2:5)=2;
%have a look once:
%plot(x,u,'-r');
%========================Solution=========================================%
for i=1:mesh_t
    u_n=u;
    for j=2:(mesh_u-1)
            u(j)=u_n(j)-0.5*Co*(u_n(j+1)-u_n(j-1));
    end
    plot(x,u,'-b');
    hold on;
end
hold off;
