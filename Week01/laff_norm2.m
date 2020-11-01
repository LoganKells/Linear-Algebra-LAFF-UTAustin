function [norm2] = laff_norm2(x_in)
%LAFF_NORM2 
% Homework 1.5.6.1
% Implement the function laff norm2 that computes the length of vector x.
% 
% Requirements:
% A) x is an n×1 array (column vector) or a 1×n array (row vector)
% B) If x is not a vector the output should be ’FAILED’

% First test that x is a vector which is required.
norm2 = 0;
dim_x = size(x_in);
if(dim_x(1) == 1 || dim_x(2) == 1)
    % Calculate the norm2 length. For each element in x, 
    % the length is sqrt(sum(element^2))
    for i=1:length(x_in)
        norm2 = norm2 + x_in(i)^2;
    end
    % take the square root
    norm2 = sqrt(norm2);
else
    norm2 = "FAILED";
end

end

