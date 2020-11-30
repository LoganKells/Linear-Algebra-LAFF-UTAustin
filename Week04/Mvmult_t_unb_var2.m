function [y_out] = Mvmult_t_unb_var2(A, x, y)
fprintf("LAFF Homework 4.3.1.1\n");
fprintf("MVMULT_T_UNB_VAR2 - See LAFF figure 4.3 (http://www.ulaff.net).\n");

% MVMULT_T_UNB_VAR2 = [M]atrix-[V]ector [MULT]iply that is [T]rans-posed, 
% [UNB]locked [VAR]iant [2].

% This method calculates a matrix-vector multiplication y_out = Ax + y.
% The matrix is sliced by rows which are transposed prior to calculating
% the vector-vector dot product of A_slice * x.

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html

% NOTE: You can review a visualization of this algorithm by copying the
% code to this applicaiton.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/PictureFLAME/PictureFLAME.html

% UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
% LAFF Homework 4.3.1.1
% Date: 11/28/2020
% Created by: Logan Kells


  [ AT, ...
    AB ] = FLA_Part_2x1( A, ...
                         0, 'FLA_TOP' );

  [ xT, ...
    xB ] = FLA_Part_2x1( x, ...
                         0, 'FLA_TOP' );

  while ( size( AT, 1 ) < size( A, 1 ) )

    [ A0, ...
      a1t, ...
      A2 ] = FLA_Repart_2x1_to_3x1( AT, ...
                                    AB, ...
                                    1, 'FLA_BOTTOM' );

    [ x0, ...
      chi1, ...
      x2 ] = FLA_Repart_2x1_to_3x1( xT, ...
                                    xB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%
    % Calculate according to LAFF Figure 4.3 (http://www.ulaff.net).
    % Transpose a1t from a row to a column vector.
    a1 = laff_copy(a1t, y);
    % Calculate y = chi1*a1 + y
    y = laff_scal(chi1, a1) + y;
    %------------------------------------------------------------%

    [ AT, ...
      AB ] = FLA_Cont_with_3x1_to_2x1( A0, ...
                                       a1t, ...
                                       A2, ...
                                       'FLA_TOP' );

    [ xT, ...
      xB ] = FLA_Cont_with_3x1_to_2x1( x0, ...
                                       chi1, ...
                                       x2, ...
                                       'FLA_TOP' );

  end

  y_out = y;


return

end

