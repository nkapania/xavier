import numpy as np

def generateTrajectory(xEnd, yStart, yEnd, psiStart, psiEnd):
	#Given start and end conditions, generates polynomial coefficients for a 3rd order cubic trajectory

	#First generate unit trajectory with correct heading angle
	dy0 = np.tan(psiStart)
	dy1 = np.tan(psiEnd)

	a = _generateUnitTrajectory(yStart, yEnd, dy0, dy1)
	a = _transformUnitTrajectory(a, xEnd)

	return a


def _generateUnitTrajectory(y0, y1, dy0, dy1):
	#Generates trajectory from x = 0 to x = 1 given y(0), y(1), y'(0), y'(1) - returns 
	#3rd order polynomial coefficents a3, a2, a1, a0 in np array.

	#initial conditions
	y = np.array( [y0, y1, dy0, dy1] ).T

	#matrix derived from solving boundary conditions
	A = np.array( [[0, 0, 0, 1.], [1., 1., 1., 1.], [0., 0., 1., 0.], [3., 2., 1., 0.]] )

	a = np.dot( np.linalg.pinv(A) , y ) 
    


	return a[:, np.newaxis]

def _transformUnitTrajectory(a, xStretch, yStretch = 1., xShift = 0., yShift = 0.):
	#Given 3rd order polynomial, scale function as specified
	#input, a =  4 x 1 np array
	#output, polynomial coefficients 

	#transform by x
	a[0] = a[0] / xStretch**3
	a[1] = a[1] / xStretch**2
	a[2] = a[2] / xStretch
	a[3] = a[3] ##Don't need to modify last element!

	#transform by y
	a = a * yStretch

	return a

def generatePointCloud(a, L, N):
	#plots trajectory given coefficients, number of points, and start and end x
	x = np.linspace(0 , L ,N)
	x = x[:, np.newaxis]

	y = a[0]*x**3 + a[1]*x**2 + a[2]*x + a[3]

	return x,y