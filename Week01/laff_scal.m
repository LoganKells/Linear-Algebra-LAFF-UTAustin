function [x_return] = laff_scal(alpha,x_in)
%LAFF_SCALE Implement the function laff scal that scales a vector x 
% by a scalar α.
%
% Requirements:
% A) x must be either an n×1array (columnvector) or a 1×n array(row vector)
% B) x out must be the same kind of vector as x; and
% C) If x or alpha are not a (row or column) vector and scalar, 
%       respectively, the output should be ’FAILED’

% Get the size of the input vector
dimensions_x = size(x_in);
rows_x = dimensions_x(1);
cols_x = dimensions_x(2);

% First check that the scalar, alpha, is 1x1 size.
dimensions_alpha = size(alpha);
if(dimensions_alpha == 1)
    % Second, check that one of the dimensions of the input vector is 1.
    if(rows_x == 1 || cols_x == 1)
        % Create an output vector of the same size as the input vector.
        x_return = zeros(rows_x, cols_x);

        % Scale each element of x, and store in the return vector.
        for curr_row = 1:rows_x
            for curr_col = 1:cols_x
                x_return(curr_row, curr_col) = alpha * (x_in(curr_row, curr_col));
            end
        end
    else
        x_return = "FAILED";
    end
else
    x_return = "FAILED";
end

end

