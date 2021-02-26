%====================ABOUT================================================%
%Numerical solution to transient PDEs
%Author-R Surya Narayan
%MATLAB script to solve the 1-D advection equation
%Method: Lax-Wendroff, time explicit (second-order accurate in both space and time)
%==============================problem setup==============================%
time=25*0.025;%total duration of simulation
length_u=2; %length of the domain
c=1;%wave speed, (m/s)
%===================discretization parameters=============================%
mesh_u=100;%spatial mesh 
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
for i=0:mesh_t
    u_n=u;
    for j=2:(mesh_u-1)
        u(j)=u_n(j)-0.5*CFL*(u_n(j+1)-u_n(j-1))+0.5*(CFL^2)*(u_n(j+1)+u_n(j-1)-2*u_n(j));
    end
    if rem(i,10)==0
       plot(x,u,'-b'); 
    end
    hold on;
end
hold off;
