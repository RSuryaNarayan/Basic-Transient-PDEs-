%====================ABOUT================================================%
%Numerical solution to transient PDEs
%Author-R Surya Narayan
%MATLAB script to solve the 1-D advection equation
%Method: Leapfrog, time explicit (second-order accurate)
%==============================problem setup==============================%
time=25*0.025;%total duration of simulation
length_u=2; %length of the domain
c=1;%wave speed, (m/s)
%===================discretization parameters=============================%
mesh_u=100;%spatial mesh 
mesh_t=45;%temporal mesh-number of time steps
%compute dx dt Co
du = length_u/(mesh_u-1);%spacing along x
CFL =0.5; %courant number
dt=CFL*dx/c;
%========================ICs and BCs======================================%
%declare u(x)
u=ones(mesh_u,1);
%compute x-coordinates
x=linspace(0,length_u,mesh_u);
%set the IC
u(6:10)=2;
%have a look once:
plot(x,u,'-r');
u_nm1=u;u_np1=u;
%compute u_n using any scheme
for i=2:2
    u_n=u;
    for j=2:mesh_u-1
        u(j)=0.5*(u_n(j+1)+u_n(j-1))-0.5*CFL*(u_n(j+1)-u_n(j-1));
    end
end
u_n=u;
plot(x,u,'-b');
%========================Solution=========================================%
for i=3:mesh_t
    for j=2:(mesh_u-1)
        u_np1(j)=u_nm1(j)-CFL*(u_n(j+1)-u_n(j-1));
    end
    u_nm1=u_n;
    u_n=u_np1;
    if i==10
       plot(x,u_np1,'-r'); 
    end
    if i==20
       plot(x,u_np1,'-g'); 
    end
    hold on;
end
hold off;
