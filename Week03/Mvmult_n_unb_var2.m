function [y_out] = Mvmult_n_unb_var2(A, x, y)
%MVMULT_N_UNB_VAR2

% This methods performs axpy (Ax + y) calculation.
% Note: A is matrix, x and y are vectors.

% UT Austin Linear Algebra - Foundations to Frontiers
% LAFF Homework 3.4.2.1
% Date: 11/22/2020
% Created by: Logan Kells

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html

% NOTE: Visualize this algorithm using the online PictureFLAME GUI.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html


[ AL, AR ] = FLA_Part_1x2( A, ...
                               0, 'FLA_LEFT' );
[ xT, ...
  xB ] = FLA_Part_2x1( x, ...
                         0, 'FLA_TOP' );

  while ( size( AL, 2 ) < size( A, 2 ) )

    [ A0, a1, A2 ]= FLA_Repart_1x2_to_1x3( AL, AR, ...
                                         1, 'FLA_RIGHT' );

    [ x0, ...
      chi1, ...
      x2 ] = FLA_Repart_2x1_to_3x1( xT, ...
                                    xB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%

    % Calculate Ax + y
    ax = laff_scal(chi1, a1);
    %display(ax);
    y = ax + y;

    %------------------------------------------------------------%

    [ AL, AR ] = FLA_Cont_with_1x3_to_1x2( A0, a1, A2, ...
                                           'FLA_LEFT' );

    [ xT, ...
      xB ] = FLA_Cont_with_3x1_to_2x1( x0, ...
                                       chi1, ...
                                       x2, ...
                                       'FLA_TOP' );
  end

  y_out = y;

return