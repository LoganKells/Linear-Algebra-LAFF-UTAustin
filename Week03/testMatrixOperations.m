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
display(A_D)

