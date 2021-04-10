import numpy as np
#!pip install fxpmath
from fxpmath import Fxp
from math import tanh
# tanh function defined for fixed point hardware
def tanh_f(i):

    sign = i <0
    x = i
 
    if (sign):
        x = -i

    y = 0

    if   (x < 0.5): 
        y = x
    elif (x < 1.2): 
        y = x/2 + 0.25
    elif (x < 2.4): 
        y = x/8 + 0.7
    else:           
        y = 1

    if (sign):
        y = -y

    return y

# generate tanh testbench with assert signals from 4 to 4
# generates 80 system verilog statements
# example:
'''
in = 16'b11111110_00011010;
guess = 16'b11111111_00010000;
assert(difference <= 1);
#5;
'''
for x in range(-40,40):
    flt_x = float(x)/10.0
    bin_x = Fxp(flt_x,dtype="S8.8").bin(frac_dot=True)
    print("in = 16'b"+bin_x.replace(".","_")+";")
    tan_x = tanh_f(flt_x)
    bin_tan_x = Fxp(tan_x,dtype="S8.8").bin(frac_dot=True)
    bin_tan_x = bin_tan_x.replace(".","_")
    print("guess = 16'b" + bin_tan_x+";")
    print("assert(difference <= 1);" )
    print("#5;")