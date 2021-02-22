# Basic-Transient-PDEs
This is a repo I created to understand better the numerical solution to transient PDEs in 1-D and 2-D. An attempt is made to make the codes self-explanatory. Numerical schemes explored will be Upwind, Lax-wendroff, Leapfrog, WENO. 
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

