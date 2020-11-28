A = randi( [ -2, 2 ], 4, 4 )
x = randi( [ -2, 2 ], 4, 1 )
y = randi( [ -2, 2 ], 4, 1 )

y_out = Mvmult_n_unb_var2B( A, x, y );
y_out_default = A * x + y;


if (isequal(y_out, y_out_default))
    disp( 'Mvmult_unb_var2B appears to be correct.' )
    
else
    disp( 'Mvmult_unb_var2B has a problem.' )
end

fprintf("The following results were calculated:");
display(y_out);
display(y_out_default);
