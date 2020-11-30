function [x_out] = Trmv_lt_unb_var2(L, x)
fprintf("LAFF Homework 4.3.2.9\n");
fprintf("TRMV_LT_UNB_VAR2 - See LAFF figure 4.3 (http://www.ulaff.net).\n");

% TRMV_LT_UNB_VAR1 = [TR]iangular [M]atrix-[V]ector multiply, 
% with [L]ower triangular matrix that is [T]rans-posed, [UNB]locked 
% [VAR]iant [2].

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html

% NOTE: You can review a visualization of this algorithm by copying the
% code to this applicaiton.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html

% UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
% LAFF Homework 4.3.2.9
% Date: 11/29/2020
% Created by: Logan Kells


  [ LTL, LTR, ...
    LBL, LBR ] = FLA_Part_2x2( L, ...
                               0, 0, 'FLA_TL' );

  [ xT, ...
    xB ] = FLA_Part_2x1( x, ...
                         0, 'FLA_TOP' );

  while ( size( LTL, 1 ) < size( L, 1 ) )

    [ L00,  l01,      L02,  ...
      l10t, lambda11, l12t, ...
      L20,  l21,      L22 ] = FLA_Repart_2x2_to_3x3( LTL, LTR, ...
                                                     LBL, LBR, ...
                                                     1, 1, 'FLA_BR' );

    [ x0, ...
      chi1, ...
      x2 ] = FLA_Repart_2x1_to_3x1( xT, ...
                                    xB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%
    % Calculate according to Figure 4.3, taking into account L is lower
    % triangular matrix.
    % Pre-transpose l10t to column vector (from row vector).
    l10 = laff_copy(l10t, x0);
    % Calculate the matrix-vector multiplication.
    x0 = laff_scal(chi1, l10) + x0;
    chi1 = laff_scal(chi1, lambda11);
    %------------------------------------------------------------%

    [ LTL, LTR, ...
      LBL, LBR ] = FLA_Cont_with_3x3_to_2x2( L00,  l01,      L02,  ...
                                             l10t, lambda11, l12t, ...
                                             L20,  l21,      L22, ...
                                             'FLA_TL' );

    [ xT, ...
      xB ] = FLA_Cont_with_3x1_to_2x1( x0, ...
                                       chi1, ...
                                       x2, ...
                                       'FLA_TOP' );

  end

  x_out = [ xT
            xB ];

return


