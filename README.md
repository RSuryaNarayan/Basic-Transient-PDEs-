# Basic-Transient-PDEs
This is a repo I created to understand better the numerical solution to transient PDEs in 1-D and 2-D. An attempt is made to make the codes self-explanatory. Numerical schemes explored will be Upwind, Lax-wendroff, Leapfrog, WENO and much more. Stay tuned! 
# 1-D advection: Upwind 
A coarse mesh gave the following result. Note that there is a damping of the amplitude if the mesh isn't fine enough. Try increasing the `mesh_u` parameter in the code and you can see the wave simply move forward without any damping the amplitude. 
![plot!](https://github.com/RSuryaNarayan/Basic-Transient-PDEs-/blob/main/Results/Upwind_1D.PNG)
