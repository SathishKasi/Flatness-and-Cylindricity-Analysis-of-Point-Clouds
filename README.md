# Flatness-and-Cylindricity-Analysis-of-Point-Clouds
In-situ geometrical quality assessment during printing process in additive manufacturing is of key
importance to realize online corrective action during deposition but also to detect defects formation and
enable quantitative understanding of their temporal evolution. In particular, quantities such as flatness
or cylindricity defined as in geometric dimensioning and tolerancing (GD&T) can be used to monitor
the current state of the printed part. Moreover, various process variables such as the deposition speed,
temperature, infill can be studied in terms of these basic quantities the geometric integrity for printed
parts. Using basic quantities from GD&T has additional advantage. These are terms that are widely
accepted by the community and can be used to certify the printed part with specific tolerance limits.
However, there are no means to certify printed part during printing process and it remains unexplored
area of research or engineering.
In this paper, we develop the framework for cost effective, in situ assessment of part geometric integrity.
We collect point cloud data from light scanner. We use computationally efficient algorithms to decouple
the input point cloud data into set of primitive shapes such as plane, cylinder, sphere and torus. We
focused on the selected features from GD&T such as flatness, cylindricity, and circularity. We report
the run time for cylindricity calculations of the order of seconds for point cloud data sets consisting of
thousands of points. This contribution clearly shows the viability of the in situ geometric integrity
assessment. Finally, we study the effect of different process parameters (e.g. infill) on the parts to
establish quantitative relationship between process parameters and geometric integrity of part primitive
shapes.
