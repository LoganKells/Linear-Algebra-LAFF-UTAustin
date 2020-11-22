function [B_out] = Transpose_unb(A, B)
    
% Transpose_unb(A) - returns A transponsed matrix.

% LAFF Homework 3.2.5.3
% Date: 11/21/2020
% Created by: Logan Kells

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html
  
  [ AT, ...
    AB ] = FLA_Part_2x1( A, ...
                         0, 'FLA_TOP' );

  [ BL, BR ] = FLA_Part_1x2( B, ...
                               0, 'FLA_LEFT' );

  while ( size( AT, 1 ) < size( A, 1 ) )

    [ A0, ...
      a1t, ...
      A2 ] = FLA_Repart_2x1_to_3x1( AT, ...
                                    AB, ...
                                    1, 'FLA_BOTTOM' );

    [ B0, b1, B2 ]= FLA_Repart_1x2_to_1x3( BL, BR, ...
                                         1, 'FLA_RIGHT' );

    %------------------------------------------------------------%
    % Use copy to transpose a1t back to a1 (meaning from row to column
    % matrix)
    a1t_transposed = laff_copy(a1t, b1);
    
    
    b1 = a1t_transposed;

    %------------------------------------------------------------%

    [ AT, ...
      AB ] = FLA_Cont_with_3x1_to_2x1( A0, ...
                                       a1t, ...
                                       A2, ...
                                       'FLA_TOP' );

    [ BL, BR ] = FLA_Cont_with_1x3_to_1x2( B0, b1, B2, ...
                                           'FLA_LEFT' );

  end

  A_out = [ AT
            AB ];

  B_out = [ BL, BR ];

return
