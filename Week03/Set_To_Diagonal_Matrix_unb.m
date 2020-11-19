function [A_out] = Set_To_Diagonal_Matrix_unb(A, b)
%SET_TO_DIAGONAL_MATRIX_UNB

% LAFF Homework 3.2.2.2
% Date: 11/18/2020
% Created by: Logan Kells

% With the FLAME@lab API, write a function that sets the diagonal entries 
% of a given square matrix A to the entries in a given column vector x 
% based on the following algorithm:

% NOTE: You will use the functions laff_zerov( x ) and laff_onev( x ), 
% which returns a zero vector of the same size and shape (column or row) 
% as input vector x. 
% Check if that routine is in directory: ./laff/vecvec


% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html

  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  [ bT, ...
    bB ] = FLA_Part_2x1( b, ...
                         0, 'FLA_TOP' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    [ b0, ...
      beta1, ...
      b2 ] = FLA_Repart_2x1_to_3x1( bT, ...
                                    bB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%

    % Set vector a01 to zeros
    a01 = laff_zerov(a01);
    % Set the scalar alpha11 to beta1
    alpha11 = beta1;
    % Set vector a21 to zeros
    a21 = laff_zerov(a21);

    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

    [ bT, ...
      bB ] = FLA_Cont_with_3x1_to_2x1( b0, ...
                                       beta1, ...
                                       b2, ...
                                       'FLA_TOP' );

  end

  A_out = [ ATL, ATR
            ABL, ABR ];

return

