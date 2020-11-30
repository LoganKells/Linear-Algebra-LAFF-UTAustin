function [x_out] = Trmv_un_unb_var2(U, x)
fprintf("LAFF Homework 4.3.2.5\n");
fprintf("TRMV_UN_UNB_VAR1 - See LAFF figure 4.6 (http://www.ulaff.net).\n");

% TRMV_UN_UNB_VAR1 = [TR]iangular [M]atrix-[V]ector multiply, 
% with [U]pper triangular matrix that is [N]ot trans-posed, [UNB]locked 
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
% LAFF Homework 4.3.2.5
% Date: 11/28/2020
% Created by: Logan Kells

  [ UTL, UTR, ...
    UBL, UBR ] = FLA_Part_2x2( U, ...
                               0, 0, 'FLA_TL' );
  [ xT, ...
    xB ] = FLA_Part_2x1( x, ...
                         0, 'FLA_TOP' );

while ( size( UTL, 1 ) < size( U, 1 ) )
    [ U00,  u01,       U02,  ...
      u10t, upsilon11, u12t, ...
      U20,  u21,       U22 ] = FLA_Repart_2x2_to_3x3( UTL, UTR, ...
                                                      UBL, UBR, ...
                                                      1, 1, 'FLA_BR' );
    [ x0, ...
      chi1, ...
      x2 ] = FLA_Repart_2x1_to_3x1( xT, ...
                                    xB, ...
                                    1, 'FLA_BOTTOM' );

    %------------------------------------------------------------%
    % Calculate according to LAFF Figure 4.6 (http://www.ulaff.net).
    % Calculate x_out = U*x
    x0 = laff_scal(chi1, u01) + x0;
    chi1 = laff_scal(chi1, upsilon11);
    % The x2 calculation is not required because matrix U is assumed to 
    % be an upper triangular matrix
    %x2 = laff_scal(chi1, u21) + x2;

    %------------------------------------------------------------%

    [ UTL, UTR, ...
      UBL, UBR ] = FLA_Cont_with_3x3_to_2x2( U00,  u01,       U02,  ...
                                             u10t, upsilon11, u12t, ...
                                             U20,  u21,       U22, ...
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



