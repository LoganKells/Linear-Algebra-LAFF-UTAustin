function [A_out] = Set_To_Identity(A)
%SET_TO_IDENTITY 

% LAFF Homework 3.2.2.2
% Date: 11/18/2020
% Created by: Logan Kells

% With the FLAME@lab API, write a function that sets the entries of a given square 
% matrix to an identity matrix, one column at a time, based on the algorithm

% NOTE: You will use the functions laff_zerov( x ) and laff_onev( x ), 
% which respectively return a zero vector and a vector of all ones of 
% the same size and shape (column or row) as input vector x.
% Check if that routine is in directory: ./laff/vecvec


% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html


  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    %------------------------------------------------------------%
    % Set A01 components to vector of zeros.
    a01 = laff_zerov(a01);
    % Set A11 to vector of ones.
    alpha11 = laff_onev(alpha11);
    % Set A21 to vectors of zeros.
    a21 = laff_zerov(a21);
    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

  end

  A_out = [ ATL, ATR
            ABL, ABR ];

return

