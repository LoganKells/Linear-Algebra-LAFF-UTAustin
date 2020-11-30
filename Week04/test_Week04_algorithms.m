fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Mvmult_n_unb_var1B...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Mvmult_n_unb_var1B( A, x, y );
y_out_default = A * x + y;

if (isequal(y_out, y_out_default))
    disp( 'Mvmult_n_unb_var1B appears to be correct.' )
    
else
    fprintf("ERROR! Mvmult_n_unb_var1B has a problem.\n");
    fprintf("The following results were calculated:");
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Mvmult_n_unb_var2B...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Mvmult_n_unb_var2B( A, x, y );
y_out_default = A * x + y;

if (isequal(y_out, y_out_default))
    disp( 'Mvmult_n_unb_var2B appears to be correct.' )
    
else
    fprintf("ERROR! Mvmult_n_unb_var2B has a problem.\n");
    fprintf("The following results were calculated:");
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Mvmult_t_unb_var1...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Mvmult_t_unb_var1( A, x, y );
y_out_default = A' * x + y;

if (isequal(y_out, y_out_default))
    disp( 'Mvmult_t_unb_var1 appears to be correct.' )
    
else
    fprintf("ERROR! Mvmult_t_unb_var1 has a problem.\n");
    fprintf("The following results were calculated:");
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Mvmult_t_unb_var2...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Mvmult_t_unb_var2( A, x, y );
y_out_default = A' * x + y;

if (isequal(y_out, y_out_default))
    disp( 'Mvmult_t_unb_var2 appears to be correct.' )
    
else
    fprintf("ERROR! Mvmult_t_unb_var2 has a problem.\n");
    fprintf("The following results were calculated:");
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Trmvp_un_unb_var1...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Trmvp_un_unb_var1( A, x, y );
y_out_default = triu( A ) * x + y;

if (isequal(y_out, y_out_default))
    disp( 'Trmvp_un_unb_var1 appears to be correct.' )
    
else
    fprintf("ERROR! Trmvp_un_unb_var1 has a problem.\n");
    fprintf("The following results were calculated:");
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Trmvp_un_unb_var2...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Trmvp_un_unb_var2( A, x, y );
y_out_default = triu( A ) * x + y;

if (isequal(y_out, y_out_default))
    disp( 'Trmvp_un_unb_var2 appears to be correct.' )
    
else
    fprintf("ERROR! Trmvp_un_unb_var2 has a problem.\n");
    fprintf("The following results were calculated:");
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Trmvp_ln_unb_var1...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Trmvp_ln_unb_var1( A, x, y );
y_out_default = tril( A ) * x + y;

if (isequal(y_out, y_out_default))
    disp( 'Trmvp_ln_unb_var1 appears to be correct.' )
    
else
    fprintf("ERROR! Trmvp_ln_unb_var1 has a problem.\n");
    fprintf("The following results were calculated:");
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Trmvp_ln_unb_var2...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Trmvp_ln_unb_var2( A, x, y );
y_out_default = tril( A ) * x + y;

if (isequal(y_out, y_out_default))
    disp( 'Trmvp_ln_unb_var2 appears to be correct.' )
    
else
    fprintf("ERROR! Trmvp_ln_unb_var2 has a problem.\n");
    fprintf("The following results were calculated:");
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Trmv_un_unb_var1...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );

y_out = Trmv_un_unb_var1(A, x);
y_out_default = triu(A) * x;

if (isequal(y_out, y_out_default))
    disp( 'Trmv_un_unb_var1 appears to be correct.' )
    
else
    fprintf("ERROR! Trmv_un_unb_var1 has a problem.\n");
    fprintf("The following results were calculated:");
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Trmv_un_unb_var2...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );

y_out = Trmv_un_unb_var2(A, x);
y_out_default = triu(A) * x;

if (isequal(y_out, y_out_default))
    disp( 'Trmv_un_unb_var2 appears to be correct.' )
    
else
    fprintf("ERROR! Trmv_un_unb_var2 has a problem.\n");
    fprintf("The following results were calculated:");
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Trmv_ln_unb_var1...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );

y_out = Trmv_ln_unb_var1(A, x);
y_out_default = tril(A) * x; % tril(A) = lower triangular matrix A

if (isequal(y_out, y_out_default))
    disp( 'Trmv_ln_unb_var1 appears to be correct.' )
    
else
    fprintf("ERROR! Trmv_ln_unb_var1 has a problem.\n");
    fprintf("The following results were calculated:");
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Trmv_ln_unb_var2...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );

y_out = Trmv_ln_unb_var2(A, x);
y_out_default = tril(A) * x; % tril(A) = lower triangular matrix A

if (isequal(y_out, y_out_default))
    disp( 'Trmv_ln_unb_var2 appears to be correct.' )
    
else
    fprintf("ERROR! Trmv_ln_unb_var2 has a problem.\n");
    fprintf("The following results were calculated:\n");
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Trmvp_ut_unb_var1...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );

y_out = Trmvp_ut_unb_var1(A, x, y);
y_out_default = triu(A)' * x + y; % tril(A) = lower triangular matrix A

if (isequal(y_out, y_out_default))
    disp( 'Trmvp_ut_unb_var1 appears to be correct.' )
    
else
    fprintf("ERROR! Trmvp_ut_unb_var1 has a problem.\n");
    fprintf("The following results were calculated:\n");
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Trmvp_ut_unb_var2...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );

y_out = Trmvp_ut_unb_var2(A, x, y);
y_out_default = triu(A)' * x + y; % tril(A) = lower triangular matrix A

if (isequal(y_out, y_out_default))
    disp( 'Trmvp_ut_unb_var2 appears to be correct.' )
    
else
    fprintf("ERROR! Trmvp_ut_unb_var2 has a problem.\n");
    fprintf("The following results were calculated:\n");
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Trmvp_lt_unb_var1...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );

y_out = Trmvp_lt_unb_var1(A, x, y);
y_out_default = tril(A)' * x + y; % tril(A) = lower triangular matrix A

if (isequal(y_out, y_out_default))
    disp( 'Trmvp_lt_unb_var1 appears to be correct.' )
    
else
    fprintf("ERROR! Trmvp_lt_unb_var1 has a problem.\n");
    fprintf("The following results were calculated:\n");
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Trmvp_lt_unb_var2...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );

y_out = Trmvp_lt_unb_var2(A, x, y);
y_out_default = tril(A)' * x + y; % tril(A) = lower triangular matrix A

if (isequal(y_out, y_out_default))
    disp( 'Trmvp_lt_unb_var2 appears to be correct.' )
    
else
    fprintf("ERROR! Trmvp_lt_unb_var2 has a problem.\n");
    fprintf("The following results were calculated:\n");
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Trmv_ut_unb_var1...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );

y_out = Trmv_ut_unb_var1(A, x);
y_out_default = triu(A)' * x;

if (isequal(y_out, y_out_default))
    disp( 'Trmv_ut_unb_var1 appears to be correct.' )
    
else
    fprintf("ERROR! Trmv_ut_unb_var1 has a problem.\n");
    fprintf("The following results were calculated:\n");
    display(triu(A));
    display(x);
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Trmv_lt_unb_var1...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );

y_out = Trmv_lt_unb_var1(A, x);
y_out_default = tril(A)' * x;

if (isequal(y_out, y_out_default))
    disp( 'Trmv_lt_unb_var1 appears to be correct.' )
    
else
    fprintf("ERROR! Trmv_lt_unb_var1 has a problem.\n");
    fprintf("The following results were calculated:\n");
    display(triu(A));
    display(x);
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Trmv_ut_unb_var2...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );

y_out = Trmv_ut_unb_var2(A, x);
y_out_default = triu(A)' * x;

if (isequal(y_out, y_out_default))
    disp( 'Trmv_ut_unb_var2 appears to be correct.' )
    
else
    fprintf("ERROR! Trmv_ut_unb_var2 has a problem.\n");
    fprintf("The following results were calculated:\n");
    display(triu(A));
    display(x);
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
fprintf("Testing Algorithm: Trmv_lt_unb_var2...\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );

y_out = Trmv_lt_unb_var2(A, x);
y_out_default = tril(A)' * x;

if (isequal(y_out, y_out_default))
    disp( 'Trmv_lt_unb_var2 appears to be correct.' )
    
else
    fprintf("ERROR! Trmv_lt_unb_var2 has a problem.\n");
    fprintf("The following results were calculated:\n");
    display(triu(A));
    display(x);
    display(y_out);
    display(y_out_default);
end
fprintf("*********************************************************\n\n");


