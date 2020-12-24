function [A_out] = GaussianElimination(A)
% GAUSSIANELIMINATION

% Performs Gaussian Elimination by LU Factorization; A = LU.
% NOTE: The algorithm loop overrides the input matrix A to save memory operations
%       such that LU becomes A_out.

% Performs Gaussian Elmination to solve for the 
% matrix E such that E*A = LU (LU is the combination (addition) of the
% Lower triangular matrix representing E, and the upper triangular Matrix
% results of E*A).

% ------------------------------------------------------------------------
% UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
% LAFF Homework 6.2.4.1
% Date: 12/20/2020
% Created by: Logan Kells

fprintf("LAFF Homework 6.2.4.1\n");
fprintf("GAUSSIANELIMINATION - See LAFF figure 6.1 (http://www.ulaff.net).\n");

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html

% NOTE: You can review a visualization of this algorithm by copying the
% code to this applicaiton.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html
% -----------------------------------------------------------------------

  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    %------------------------------------------------------------%
    % Calculate according to LAFF Figure 6.1 (http://www.ulaff.net).
    
    % Calculate the E matrix, whose values in e21 are important, while the 
    % rest of E is the I matrix.
    %   NOTE:
    %   x_out = laff_invscal( alpha, x ) scales vector x by 1/alpha
    %   Vector x a column or row vector.  In other words, x can be 
    %   a n x 1 or 1 x n array.  However, one size must equal 1 and the 
    %   other size equal n.
    a21 = laff_invscal(alpha11, a21); % a21 = (1 / alpha11) * a21;
    
    % Calculate Gaussian elimination results.
    % A22 = A22 - e21*A22; where e21 = a21 which is stored in A.
    %   NOTE:
    %   laff_ger( alpha, x, y, A )
    %   computes alpha * x * y' + A
    %   but it is a bit tricky: x and y can be row or column vectors, in any
    %   combination.
    A22 = laff_ger(-1, a21, a12t, A22);
    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

  end

  A_out = [ ATL, ATR
            ABL, ABR ];

return

