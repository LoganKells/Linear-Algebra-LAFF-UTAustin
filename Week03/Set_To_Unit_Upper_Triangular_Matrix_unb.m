function [A_out] = Set_To_Unit_Upper_Triangular_Matrix_unb(A)
%SET_TO_UNIT_UPPER_TRIANGULAR_MATRIX_UNB - sets input matrix A to
% the UNIT upper triangular matrix (lower triangular is zeros, diagonal is ones).

% LAFF Homework 3.2.2.2
% Date: 11/19/2020
% Created by: Logan Kells

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html


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

    % Set lower triangular matrix to zeros.
    a21 = laff_zerov(a21);
    % Set the diagonal to ones.
    alpha11 = laff_onev(alpha11);

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



