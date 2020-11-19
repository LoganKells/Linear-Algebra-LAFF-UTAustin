function [A_out] = ZeroMatrix_unb(A)
%ZEROMATRIX_UNB 

% LAFF Homework 3.2.1.2
% Date: 11/18/2020
% Created by: Logan Kells

% With the FLAME@lab API, write a function 
% [ A_out ] = ZeroMatrix_unb( A ) that sets the entries of a given matrix 
% to zero, one column at a time, based on the algorithm

% NOTE: You will use the function laff_zerov( x ), which returns a zero vector 
% of the same size and shape (column or row) as input vector x.
% Check if that routine is in directory: ./laff/vecvec


% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html

  [ AL, AR ] = FLA_Part_1x2( A, ...
                               0, 'FLA_LEFT' );

  while ( size( AL, 2 ) < size( A, 2 ) )

    [ A0, a1, A2 ]= FLA_Repart_1x2_to_1x3( AL, AR, ...
                                         1, 'FLA_RIGHT' );

    %------------------------------------------------------------%

    a1 = laff_zerov(a1);
    

    %------------------------------------------------------------%

    [ AL, AR ] = FLA_Cont_with_1x3_to_1x2( A0, a1, A2, ...
                                           'FLA_LEFT' );

  end

  A_out = [ AL, AR ];

return

