import numpy as np 
import matplotlib.pyplot as plt 
from generationFunctions import *

trajLength = 200. #meters
yStart = 0. #m
yEnd = 8. #m

psiStart = 0. #vehicle heading in radians
psiEnd   = 0. #vehicle heading in radians

numPoints = 1000


a = generateTrajectory(trajLength, yStart, yEnd, psiStart, psiEnd)
x, y = generatePointCloud(a, trajLength, numPoints)

plt.plot(x, y)
plt.show()