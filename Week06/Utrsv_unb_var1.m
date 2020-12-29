function [b_out] = Utrsv_unb_var1(U, b)
%UTRSV_UNB_VAR1 
% [U]pper [TR]iangular [S]ol[V]e [UNB]locked [VAR]iant [1]

% Performs solving U * x = b for vector x. 
% NOTE: The algorithm loop overrides input vector b to save memory operations.
%       such that x becomes b_out.

% ------------------------------------------------------------------------
% UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
% LAFF Homework 6.3.3.2
% Date: 12/24/2020
% Created by: Logan Kells

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html
% -----------------------------------------------------------------------
  [ UTL, UTR, ...
    UBL, UBR ] = FLA_Part_2x2( U, ...
                               0, 0, 'FLA_BR' );

  [ bT, ...
    bB ] = FLA_Part_2x1( b, ...
                         0, 'FLA_BOTTOM' );

  while ( size( UBR, 1 ) < size( U, 1 ) )

    [ U00,  u01,       U02,  ...
      u10t, upsilon11, u12t, ...
      U20,  u21,       U22 ] = FLA_Repart_2x2_to_3x3( UTL, UTR, ...
                                                      UBL, UBR, ...
                                                      1, 1, 'FLA_TL' );

    [ b0, ...
      beta1, ...
      b2 ] = FLA_Repart_2x1_to_3x1( bT, ...
                                    bB, ...
                                    1, 'FLA_TOP' );

    %------------------------------------------------------------%
    % Calculate according to LAFF Figure 6.9 (http://www.ulaff.net).
    % beta1 = (beta1 - u12t * b2) * (1 / upsilon11)
    
    beta1 = beta1 - laff_dot(u12t, b2);
    beta1 = beta1 * (1 / upsilon11);

    %------------------------------------------------------------%

    [ UTL, UTR, ...
      UBL, UBR ] = FLA_Cont_with_3x3_to_2x2( U00,  u01,       U02,  ...
                                             u10t, upsilon11, u12t, ...
                                             U20,  u21,       U22, ...
                                             'FLA_BR' );

    [ bT, ...
      bB ] = FLA_Cont_with_3x1_to_2x1( b0, ...
                                       beta1, ...
                                       b2, ...
                                       'FLA_BOTTOM' );

  end

  b_out = [ bT
            bB ];

return

