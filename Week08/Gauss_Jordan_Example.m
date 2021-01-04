fprintf("*********************************************************\n");
fprintf("LAFF Homework 8.2.2.2\n");

A = [
    -2 2 -5 -7
    2 -3 7 11
    -4 3 -7 -9
    ];

G0 = [
    1 0 0
    1 1 0
    -2 0 1
    ];

A0 = G0 * A;

G1 = [
    1 2 0
    0 1 0
    0 -1 1
    ];

A1 = G1 * A0;


G2 = [
    1 0 1
    0 1 -2
    0 0 1
    ];
A2 = G2 * A1;

D = [
    -0.5 0 0
    0 -1 0
    0 0 1
    ];
A3 = D * A2;

fprintf("Calculating A after each Gauss-Jordan Elimination, G. (e.g. A0 = G0 * A)");display(A0);
display(A1);
display(A2);
display(A3);


fprintf("Test Gauss-Jordan steps all at once:\n");
A3_test = D * G2 * G1 * G0 * A;
display(A3_test);
fprintf("*********************************************************\n");

fprintf("*********************************************************\n");
fprintf("LAFF Homework 8.2.3.2\n");
A = [
    -2 2 -5 -7 8
    2 -3 7 11 -13
    -4 3 -7 -9 9
    ];

G0 = [
    1 0 0
    1 1 0
    -2 0 1
    ];

A0 = G0 * A;


G1 = [
    1 2 0
    0 1 0
    0 -1 1
    ];

A1 = G1 * A0;


G2 = [
    1 0 1
    0 1 -2
    0 0 1
    ];
A2 = G2 * A1;

D3 = [
    -0.5 0 0
    0 -1 0
    0 0 1
    ];
A3 = D3 * A2;

fprintf("Calculating A after each Gauss-Jordan Elimination, G. (e.g. A0 = G0 * A)");
display(A0);
display(A1);
display(A2);
display(A3);

fprintf("Test Gauss-Jordan steps all at once:\n");
A3_test = D3 * G2 * G1 * G0 * A;
display(A3_test);

fprintf("*********************************************************\n");

fprintf("*********************************************************\n");
fprintf("LAFF Homework 8.2.4.2\n");

A = [
    -2 2 -5
    2 -3 7
    -4 3 -7
    ];

A_appended = [A, eye(size(A))];

G0 = [
    1 0 0
    1 1 0
    -2 0 1
    ];

A0 = G0 * A_appended;

G1 = [
    1 2 0
    0 1 0
    0 -1 1
    ];

A1 = G1 * A0;

G2 = [
    1 0 1
    0 1 -2
    0 0 1
    ];

A2 = G2 * A1;

D3 = [
    -0.5 0 0
   0 -1 0
   0 0 1
    ];

% Calculate final matrix after Gauss-Jordan elimination.
A3 = D3 * A2;
A3_test = D3 * G2 * G1 * G0 * A_appended;
A_inverse = A3(:, 4:6);


fprintf("Initialize matrix A, which we will inverse w/ Gauss-Jordan method.\n");
display(A);

fprintf("Create an appended matrix by appending the identity matrix.\n");
display(A_appended);

fprintf("Calculating A after each Gauss-Jordan Elimination, G. (e.g. A0 = G0 * A_appended))");
display(A0);
display(A1);
display(A2);
display(A3);

fprintf("Test Gauss-Jordan steps all at once:\n");
display(A3_test);

fprintf("A inverse from Gauss-Jordan elimination w/ appended identity matrix.\n");
display(A_inverse);

fprintf("Check A * A_inverse = I.\n");
display(A * A_inverse);

fprintf("*********************************************************\n");