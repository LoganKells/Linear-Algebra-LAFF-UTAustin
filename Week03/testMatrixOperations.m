% Create a random matrix
A = randi([-9,9], 5,4);

% Convert matrix A to zero matrix
disp("Testing Zero Matrix Operation...");
A_0 = ZeroMatrix_unb(A);
display(A_0);

% Convert matrix A to identify matrix. NOTE: Must be n x n matrix.
A = randi([-9,9], 4, 4);
disp("Calculating identity matrix of A");
A_I = Set_To_Identity_unb(A);
display(A_I);

% Convert matrix A to the diagonal using x-vector input.
disp("Calculating diagonal matrix A_D of input vector, x");
A = randi([-9,9], 4, 4);
x = [1
    2
    3
    4];
A_D = Set_To_Diagonal_Matrix_unb(A, x);
display(A_D);

% Convert matrix A to the upper triangular matrix.
disp("Converting A to upper triangular matrix...");
A = randi([-9,9],5,5);
A_upperT = Set_To_Upper_Triangular_Matrix_unb(A);
display(A_upperT);

% Convert matrix A to the STRICTLY upper triangular matrix.
disp("Converting A to STRICTLY upper triangular matrix...");
A = randi([-9,9],5,5);
A_upperStrictT = Set_To_Strictly_Upper_Triangular_Matrix_unb(A);
display(A_upperStrictT);

% Convert matrix A to the UNIT upper triangular matrix.
disp("Converting A to UNIT upper triangular matrix...");
A = randi([-9,9],5,5);
A_upperUnitT = Set_To_Unit_Upper_Triangular_Matrix_unb(A);
display(A_upperUnitT);

% Convert matrix A to the STRICTLY lower triangular matrix.
disp("Converting A to STRICTLY lower triangular matrix...");
A = randi([-9,9],5,5);
A_lowerStrictT = Set_To_Strictly_Lower_Triangular_Matrix_unb(A);
display(A_lowerStrictT);

% Convert matrix A to the UNIT lower triangular matrix.
disp("Converting A to UNIT lower triangular matrix...");
A = randi([-9,9],5,5);
A_lowerUnitT = Set_To_Unit_Lower_Triangular_Matrix_unb(A);
display(A_lowerUnitT);
