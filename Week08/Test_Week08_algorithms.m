fprintf("Starting program...\n");

fprintf("*********************************************************\n");
prompt = "Please enter the number of the option to run\n1: Homework 8.2.5.4\nEnter your selection: ";
userSelection = input(prompt)
fprintf("*********************************************************\n");

if (userSelection == 1)
    fprintf("Homework 8.2.5.4\n");
    fprintf("[B_out] = GJ_Inverse_alt_unb(A, B)\n");
    % We are going to take a bit of a risk, and start with a random matrix A
    % with integer values...  There is no guarantee that it is invertible
    % without pivoting, or invertible at all... 

    A = randi( [-9,9], 4, 4 );

    B = zeros( size( A ) );

    Ainv = GJ_Inverse_alt_unb( A, B );

    disp( 'The below should equal approximately the identity:' )

    Ainv * A

    disp( 'Note: if the above shows "NaN", this means that the Gauss-Jordan' )
    disp( 'algorithm encountered a divide by zero' )
    disp( 'Just execute this script again, and see if you get luckier...' )
end

fprintf("Ending program...");