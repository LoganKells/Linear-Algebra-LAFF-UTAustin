function [A_out] = Scale_Matrix_unb(beta, A)
% SCALE_MATRIX_UNB
% This method scales a matrix A by a scalar beta.

% UT Austin Linear Algebra - Foundations to Frontiers
% LAFF Homework 3.3.1.3
% Date: 11/22/2020
% Created by: Logan Kells

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html

% NOTE: Visualize this algorithm using the online PictureFLAME GUI.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html

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

    % Scale vector a01 by beta. This scales the upper triangle.
    a01 = laff_scal(beta, a01);
    
    % Scale the scalar by beta. This scales the diagonal.
    alpha11 = laff_scal(beta, alpha11);
    
    % Scale the vector a10t by beta. This scales the lower triangle.
    a10t = laff_scal(beta, a10t);
    

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

end

