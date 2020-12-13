fprintf("*********************************************************\n");
functionName = "WeatherPredictor";
fprintf("Testing Algorithm: " + functionName + "...\n");
fprintf("The weather is predicted to have the following probability of sunny, cloudy, and rainy:");
% P = the transition matrix for weather.
P = [
    0.4, 0.3, 0.1
    0.4, 0.3, 0.6
    0.2, 0.4, 0.3
    ];
% x - initial state of weather.
x_today = [0
    1
    0];
% Predict the Weather at a particular day from today.
x_prediction = WeatherPredictor(P, x_today, 4);
display(x_prediction);
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Mvmult_n_unb_var1B( A, x, y );
y_out_default = A * x + y;
functionName = "Mvmult_n_unb_var1B";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Mvmult_n_unb_var2B( A, x, y );
y_out_default = A * x + y;
functionName = "Mvmult_n_unb_var2B";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Mvmult_t_unb_var1( A, x, y );
y_out_default = A' * x + y;
functionName = "Mvmult_t_unb_var1";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Mvmult_t_unb_var2( A, x, y );
y_out_default = A' * x + y;
functionName = "Mvmult_t_unb_var2";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Trmvp_un_unb_var1( A, x, y );
y_out_default = triu( A ) * x + y;
functionName = "Trmvp_un_unb_var1";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Trmvp_un_unb_var2( A, x, y );
y_out_default = triu( A ) * x + y;
functionName = "Trmvp_un_unb_var2";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Trmvp_ln_unb_var1( A, x, y );
y_out_default = tril( A ) * x + y;
functionName = "Trmvp_ln_unb_var1";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Trmvp_ln_unb_var2( A, x, y );
y_out_default = tril( A ) * x + y;

functionName = "Trmvp_ln_unb_var2";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y_out = Trmv_un_unb_var1(A, x);
y_out_default = triu(A) * x;
functionName = "Trmv_un_unb_var1";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y_out = Trmv_un_unb_var2(A, x);
y_out_default = triu(A) * x;
functionName = "Trmv_un_unb_var2";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y_out = Trmv_ln_unb_var1(A, x);
y_out_default = tril(A) * x; % tril(A) = lower triangular matrix A
functionName = "Trmv_ln_unb_var1";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y_out = Trmv_ln_unb_var2(A, x);
y_out_default = tril(A) * x;
functionName = "Trmv_ln_unb_var2";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Trmvp_ut_unb_var1(A, x, y);
y_out_default = triu(A)' * x + y;
functionName = "Trmvp_ut_unb_var12";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Trmvp_ut_unb_var2(A, x, y);
y_out_default = triu(A)' * x + y;
functionName = "Trmvp_ut_unb_var2";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Trmvp_lt_unb_var1(A, x, y);
y_out_default = tril(A)' * x + y; % tril(A) = lower triangular matrix A
functionName = "Trmvp_lt_unb_var1";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
y_out = Trmvp_lt_unb_var2(A, x, y);
y_out_default = tril(A)' * x + y; % tril(A) = lower triangular matrix A
functionName = "Trmvp_lt_unb_var2";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y_out = Trmv_ut_unb_var1(A, x);
y_out_default = triu(A)' * x;
functionName = "Trmv_ut_unb_var1";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y_out = Trmv_lt_unb_var1(A, x);
y_out_default = tril(A)' * x;
functionName = "Trmv_lt_unb_var1";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y_out = Trmv_ut_unb_var2(A, x);
% Modify random matrix A to be upper triangular matrix that is then
% transposed.
A_mod = triu(A)';
y_out_default = A_mod * x;
functionName = "Trmv_ut_unb_var2";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y_out = Trmv_lt_unb_var2(A, x);
y_out_default = tril(A)' * x;
functionName = "Trmv_lt_unb_var2";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
% Modify random matrix A to be symmetric on the upper triangle matrix.
A = triu( A ) + triu( A, 1 )';
y_out = Symv_u_unb_var1(A, x, y);
y_out_default = A * x + y;
functionName = "Symv_u_unb_var1";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
% Modify random matrix A to be symmetric on the upper triangle matrix.
A = triu( A ) + triu( A, 1 )';
y_out = Symv_u_unb_var2(A, x, y);
y_out_default = A * x + y;
functionName = "Symv_u_unb_var2";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
% Convert A from random matrix to matrix symmetric on lower triangle
A_mod = tril( A ) + tril( A, -1 )';
y_out = Symv_l_unb_var1(A, x, y);
y_out_default = A_mod * x + y;
functionName = "Symv_l_unb_var1";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");


fprintf("*********************************************************\n");
A = randi( [ -2, 2 ], 4, 4 );
x = randi( [ -2, 2 ], 4, 1 );
y = randi( [ -2, 2 ], 4, 1 );
% Convert A from random matrix to matrix symmetric on lower triangle
A_mod = tril( A ) + tril( A, -1 )';
y_out = Symv_l_unb_var2(A, x, y);
y_out_default = A_mod * x + y;
functionName = "Symv_l_unb_var2";
TestSequence(functionName, y_out, y_out_default)
fprintf("*********************************************************\n\n");
