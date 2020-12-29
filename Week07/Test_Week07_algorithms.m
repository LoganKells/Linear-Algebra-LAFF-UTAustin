fprintf("*********************************************************\n");
fprintf("LAFF Homework 7.2.1.7\n");

fprintf("Create a unit lower triangular matrixmatrix.\n"); 
% (This matrix was carefully chosen so that only integers
% are encountered during the process.)
L = [
     1     0     0     0
    -1     1     0     0
     2     1     1     0
    -2    -1     1     1
];
display(L);

fprintf("Create a right-hand side.  We are going to solve L * x = b for x.\n");
b = [
     2
     2
    11
    -3
];
display(b);

fprintf("Solve L * x = b for vector x.\n");
x = Ltrsv_unb_var2( L, b );
display(x);

fprintf("Check that L * x = b.\n");

test = b - L * x;
display(test);
fprintf("*********************************************************\n\n");