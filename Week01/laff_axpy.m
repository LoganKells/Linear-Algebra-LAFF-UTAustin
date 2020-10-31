function [y_return] = laff_axpy(alpha, x_in, y_in)
%LAFF_AXPY Implement the function laff_axpy that computes ax+y given scalar
% a and vectors x and y. 
%   Requirements:
%   A) x and y must each be either an n×1  array (column vector) or 
%       a  1xn  array (row vector);
%   B) y_out must be the same kind of vector as y; and
%   C) If x and/or y are not vectors or if the size of (row or column)
%       vector x does not match the size of (row or column) vector y, 
%       the output should be 'FAILED'.
%   D) If alpha is not a scalar, the output should be 'FAILED'.

% Get the dimensions of both vectors
dim_x = size(x_in);
dim_y = size(y_in);


% First, check that the scalar, alpha, is 1x1 size.
if(size(alpha) == 1)
    % Second, check that one of the dimensions of the input vector is 1.
    if(dim_x(1) == 1 || dim_x(2) == 1)
        % Third, if the lengths are not equivalent, then return 'FAILED'
        if length(x_in) == length(y_in)
            % Initialize an array, y_return, with the same size as x.
            y_return = zeros(dim_y(1), dim_y(2));

            % Calculate y_return = a*x + y if the dimensions of the input
            % vectors are equivalent.
            if(dim_x == dim_y)
                for curr_row = 1:dim_y(1)
                    for curr_col = 1:dim_y(2)
                        y_return(curr_row, curr_col) = alpha * x_in(curr_row, curr_col) + y_in(curr_row, curr_col);
                    end
                end
            % Otherwise, calculate y_return = a*x' + y, by transposing x.
            else
                for curr_row = 1:dim_y(1)
                    for curr_col = 1:dim_y(2)
                        % We can transpose x by indexing the rows & columns
                        % inversely.
                        y_return(curr_row, curr_col) = alpha * x_in(curr_col, curr_row) + y_in(curr_row, curr_col);
                    end
                end
            end
        else
            y_return = "FAILED";
        end
    else
        y_return = "FAILED";
    end
else
    y_return = "FAILED";
end
end

