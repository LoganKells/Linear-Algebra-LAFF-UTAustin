fprintf('-------------------------------\n');
fprintf("LAFF Homework 5.2.3.2\n");
fprintf("http://www.ulaff.net)\n")
% UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
% LAFF Homework 5.2.3.2
% Date: 12/9/2020
% Created by: Logan Kells

A = [
    2, 0, 1
    -1, 1, 0
    1, 3, 1
    -1, 1, 1
    ];

B = [
    2, 1, 2, 1
    0, 1, 0, 1
    1, 0, 1, 0
    ];

C1 = A' * A;
display(C1);

C2 = A * A';
display(C2);

C3 = (A * B)';
display(C3);

C4 = A' * B';
display(C4)

C5 = B' * A';
display(C5);

fprintf('-------------------------------\n');
fprintf("LAFF Homework 5.2.4.3\n");
fprintf("http://www.ulaff.net)\n")
% UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
% LAFF Homework 5.2.4.3
% Date: 12/9/2020
% Created by: Logan Kells

I = [
    1, 0, 0, 0
    0, 1, 0, 0
    0, 0, 1, 0
    0, 0, 0, 1
    ];

i0 = [
    1
    0
    0
    0
    ];

C6 = i0' * A;
display(C6);

fprintf('-------------------------------\n');