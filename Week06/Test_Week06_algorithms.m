fprintf("*********************************************************\n");
% Create a matrix.  (This matrix was carefully chosen so that only integers
% are encountered during the process.)

fprintf("Initial values of Ax = b:");
A = [
     2     0     1     2 
    -2    -1     1    -1 
     4    -1     5     4 
    -4     1    -3    -8 
    ];
% Create a right-hand side.  We are going to solve A x = b
b = [
     2
     2
    11
    -3
    ];
display(A);
display(b);

fprintf("Step 1) Perform Gaussian elimination:\n");
fprintf("Matrix LU:");
fprintf("(E is stored within LU where A is the upper triangular matrix.\n");
fprintf("and L is non-diagonal values of E)");

LU = GaussianElimination(A);
display(LU);

fprintf("Matrix U:\n");
fprintf("This is the upper triangular matrix after Gaussian Elimination.)");
% Extract the upper triangular matrix from the matrix that resulted from
% Gaussian elminination:
U = triu( LU );
display(U)

% Perform forward substitution
fprintf("Step 2) Perform forward substitution on b:\n");
fprintf("(note: Ax = b)\n");
bhat = ForwardSubstitution( LU, b );
display(bhat);


fprintf("Step 3) Solve U x = bhat");
x = U \ bhat;
display(x);

fprintf ("Step 4) Check the answer of: Ax = b");
display(b);
fprintf("A * x =\n\n");
display(A * x);

fprintf("*********************************************************\n\n");