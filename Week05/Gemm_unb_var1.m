function [C_out] = Gemm_unb_var1(A, B, C)

% GEMM_UNB_VAR1 = [G]eneric [M]atrix [M]ultiplication [UNB]locked [VAR]iant [1].

% ------------------------------------------------------------------------
% UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
% LAFF Homework 5.3.2.4
% Date: 12/12/2020
% Created by: Logan Kells

fprintf("LAFF Homework 5.3.2.4\n");
fprintf("GEMM_UNB_VAR1 - See LAFF figure 5.1 (http://www.ulaff.net).\n");

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html

% NOTE: You can review a visualization of this algorithm by copying the
% code to this applicaiton.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html
% ------------------------------------------------------------------------

  [ BL, BR ] = FLA_Part_1x2( B, ...
                               0, 'FLA_LEFT' );

  [ CL, CR ] = FLA_Part_1x2( C, ...
                               0, 'FLA_LEFT' );

  while ( size( BL, 2 ) < size( B, 2 ) )

    [ B0, b1, B2 ]= FLA_Repart_1x2_to_1x3( BL, BR, ...
                                         1, 'FLA_RIGHT' );

    [ C0, c1, C2 ]= FLA_Repart_1x2_to_1x3( CL, CR, ...
                                         1, 'FLA_RIGHT' );

    %------------------------------------------------------------%

    % Calculate according to LAFF Figure 5.1 (http://www.ulaff.net).
    c1 = laff_gemv('No transpose', 1, A, b1, 1, c1);
    
    %------------------------------------------------------------%

    [ BL, BR ] = FLA_Cont_with_1x3_to_1x2( B0, b1, B2, ...
                                           'FLA_LEFT' );

    [ CL, CR ] = FLA_Cont_with_1x3_to_1x2( C0, c1, C2, ...
                                           'FLA_LEFT' );

  end

  C_out = [ CL, CR ];

return
