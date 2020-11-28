function [x_out] = Trmv_un_unb_var1(U, x)
% TRMV_UN_UNB_VAR1
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

    % Calculate x_out = U*x
    
    % First transpose row vectors to column vectors to match x0 and x2.
    u12 = laff_copy(u12t, x2);
    
    % Note, transposing u10t is unnecessary because u10t is a zeros vector
    % if we assumed matrix U is an upper triangular matrix. Threfore we
    % comment this code out.
    % u10 = laff_copy(u10t, x0);
    
    % Utilize algorithm chi := u10*x0 + upsilon11
    chi1 = laff_dot(u12, x2) + laff_dot(upsilon11, chi1);

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

