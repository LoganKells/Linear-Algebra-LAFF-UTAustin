function [ dotprod ] = laff_dot(x_in, y_in)
%LAFF_DOT 
% Implement: The function laff_dot that computes the dot product of
% vectors x and y.
%   
% Requirements:
%   A) x and y must be each an nx1 vector or 1xn vector.
%   B) If x and/or y are not vectors or if the size of (row or column) 
%       vector x does not match the size of (row or column) vector y, 
%       the output should be 'FAILED'.

dotprod = 0;
% First, check that the sizes are equivalent.
if(size(x_in) == size(y_in))
    dim_x = size(x_in);
    
    % Calculate the dot product
    for curr_row = 1:dim_x(1)
        for curr_col = 1:dim_x(2)
            %dotprod = 1;
            dotprod = dotprod + (x_in(curr_row, curr_col) * y_in(curr_row, curr_col));
        end
    end
else
    dotprod = "FAILED";
end

end

