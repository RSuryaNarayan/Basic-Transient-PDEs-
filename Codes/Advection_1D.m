%====================ABOUT================================================%
%Numerical solution to transient PDEs
%Author-R Surya Narayan
%MATLAB script to solve the 1-D advection equation
%Method: Upwind, time explicit (second-order accurate)
%==============================problem setup==============================%
time=25*0.025;%total duration of simulation
length_u=2; %length of the domain
c=1;%wave speed, (m/s)
%===================discretization parameters=============================%
mesh_u=20;%spatial mesh 
mesh_t=25;%temporal mesh-number of time steps
%compute dx dt Co
dt = time/mesh_t;%time advance
du = length_u/(mesh_u-1);%spacing along x
Co =(c*dt/du); %courant number
%========================ICs and BCs======================================%
%declare u(x)
u=ones(mesh_u,1);
%compute x-coordinates
x=linspace(0,length_u,mesh_u);
%set the IC
u(6:10)=2;
%have a look once:
%plot(x,u,'-r');
%========================Solution=========================================%
for i=1:mesh_t
    u_n=u;
    for j=2:(mesh_u-1)
        if (c>0)
            u(j)=u_n(j)-Co*(u_n(j)-u_n(j-1));
        else
            u(j)=u_n(j)-Co*(u_n(j+1)-u_n(j));
        end
    end
    plot(x,u,'-b');
    hold on;
end
hold off;
