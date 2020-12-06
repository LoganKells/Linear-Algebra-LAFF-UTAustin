function [y_out] = Symv_u_unb_var2(U, x, y)
% SYMV_U_UNB_VAR2 Summary of this function goes here

fprintf("LAFF Homework 4.3.3.1\n");
fprintf("SYMV_U_UNB_VAR2 - See LAFF figure 4.8 (http://www.ulaff.net).\n");

% SYMV_U_UNB_VAR2 = [SY]mmetric [M]atrix-[V]ector multiply, 
% with [U]pper triangular-symmetry matrix, [UNB]locked [VAR]iant [2].

% The matrix U is sliced by rows and columns into sub-matrices
% and vectors which are transposed prior to calculating
% the vector-vector dot product of U_slice * x.

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html

% NOTE: You can review a visualization of this algorithm by copying the
% code to this applicaiton.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html

% UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
% LAFF Homework 4.3.3.1
% Date: 12/01/2020
% Created by: Logan Kells

  [ UTL, UTR, ...
    UBL, UBR ] = FLA_Part_2x2( U, ...
                               0, 0, 'FLA_TL' );

  [ xT, ...
    xB ] = FLA_Part_2x1( x, ...
                         0, 'FLA_TOP' );

  [ yT, ...
    yB ] = FLA_Part_2x1( y, ...
                         0, 'FLA_TOP' );

  while ( size( UTL, 1 ) < size( U, 1 ) )

    [ U00,  u01,       U02,  ...
      u10t, upsilon11, u12t, ...
      U20,  u21,       U22 ] = FLA_Repart_2x2_to_3x3( UTL, UTR, ...
                                                      UBL, UBR, ...
                                                      1, 1, 'FLA_BR' );

    [ x0, ...
      chi1, ...
      x2 ] = FLA_Repart_2x1_to_3x1( xT, ...
                                    xB, ...
                                    1, 'FLA_BOTTOM' );

    [ y0, ...
      psi1, ...
      y2 ] = FLA_Repart_2x1_to_3x1( yT, ...
                                    yB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%

    % Calculate according to LAFF Figure 4.8 (http://www.ulaff.net).
    % Transpose u12t from row to column vector
    u12 = laff_copy(u12t, y2);
    
    y0 = laff_scal(chi1, u01) + y0;
    psi1 = laff_scal(chi1, upsilon11) + psi1;
    y2 = laff_scal(chi1, u12) + y2;

    %------------------------------------------------------------%

    [ UTL, UTR, ...
      UBL, UBR ] = FLA_Cont_with_3x3_to_2x2( U00,  u01,       U02,  ...
                                             u10t, upsilon11, u12t, ...
                                             U20,  u21,       U22, ...
                                             'FLA_TL' );

    [ xT, ...
      xB ] = FLA_Cont_with_3x1_to_2x1( x0, ...
                                       chi1, ...
                                       x2, ...
                                       'FLA_TOP' );

    [ yT, ...
      yB ] = FLA_Cont_with_3x1_to_2x1( y0, ...
                                       psi1, ...
                                       y2, ...
                                       'FLA_TOP' );

  end
  y_out = [ yT
            yB ];
return