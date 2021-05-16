#!/usr/bin/ python3
#######################
# Author: Hugo Gayoso #
# git: hugo655        #
#######################
import pathlib
import numpy as np

path =str(pathlib.Path(__file__).parent.absolute())
print("Running dct.py in " + path +" ...")

A = np.array([[5,10,20,0]]).T
Cd = np.array([[1,1,1,1],[2,1,-1,-2],[1,-1,-1,1],[1,-2,2,-1]])
Ci = np.array([[1,1,1,1/2],[1,1/2,-1,-1],[1,-1/2,-1,1],[1,-1,1,-1/2]])
Re10 = np.array([[1/4,0,0,0],[0,1/5,0,0],[0,0,1/4,0],[0,0,0,1/5]])

P = np.dot(A.T,A)
print(A)
print(Ci@Cd@A)
print(Ci@Re10@Cd@A)
