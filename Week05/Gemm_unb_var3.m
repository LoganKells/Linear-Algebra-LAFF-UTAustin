function [C_out] = Gemm_unb_var3(A, B, C)

% GEMM_UNB_VAR1 = [G]eneric [M]atrix [M]ultiplication [UNB]locked [VAR]iant [3].

% ------------------------------------------------------------------------
% UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
% LAFF Homework 5.3.4.2
% Date: 12/12/2020
% Created by: Logan Kells

fprintf("LAFF Homework 5.3.4.2\n");
fprintf("GEMM_UNB_VAR2 - See LAFF figure 5.3 (http://www.ulaff.net).\n");

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html

% NOTE: You can review a visualization of this algorithm by copying the
% code to this applicaiton.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html
% ------------------------------------------------------------------------

  [ AL, AR ] = FLA_Part_1x2( A, ...
                               0, 'FLA_LEFT' );

  [ BT, ...
    BB ] = FLA_Part_2x1( B, ...
                         0, 'FLA_TOP' );

  while ( size( AL, 2 ) < size( A, 2 ) )

    [ A0, a1, A2 ]= FLA_Repart_1x2_to_1x3( AL, AR, ...
                                         1, 'FLA_RIGHT' );

    [ B0, ...
      b1t, ...
      B2 ] = FLA_Repart_2x1_to_3x1( BT, ...
                                    BB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%
    % Calculate according to LAFF Figure 5.3 (http://www.ulaff.net).
    % C = a1 * b1t + C
    % laff_ger( alpha, x, y, A )
    %    computes alpha * x * y' + A
    %    but it is a bit tricky: x and y can be row or column vectors, in any
    %    combination.
    
    C = laff_ger(1, a1, b1t, C);

    %------------------------------------------------------------%

    [ AL, AR ] = FLA_Cont_with_1x3_to_1x2( A0, a1, A2, ...
                                           'FLA_LEFT' );

    [ BT, ...
      BB ] = FLA_Cont_with_3x1_to_2x1( B0, ...
                                       b1t, ...
                                       B2, ...
                                       'FLA_TOP' );

  end

  C_out = C;

return