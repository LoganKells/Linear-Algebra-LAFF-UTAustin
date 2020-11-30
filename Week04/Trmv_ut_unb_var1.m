function [x_out] = Trmv_ut_unb_var1(U, x)

fprintf("LAFF Homework 4.3.2.9\n");
fprintf("TRMV_UT_UNB_VAR1 - See LAFF figure 4.3 (http://www.ulaff.net).\n");

% TRMV_UT_UNB_VAR1 = [TR]iangular [M]atrix-[V]ector multiply, 
% with [U]pper triangular matrix that is [T]rans-posed, [UNB]locked 
% [VAR]iant [1].

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html

% NOTE: You can review a visualization of this algorithm by copying the
% code to this applicaiton.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html

% UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
% LAFF Homework 4.3.2.9
% Date: 11/29/2020
% Created by: Logan Kells

  [ UTL, UTR, ...
    UBL, UBR ] = FLA_Part_2x2( U, ...
                               0, 0, 'FLA_BR' );

  [ xT, ...
    xB ] = FLA_Part_2x1( x, ...
                         0, 'FLA_BOTTOM' );

  while ( size( UBR, 1 ) < size( U, 1 ) )

    [ U00,  u01,       U02,  ...
      u10t, upsilon11, u12t, ...
      U20,  u21,       U22 ] = FLA_Repart_2x2_to_3x3( UTL, UTR, ...
                                                      UBL, UBR, ...
                                                      1, 1, 'FLA_TL' );

    [ x0, ...
      chi1, ...
      x2 ] = FLA_Repart_2x1_to_3x1( xT, ...
                                    xB, ...
                                    1, 'FLA_TOP' );

    %------------------------------------------------------------%

    % Calculate according to Figure 4.3, taking into account U is upper
    % triangular matrix.
    
    chi1 = laff_dot(u01, x0) + laff_dot(upsilon11, chi1);


    %------------------------------------------------------------%

    [ UTL, UTR, ...
      UBL, UBR ] = FLA_Cont_with_3x3_to_2x2( U00,  u01,       U02,  ...
                                             u10t, upsilon11, u12t, ...
                                             U20,  u21,       U22, ...
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


