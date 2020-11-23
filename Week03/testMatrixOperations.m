%*****************************************************************
% UT Austin Linear Algebra - Foundations to Frontiers
% Testing algorithms created in Week 3.

% Created by: Logan Kells
%*****************************************************************


% Convert matrix A to zero matrix
disp("***************************");
disp("Testing Zero Matrix Operation...");
A = randi([-9,9], 5,4);
A_0 = ZeroMatrix_unb(A);
display(A_0);

% Convert matrix A to identify matrix. NOTE: Must be n x n matrix.
disp("***************************");
A = randi([-9,9], 4, 4);
disp("Calculating identity matrix of A");
A_I = Set_To_Identity_unb(A);
display(A_I);

% Convert matrix A to the diagonal using x-vector input.
disp("***************************");
disp("Calculating diagonal matrix A_D of input vector, x");
A = randi([-9,9], 4, 4);
x = [1
    2
    3
    4];
A_D = Set_To_Diagonal_Matrix_unb(A, x);
display(A_D);

% Convert matrix A to the upper triangular matrix.
disp("***************************");
disp("Converting A to upper triangular matrix...");
A = randi([-9,9],5,5);
A_upperT = Set_To_Upper_Triangular_Matrix_unb(A);
display(A_upperT);

% Convert matrix A to the STRICTLY upper triangular matrix.
disp("***************************");
disp("Converting A to STRICTLY upper triangular matrix...");
A = randi([-9,9],5,5);
A_upperStrictT = Set_To_Strictly_Upper_Triangular_Matrix_unb(A);
display(A_upperStrictT);

% Convert matrix A to the UNIT upper triangular matrix.
disp("***************************");
disp("Converting A to UNIT upper triangular matrix...");
A = randi([-9,9],5,5);
A_upperUnitT = Set_To_Unit_Upper_Triangular_Matrix_unb(A);
display(A_upperUnitT);

% Convert matrix A to the STRICTLY lower triangular matrix.
disp("***************************");
disp("Converting A to STRICTLY lower triangular matrix...");
A = randi([-9,9],5,5);
A_lowerStrictT = Set_To_Strictly_Lower_Triangular_Matrix_unb(A);
display(A_lowerStrictT);

% Convert matrix A to the UNIT lower triangular matrix.
disp("***************************");
disp("Converting A to UNIT lower triangular matrix...");
A = randi([-9,9],5,5);
A_lowerUnitT = Set_To_Unit_Lower_Triangular_Matrix_unb(A);
display(A_lowerUnitT);

% Transpose matrix A
disp("***************************");
disp("Testing transposing a matrix A");
disp("Matrix A:");
A = randi([-9,9],5,5);
B = randi([-9,9],5,5);
display(A);
disp("Matrix A Transpose:");
A_T = Transpose_unb(A, B);
display(A_T);

% Symmetrize from lower triangular matrix.
disp("***************************");
disp("Testing Symmetrizing from a lower triangular matrix input");
A = randi([-9,9],5,5);
display(A);
A_lowerT = Set_To_Lower_Triangular_Matrix_unb(A);
A_symmetric = Symmetrize_From_Lower_Triangle_unb(A_lowerT);
display(A_symmetric);

% Symmetrize from lower triangular matrix.
disp("***************************");
disp("Testing Symmetrizing from a upper triangular matrix input");
A = randi([-9,9],5,5);
display(A);
A_upperT = Set_To_Upper_Triangular_Matrix_unb(A);
A_symmetric = Symmetrize_From_Upper_Triangle_unb(A_upperT);
display(A_symmetric);

% Scale a matrix A with scalar beta.
disp("***************************");
disp("Testing Scaling a matrix.");
A = randi([-9,9],5,5);
display(A);
beta = 2;
disp("beta = " + beta);
A_scaled = Scale_Matrix_unb(beta, A);
display(A_scaled);

% Calculate axpy using matrix-vector dot products: Ax + y
disp("***************************");
disp("Testing y_out = Ax + y calculation variant 1 (HW #3.4.1.1)");
A = randi([-9,9], 3, 3); % 5x5 matrix.
x = randi([-9,9], 3, 1); % 5x1 column vector.
y = laff_zerov(x); % 5x1 column vector.
display(A);
display(x);
display(y);
y_out = Mvmult_n_unb_var1(A, x, y);
display(y_out);

% Calculate axpy using matrix-vector dot products: Ax + y
disp("***************************");
disp("Testing y_out = Ax + y calculation variant 2 (HW #3.4.2.1)");
A = randi([-9,9], 3, 3); % 5x5 matrix.
x = randi([-9,9], 3, 1); % 5x1 column vector.
y = laff_zerov(x); % 5x1 column vector.
display(A);
display(x);
display(y);
y_out = Mvmult_n_unb_var2(A, x, y);
display(y_out);
