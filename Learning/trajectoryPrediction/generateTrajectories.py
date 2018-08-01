import numpy as np 
from tqdm import tqdm
import matplotlib.pyplot as plt 
from generationFunctions import *
import time
import pdb

##################################################################
################ INITIALIZE PARAMETERS #####################
##################################################################

#Trajectories and geometric constants
NUM_TRAJECTORIES = int(8.0E4) #need this many to generate collision trajectories
TRAJ_LENGTH = 200 #meters

POINTS_PER_METER = 2
METERS_PER_MILE = 1609.34 
NUM_PTS = int(TRAJ_LENGTH * POINTS_PER_METER)

ROAD_WIDTH = 8.0 #meters
MEDIAN_POSITION = ROAD_WIDTH / 2

initial_offset = MEDIAN_POSITION / 2 #meters - center of opposite lane
initial_heading = 0.0 #degrees 



offset_stddev = 0.5 #meters 
heading_stddev   = 2.0 * np.pi / 180 #radians
##################################################################
############# INITIALIZE ARRAYS###################################
##################################################################
X = []
Y = []

####################################################################
################ GENERATE SAMPLE TRAJECTORIES ######################
####################################################################

# print("Generating Trajectories!")

tic = time.time()
for i in tqdm(range(NUM_TRAJECTORIES)):
    yStart = initial_offset + offset_stddev*np.random.randn()
    yEnd   = yStart + offset_stddev*np.random.randn()
    psiStart = initial_heading + heading_stddev*np.random.randn() #vehicle heading in radians
    psiEnd = psiStart + heading_stddev*np.random.randn()
    x, y = generateTrajectory(TRAJ_LENGTH, yStart, yEnd, psiStart, psiEnd, POINTS_PER_METER)

toc = time.time()
ttime = t2 - t1

miles_simulated = TRAJ_LENGTH * NUM_TRAJECTORIES / METERS_PER_MILE
print("%d miles simulated" %miles_simulated)
print("Elapsed time is %d seconds" %ttime)
#####################################################################
####################### PLOT INTERESTING TRAJECTORIES ###############
#####################################################################

# plt.plot(X,Y)
# plt.ylim(0,8)
# plt.xlim(0, TRAJ_LENGTH) 
# plt.plot([0, TRAJ_LENGTH], [4, 4],linewidth = 2.0, color = 'k', ls = '--')
# plt.show()