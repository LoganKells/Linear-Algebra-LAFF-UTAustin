function [B_out] = GJ_Inverse_alt_unb(A, B)
% GJ_INVERSE_ALT_UNB 
% [G]auss-[J]ordan Inverse Matrix Calculation [ALT]ernative [UNB]ound

% Performs solving A * X = B system of equations by inverting A using 
% Gauss-Jordan elimination matrix G.
% NOTE: The algorithm loop overrides input matrix B to save memory operations.
%       such that B becomes A_out.

% ------------------------------------------------------------------------
% UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
% LAFF Homework 8.2.5.4
% Date: 1/4/2021
% Created by: Logan Kells

% NOTE: The following code was created using the SPARK code generator.
% http://edx-org-utaustinx.s3.amazonaws.com/UT501x/Spark/index.html

% Calculate according to LAFF Figure 8.7 (http://www.ulaff.net).
% -----------------------------------------------------------------------

  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  [ BTL, BTR, ...
    BBL, BBR ] = FLA_Part_2x2( B, ...
                               0, 0, 'FLA_TL' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    [ B00,  b01,    B02,  ...
      b10t, beta11, b12t, ...
      B20,  b21,    B22 ] = FLA_Repart_2x2_to_3x3( BTL, BTR, ...
                                                   BBL, BBR, ...
                                                   1, 1, 'FLA_BR' );

    %------------------------------------------------------------%
    % Calculate according to LAFF Figure 8.7 (http://www.ulaff.net).
    
    % Determine Gauss-Jordan matrix, G. 
    % The values in G override those in the original matrix A to save
    % memory.
    % G = [
    %      I, -u01, 0
    %      0, delta11, 0
    %      0, -l21, I
    %    ];
    delta11 = 1 / alpha11; % delta11
    a01 = laff_scal(delta11, a01); % a01 = u01 in matrix G.
    a21 = laff_scal(delta11, a21); % a21 = l21 in matrix G.
        
    % Calculate Gauss-Jordan matrix, G, which is multiplied
    % each loop as A = G * A
    A02 = laff_ger(-1, a01, a12t, A02);
    A22 = laff_ger(-1, a21, a12t, A22);
    B00 = laff_ger(-1, a01, b10t, B00);
    B20 = laff_ger(-1, a21, b10t, B20);
    b01 = laff_scal(-1, a01);
    b21 = laff_scal(-1, a21);
    
    % Update the Gauss-Jordan matrix, G
    a01 = laff_zerov(a01);
    a21 = laff_zerov(a21);
    a12t = laff_scal(delta11, a12t);
    b10t = laff_scal(delta11, b10t);
    beta11 = delta11;
    alpha11 = 1;
    
    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

    [ BTL, BTR, ...
      BBL, BBR ] = FLA_Cont_with_3x3_to_2x2( B00,  b01,    B02,  ...
                                             b10t, beta11, b12t, ...
                                             B20,  b21,    B22, ...
                                             'FLA_TL' );

  end

  B_out = [ BTL, BTR
            BBL, BBR ];

return

