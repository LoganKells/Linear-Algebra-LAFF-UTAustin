import numpy
import laff

# UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
# LAFF Homework 4.4.4.3
# Date: 12/05/2020
# Created by: Logan Kells

# MatrixMatrixMultiply.py
x = numpy.matrix('1;2;3')
print("x matrix:")
print(x)

print('\nalpha:')
alpha = numpy.matrix('-2')
print(alpha)

print('\ny2:')
y2 = x * alpha
print(y2)

#print(y1)
#y1 = alpha * x
y3 = laff.scal(alpha, x)
print(y3)