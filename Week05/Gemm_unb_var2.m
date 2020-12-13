function [C_out] = Gemm_unb_var2(A, B, C)

% GEMM_UNB_VAR1 = [M]atrix [M]atrix [UNB]locked [VAR]iant [2].

% ------------------------------------------------------------------------
% UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
% LAFF Homework 5.3.3.3
% Date: 12/12/2020
% Created by: Logan Kells

fprintf("LAFF Homework 5.3.3.3\n");
fprintf("GEMM_UNB_VAR2 - See LAFF figure 5.2 (http://www.ulaff.net).\n");

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html

% NOTE: You can review a visualization of this algorithm by copying the
% code to this applicaiton.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html
% ------------------------------------------------------------------------
  [ AT, ...
    AB ] = FLA_Part_2x1( A, ...
                         0, 'FLA_TOP' );

  [ CT, ...
    CB ] = FLA_Part_2x1( C, ...
                         0, 'FLA_TOP' );

  while ( size( AT, 1 ) < size( A, 1 ) )

    [ A0, ...
      a1t, ...
      A2 ] = FLA_Repart_2x1_to_3x1( AT, ...
                                    AB, ...
                                    1, 'FLA_BOTTOM' );

    [ C0, ...
      c1t, ...
      C2 ] = FLA_Repart_2x1_to_3x1( CT, ...
                                    CB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%
    % Calculate according to LAFF Figure 5.2 (http://www.ulaff.net).
    % c1t = a1t * B + c1t
    c1t = laff_gemv('Transpose', 1, B, a1t, 1, c1t);
    %------------------------------------------------------------%

    [ AT, ...
      AB ] = FLA_Cont_with_3x1_to_2x1( A0, ...
                                       a1t, ...
                                       A2, ...
                                       'FLA_TOP' );

    [ CT, ...
      CB ] = FLA_Cont_with_3x1_to_2x1( C0, ...
                                       c1t, ...
                                       C2, ...
                                       'FLA_TOP' );

  end

  C_out = [ CT
            CB ];

return

