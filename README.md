# Basic-Transient-PDEs
This is a repo I created to understand better the numerical solution to transient PDEs in 1-D and 2-D. An attempt is made to make the codes self-explanatory. Numerical schemes explored will be Upwind, FTCS, Lax-Friedrich's, Lax-Wendroff and Crank-Nicholson (for 1-D Advection). A few diffusion problems have also been implemented. The motivation behind this repo is simple: to understand unsteady problems better with the help of some of the most basic PDEs one can encounter. The CFL number or the Courant number comes into picture for hyperbolic and parabolic problems, which basically governs aspects of stability and tendencies of the solution to swing into wild oscillations or die down with time. It must be less than 1 for the solution to be able to converge, however, this is not a sufficient condition in itself, rather a necessary condition. Complete and stable convergence will require more analysis (a popular one is the Von Neumann analysis) and hence, will also be dictated by the discretization principle itself and the order of discretization used. For a more heuristic understanding, the CFL condition is really about setting the right time step to ensure the flow within each cell is still evolving relative to the wave speed. For all problems, the initial condition set is a hat-function/step function.   
# 1-D advection: Upwind 
A coarse mesh gave the following result. Note that there is a damping of the amplitude if the mesh isn't fine enough. Try increasing the `mesh_u` parameter in the code and you can see the wave simply move forward without any damping the amplitude. This is explained in terms of the Courant number or the CFL (Courant Freidrich Lewy) number, which must always be less than 1 for a non-amplified solution. Its wise to re-compute the timestep by fixing a CFL in contrast to what's being done in the code. As the CFL is reduced, the solution gets more dissipated. Hence, finer meshes (as long as the CFL<1), so to speak, produce better results. Try tweaking the time step `dt` in the code even with a fine grid. You will observe as soon as the CFL shoots beyond 1, there are spurious oscillations.\
![plot!](https://github.com/RSuryaNarayan/Basic-Transient-PDEs-/blob/main/Results/Upwind_1D.PNG)\
# 1-D advection: Forward-Time Centered-Space (FTCS)
Here a central-differencing scheme for the spatial variable 'u' is chosen, making it a third order accurate scheme. Alert! higher-order schemes needn't always give better results. This is one such classic example. Though a second-order accurate spatial discretization is chosen, this method can be proven to be unconditionally unstable. This means there will spurious oscillations at the end of small time intervals. Here's an example:\
![plot!](https://github.com/RSuryaNarayan/Basic-Transient-PDEs-/blob/main/Results/FTCS.PNG)\
The above figure shows the onset of oscillations after 3 time steps set with the CFL as 0.99 with 100 grid points for the spatial mesh (of length 1 unit). Not very satisfactory a method! (despite being a higher-order!)
# 1-D advection: Lax-Friedrich 
A solution to the above shortcoming was proposed by Lax & Friedrich, where the leading u-term is replaced with a spatial average of the cells adjacent to the left and right making the new method conditionally stable (von-Neumann analysis).But alert! notice how there is severe dissipation, as if there was artificial "viscosity" introduced.
![plot!](https://github.com/RSuryaNarayan/Basic-Transient-PDEs-/blob/main/Results/Lax-friedrich.PNG)\
# 1-D Diffusion: Forward-time stepping
This is a 1-D diffusion code, that uses a full Finite Difference approximation for the derivatives, first order accurate in time and second order accurate in space (for the second derivative). I have plotted the evolution of distribution of concentration (could be any scalar for that matter) with time (for ever 100 timesteps) and here's what it looks like. 
![plot!](https://github.com/RSuryaNarayan/Basic-Transient-PDEs-/blob/main/Results/Unsteady%20diffusion.PNG)\
The above uses fixed Dirchlet BCs at either ends. One can clear look at how the distribution attains a steady state. Initially the curve is flat and as time progresses the values at the extreme ends diffuse out slowly until it reaches a minimum somewhere in the middle. The magnitude of this minimum (and subsquent adjacent values) reduces untile it attains a steady state. Try tweaking the diffusion coefficent and the number of timesteps to better understand the influence of the coefficent in the steady state values. 
