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

fprintf("*********************************************************\n");
fprintf("Create a matrix.\n");
% (This matrix was carefully chosen so that only integers
% are encountered during the process.)
A = [
     2     0     1     2 
    -2    -1     1    -1 
     4    -1     5     4 
    -4     1    -3    -8 
];

% Perform LU factorization
fprintf("Step 1) Perform Gaussian elimination:\n");
fprintf("Matrix LU:\n");
LU = LU_unb_var5( A );
display(LU);


fprintf("Extract the unit lower triangular matrix, L.\n");
L = tril( LU, -1 ) + eye( size( LU ) );
display(L);

fprintf("Extract the upper triangular matrix, U.\n");
U = triu( LU );
display(U);

fprintf("Check that A = L * U.\n");
test = A - L * U;
display(test);
fprintf("*********************************************************\n\n");

fprintf("*********************************************************\n");

fprintf("Create a unit lower triangular matrix.\n");
% (This matrix was carefully chosen so that only integers
% are encountered during the process.)
L = [
     1     0     0     0
    -1     1     0     0
     2     1     1     0
    -2    -1     1     1
];
display(L);

fprintf("Create a right-hand side.  We are going to solve L x = b.\n");
b = [
     2
     2
    11
    -3
];
display(b);

fprintf("Solve L x = b.\n");
x = Ltrsv_unb_var1( L, b );
display(x);

fprintf("Check that L x = b.\n");
test = b - L * x;
display(test);

fprintf("*********************************************************\n\n");