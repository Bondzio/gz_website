---
author: gerolfziegenhain
comments: true
date: 2007-11-02 21:10:00+00:00
layout: post
link: https://gerolfziegenhain.wordpress.com/2007/11/02/plasticity-under-spherical-indentation/
slug: plasticity-under-spherical-indentation
title: Plasticity Under Spherical Indentation
wordpress_id: 9
categories:
- Physics
- Simulations
---

## Introduction




Plasticity is the nonreversible reaction of a material under stress. Its physics is dominated by material transport (glide) and therefore, the stress-strain relation is not unique anymore. For an ideal single crystal, this means that the crystalline structure is disturbed locally and _defects_ are generated. These defects can be classified in surface and volume defects. In experiments, surface defects are more directly accessible than volume defects. The latter can easily be investigated using atomistic simulations.
The following atomistic pictures have been obtained from a molecular-dynamics simulation of the indentation of a 8nm diameter sphere into a Cu (100) crystallite with a velocity of 12.8 m/s. The scales on the frames indicate the indentation time and the indentation depth.




## Stress Distribution




We will consider an ideal spherical indenter which is moved down into a fcc substrate in (100) direction. This process will induce a stress field. In continuum theory the region of maximal stress is predicted to be under the indenter. Consistently plasticity will also set in there.





<table >Predicted Stress Distribution [1]
<tbody >
<tr >

<td >![](http://merapi.physik.uni-kl.de/~gerolf/Plasticity/MaximalShearStress.jpg)
</td>
</tr>
</tbody>
</table>





As plasticity means that some particles will move and others not, an inhomogenous stress is essential. Therefore, ther shear stress is relevant. A scalar measure for the stress relevant for plasticity is the von Mises stress




![](http://merapi.physik.uni-kl.de/~gerolf/Plasticity/EqMises.jpg)







It follows the symmetry of the crystalline structure.





<table >Von Mises Stress Distribution (measured at the end of the elastic regime)
<tbody >
<tr >

<td >![](http://merapi.physik.uni-kl.de/~gerolf/Plasticity/MisesStressDistribution.jpg)
</td>
</tr>
</tbody>
</table>








## Onset of Plasticity


As discussed above, plasticity will set in not at the surface but in the volume of the substrate, where the theoretical maximal shear stress is exceeded.



<table >Onset of Plasticity
<tbody >
<tr >

<td >![](http://merapi.physik.uni-kl.de/~gerolf/Plasticity/OnsetPlasticity.jpg)
</td>
</tr>
</tbody>
</table>








After a primary defect cluster has been nucleated, partial dislocation loops propagate both into the volume and up to the surface. They can be observed as small cracks in the surface under the indenter. The inner of the partials has a hcp structure.





<table >Propagating Partials
<tbody >
<tr >

<td >![](http://merapi.physik.uni-kl.de/~gerolf/Plasticity/PropagatingPartials.jpg)
</td>
</tr>
</tbody>
</table>






<table >Crack under the Indenter
<tbody >
<tr >

<td >![](http://merapi.physik.uni-kl.de/~gerolf/Plasticity/CrackUnderIndenterHighlight.jpg)
</td>
</tr>
</tbody>
</table>








## Gliding and Material Transport




Under the applied stress material transport will occur. This can be imagined similar to a carpet through which a fold is moving: the fold will propagate a piece of the carpet forwards. The same happens to the crystal.





<table >Gliding of the Free Surface
<tbody >
<tr >

<td >![](http://merapi.physik.uni-kl.de/~gerolf/Plasticity/GlideOnSurface.jpg)
</td>
</tr>
</tbody>
</table>








## Cross Glide and Prismatic Loops




Energy is not only transferred into the elastic deformation but also into plasticity. If a specific energy is reached cross glide occurs; it can be seen when the moving partials change their direction. This process ends in the nucleation of a prismatic dislocation loop.





<table >Cross Glide
<tbody >
<tr >

<td >![](http://merapi.physik.uni-kl.de/~gerolf/Plasticity/CrossGlideHighlight.jpg)
</td>
</tr>
</tbody>
</table>






<table >Prismatic Dislocation Loop
<tbody >
<tr >

<td >![](http://merapi.physik.uni-kl.de/~gerolf/Plasticity/PrismaticLoop.jpg)
</td>
</tr>
</tbody>
</table>








The Mises stress of this prismatic dislocation suggests that a prismatic loop transports encapsulated shear stress into the material.





<table >Mises Stress of a Prismatic Dislocation Loop
<tbody >
<tr >

<td >![](http://merapi.physik.uni-kl.de/~gerolf/Plasticity/PrismaticLoopStress.jpg)
</td>
</tr>
</tbody>
</table>








## References





	
  1. Schematic drawing after Fischer-Cripps, Nanoindentation (2004)





* * *



G. Ziegenhain - 2.11.2007

