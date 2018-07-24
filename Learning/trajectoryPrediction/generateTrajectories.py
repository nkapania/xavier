import numpy as np 
#from tqdm import tqdm
import matplotlib.pyplot as plt 
from generationFunctions import *

##################################################################
################ INITIALIZE HYPER PARAMETERS #####################
##################################################################

NUM_TRAJECTORIES = int(2.5E8)
TRAJ_LENGTH = 200 #meters
POINTS_PER_METER = .01
METERS_PER_MILE = 1609.34 
NUM_PTS = int(TRAJ_LENGTH * POINTS_PER_METER)

initial_offset = 2.0 #meters - center of opposite lane
initial_heading = 0.0 #degrees 
offset_stddev = 0.5 #meters 
heading_stddev   = 2.0 * np.pi / 180 #radians

##################################################################
############# INITIALIZE ARRAYS###################################
##################################################################
yStart = initial_offset + offset_stddev*np.random.randn(NUM_TRAJECTORIES,1)
yEnd   = yStart + offset_stddev*np.random.randn(NUM_TRAJECTORIES,1)
psiStart = initial_heading + heading_stddev*np.random.randn(NUM_TRAJECTORIES, 1) #vehicle heading in radians
psiEnd = psiStart + heading_stddev*np.random.randn(NUM_TRAJECTORIES, 1) 

X = np.zeros(( NUM_PTS , NUM_TRAJECTORIES))
Y = np.zeros(( NUM_PTS , NUM_TRAJECTORIES))

# plt.plot(yStart)
# plt.show()

# ###################################################################
# ############### GENERATE SAMPLE TRAJECTORIES ######################
# ###################################################################

# print("Generating Trajectories!")
# for i in tqdm(range(NUM_TRAJECTORIES)):
# 	X[:,i], Y[:,i] = generateTrajectory(TRAJ_LENGTH, yStart[i], yEnd[i], psiStart[i], psiEnd[i], POINTS_PER_METER)


miles_simulated = TRAJ_LENGTH * NUM_TRAJECTORIES / METERS_PER_MILE
print("%d miles simulated" %miles_simulated)


# ####################################################################
# ###################### PLOT INTERESTING TRAJECTORIES ###############
# ####################################################################

# plt.plot(X,Y)
# plt.ylim(0,8)
# plt.xlim(0, TRAJ_LENGTH) 
# plt.plot([0, TRAJ_LENGTH], [4, 4],linewidth = 2.0, color = 'k', ls = '--')
# plt.show()