function [y_out] = Mvmult_t_unb_var1(A, x, y)
fprintf("LAFF Homework 4.3.1.1\n");
fprintf("MVMULT_T_UNB_VAR1 - See LAFF figure 4.3 (http://www.ulaff.net).\n");

% MVMULT_T_UNB_VAR1 = [M]atrix-[V]ector [MULT]iply that is [T]rans-posed, 
% [UNB]locked [VAR]iant [1].

% This method calculates a matrix-vector multiplication y_out = Ax + y.
% The matrix is sliced by columns which are transposed prior to calculating
% the vector-vector dot product of A_slice * x.

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html

% NOTE: You can review a visualization of this algorithm by copying the
% code to this applicaiton.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html

% UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
% LAFF Homework 4.3.1.1, see figure 4.3 (left is variant 1)
% Date: 11/28/2020
% Created by: Logan Kells

  [ AL, AR ] = FLA_Part_1x2( A, ...
                               0, 'FLA_LEFT' );

  [ yT, ...
    yB ] = FLA_Part_2x1( y, ...
                         0, 'FLA_TOP' );

  while ( size( AL, 2 ) < size( A, 2 ) )

    [ A0, a1, A2 ]= FLA_Repart_1x2_to_1x3( AL, AR, ...
                                         1, 'FLA_RIGHT' );

    [ y0, ...
      psi1, ...
      y2 ] = FLA_Repart_2x1_to_3x1( yT, ...
                                    yB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%
    % Calculate according to LAFF Figure 4.3 (http://www.ulaff.net).
    % NOTE: Transpose the column vector a1 occurs in laff_dot.
    % Calculate psi1 = a1_transpose * x + psi1
    psi1 = laff_dot(a1, x) + psi1;
    %------------------------------------------------------------%

    [ AL, AR ] = FLA_Cont_with_1x3_to_1x2( A0, a1, A2, ...
                                           'FLA_LEFT' );

    [ yT, ...
      yB ] = FLA_Cont_with_3x1_to_2x1( y0, ...
                                       psi1, ...
                                       y2, ...
                                       'FLA_TOP' );

  end

  y_out = [ yT
            yB ];

return

end

