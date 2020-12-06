import numpy

def HW_4_4_4_3():
    print("\n-----------------------------------")
    print("LAFF Homework 4.4.4.3")
    print("http://www.ulaff.net)\n")
    # UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
    # LAFF Homework 4.4.4.3
    # Date: 12/05/2020
    # Created by: Logan Kells

    # MatrixMatrixMultiply.py
    x = numpy.matrix('1;2;3')
    print("\nx matrix:")
    print(x)

    print('\nalpha:')
    alpha = numpy.matrix('-2')
    print(alpha)

    print('\ny2:')
    y2 = x * alpha
    print(y2)

    # Note: The following would fail due to incompatible sizes: alpha is 1x1 and x is 3x1 which is not compatible with numpy.
    #y1 = alpha * x
    #print(y1)


def HW_4_4_4_5():
    print("\n-----------------------------------")
    print("LAFF Homework 4.4.4.5")
    print("http://www.ulaff.net)\n")
    # UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
    # LAFF Homework 4.4.4.5
    # Date: 12/05/2020
    # Created by: Logan Kells

    xt = numpy.matrix('1,2,3')
    print("\nxt matrix:")
    print(xt)

    alpha = numpy.matrix('-2')
    print("\nalpha:")
    print(alpha)

    y1 = alpha * xt
    print("\ny1:")
    print(y1)

def HW_4_4_4_10():
    print("\n-----------------------------------")
    print("LAFF Homework 4.4.4.10")
    print("http://www.ulaff.net)\n")
    # UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
    # LAFF Homework 4.4.4.10
    # Date: 12/05/2020
    # Created by: Logan Kells

    x = numpy.matrix('2;-1;1;3')
    b = numpy.matrix('2,-1,3')
    Y = x * b
    print("Matrix Y:")
    print(Y)

def HW_4_4_4_11():
    print("\n-----------------------------------")
    print("LAFF Homework 4.4.4.11")
    print("http://www.ulaff.net)\n")
    # UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
    # LAFF Homework 4.4.4.11
    # Date: 12/05/2020
    # Created by: Logan Kells

    x = numpy.matrix('2;-1;1;3')
    b = numpy.matrix('2,-1,3')
    Y = x * b
    print("Matrix Y:")
    print(Y)

# Run homework problems
HW_4_4_4_3()
HW_4_4_4_5()
HW_4_4_4_10()
HW_4_4_4_11()