function [A_out, b_out] = Solve(A, b)
% SOLVE
% This function performs these operations:
% 1) Computes the LU factorization of matrix A, A = LU , 
%   overwriting the upper triangular part of A with U and 
%   the strictly lower triangular part of A with the 
%   strictly lower triangular part of L. 
%   The result is then returned in variable A out.
% 2) Uses the factored matrix to solve Ax = b.

% ----------------------------
% Step 1)
% Solve A = LU (factorize A to LU)
LU = LU_unb_var5(A);

% ----------------------------
% Step 2A)

% Get the unit lower triangular matrix of LU
dimensionsA = size(A);
L = tril(LU, -1) + eye(dimensionsA);

% Solve LU * x = b. Where L(U * x) = b = L * z = b for vector z.
% Note z = U * x which we will solve in the subsequent step.
z = Ltrsv_unb_var1(L, b);

% ----------------------------
% Step 2B)
% Get the upper triangular matrix of U
U = triu(LU);

% Solve LU * x = b for x. Where L * z = b. Where z = U * x.
x = Utrsv_unb_var1(U, z);


% Return the results
A_out = LU;
b_out = x;

return

