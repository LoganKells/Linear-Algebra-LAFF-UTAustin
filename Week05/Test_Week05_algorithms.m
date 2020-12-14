fprintf("*********************************************************\n");
m = 5;
n = 3;
k = 4;
C = randi( [-2,2], m, n );
A = randi( [-2,2], m, k );
B = randi( [-2,2], k, n );
% Compute A * B + C via MatMatMult
C_out = MatMatMult(A, B, C);
% Compute A * B + C using Matlab
C_out_default = A * B + C;
% Check if they compute the same
functionName = "MatMatMult";
TestSequence(functionName, C_out, C_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
m = 5;
n = 3;
k = 4;
C = randi( [-2,2], m, n );
A = randi( [-2,2], m, k );
B = randi( [-2,2], k, n );
% Compute A * B + C via MatMatMult
C_out = Gemm_unb_var1( A, B, C );
% Compute A * B + C
C_out_default = A * B + C;
% Check if they compute the same
functionName = "Gemm_unb_var1";
TestSequence(functionName, C_out, C_out_default)
fprintf("*********************************************************\n\n");

fprintf("*********************************************************\n");
m = 5;
n = 3;
k = 4;
C = randi( [-2,2], m, n );
A = randi( [-2,2], m, k );
B = randi( [-2,2], k, n );
% Compute A * B + C via MatMatMult
C_out = Gemm_unb_var2( A, B, C );
% Compute A * B + C
C_out_default = A * B + C;
% Check if they compute the same
functionName = "Gemm_unb_var2";
TestSequence(functionName, C_out, C_out_default)
fprintf("*********************************************************\n\n");

fprintf("*********************************************************\n");
m = 5;
n = 3;
k = 4;
C = randi( [-2,2], m, n );
A = randi( [-2,2], m, k );
B = randi( [-2,2], k, n );
% Compute A * B + C via MatMatMult
C_out = Gemm_unb_var3( A, B, C );
% Compute A * B + C
C_out_default = A * B + C;
% Check if they compute the same
functionName = "Gemm_unb_var3";
TestSequence(functionName, C_out, C_out_default)
fprintf("*********************************************************\n\n");

fprintf("*********************************************************\n");
U = randi( [-2,2], 4, 4 );
R = randi( [-2,2], 4, 4 );
C = randi( [-2,2], 4, 4 );
C_out = Trtrmm_unb_var1( U, R, C );
% Now, remember that only the upper triangular part changed.  So,
% tril( Cout,-1 ) should equal tril( C,-1 ) and triu( Cout ) should equal 
% triu( U ) * triu( R )
if ~isequal( tril( C_out, -1 ), tril( C, -1 ) )
    disp( 'TROUBLE: The lower triangular part of C was corrupted' ) 
elseif ~isequal( triu( C_out ), triu( U ) * triu( R ) )
    disp( 'TROUBLE: The lower triangular part of C was corrupted' )
else
    disp( 'Trtrmm_unb_var1 appears to give the right answer' )
end
fprintf("*********************************************************\n\n");