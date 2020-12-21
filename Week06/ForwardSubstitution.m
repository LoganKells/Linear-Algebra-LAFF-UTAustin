function [b_out] = ForwardSubstitution(A, b)
%FORWARDSUBSTITUTION Summary of this function goes here

% Performs forward substitution using E*A*x = E*x; this solves
% x becomes E*x.

% ------------------------------------------------------------------------
% UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
% LAFF Homework 6.2.4.1
% Date: 12/20/2020
% Created by: Logan Kells

fprintf("LAFF Homework 6.2.4.1\n");
fprintf("GAUSSIANELIMINATION - See LAFF figure 6.1 (http://www.ulaff.net).\n");

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html

% NOTE: You can review a visualization of this algorithm by copying the
% code to this applicaiton.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html
% -----------------------------------------------------------------------

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
    % Calculate according to LAFF Figure 6.1 (http://www.ulaff.net).
    
    % Compute: b2 = b2 - beta1 * a21
    %   NOTE: 
    %   y_out = laff_axpy( alpha, x, y ) computes y_out = alpha * x + y.
    b2 = laff_axpy(-beta1, a21, b2);
    
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

  b_out = [ bT
            bB ];

return

