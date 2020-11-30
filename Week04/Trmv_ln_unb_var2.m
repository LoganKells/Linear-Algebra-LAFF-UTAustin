function [x_out] = Trmv_ln_unb_var2(L, x)
fprintf("LAFF Homework 4.3.2.7\n");
fprintf("TRMV_LN_UNB_VAR1 - See LAFF figure 4.7 (http://www.ulaff.net).\n");

% TRMV_LN_UNB_VAR1 = [TR]iangular [M]atrix-[V]ector multiply, 
% with [L]ower triangular matrix that is [N]ot trans-posed, [UNB]locked 
% [VAR]iant [1].

% This algorithm compute x := Ux, where U is an upper triangular matrix.

% This method calculates a matrix-vector multiplication  x_out = Ux with
% efficiency gain by assuming A is an upper triangular matrix (A->U is
% upper triangular matrix).

% The matrix U is sliced by rows and columns into sub-matrices
% and vectors which are transposed prior to calculating
% the vector-vector dot product of U_slice * x.

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html

% NOTE: You can review a visualization of this algorithm by copying the
% code to this applicaiton.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html

% UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
% LAFF Homework 4.3.2.7
% Date: 11/29/2020
% Created by: Logan Kells

  [ LTL, LTR, ...
    LBL, LBR ] = FLA_Part_2x2( L, ...
                               0, 0, 'FLA_BR' );

  [ xT, ...
    xB ] = FLA_Part_2x1( x, ...
                         0, 'FLA_BOTTOM' );

  while ( size( LBR, 1 ) < size( L, 1 ) )

    [ L00,  l01,      L02,  ...
      l10t, lambda11, l12t, ...
      L20,  l21,      L22 ] = FLA_Repart_2x2_to_3x3( LTL, LTR, ...
                                                     LBL, LBR, ...
                                                     1, 1, 'FLA_TL' );

    [ x0, ...
      chi1, ...
      x2 ] = FLA_Repart_2x1_to_3x1( xT, ...
                                    xB, ...
                                    1, 'FLA_TOP' );

    %------------------------------------------------------------%
    % Calculate according to LAFF Figure 4.7 (http://www.ulaff.net).
    % Calculate x_out = U*x
    x2 = laff_scal(chi1, l21) + x2;
    chi1 = laff_scal(chi1, lambda11);
    %------------------------------------------------------------%

    [ LTL, LTR, ...
      LBL, LBR ] = FLA_Cont_with_3x3_to_2x2( L00,  l01,      L02,  ...
                                             l10t, lambda11, l12t, ...
                                             L20,  l21,      L22, ...
                                             'FLA_BR' );

    [ xT, ...
      xB ] = FLA_Cont_with_3x1_to_2x1( x0, ...
                                       chi1, ...
                                       x2, ...
                                       'FLA_BOTTOM' );

  end

  x_out = [ xT
            xB ];

return
