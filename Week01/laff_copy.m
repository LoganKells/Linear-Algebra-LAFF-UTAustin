% Created by: Logan Kells
% Date: 10/29/2020

function [y_return] = laff_copy(x, y)
% Implement the function laff_copy that copies a vector into another vector. 

% The function is defined as: function [ y_out ] = laff_copy( x, y )

% a) x and y must each be either an  n x 1  array (column vector) 
% or a  1 × n  array (row vector);

% b) y_out must be the same kind of vector as y (in other words,
% if y is a column vector, so is y_out and if y is a row vector, so is y_out).

% c) The function should “transpose" the vector if x and y do not have 
% the same “shape" (if one is a column vector and the other one is a row vector).

% d) If x and/or y are not vectors or if the size of (row or column) vector x 
% does not match the size of (row or column) vector y, 
% the output should be 'FAILED'.

% if the lengths are not equivalent, then return 'FAILED'
if length(x) ~= length(y)
    y_return = 'FAILED';
else
    % Initialize an array, y_return, with the same size as x.
    y_return = zeros(1, length(x));
    
    % Run a loop through x elements, setting y elements equal to those
    for i = 1:length(x)
        y_return(i) = x(i);
    end
    
    % Transpose the return vector, if required, to have the same size
    % dimensions of the input vector, y.
    rows_y = size(y,1);
    cols_y = size(y,2);
    dim_y = size(y);
    dim_y_return = size(y_return);
    
    % If the dimensions are not equivalent, then 'transpose' the results.
    if(dim_y ~= dim_y_return)
        % initialize transposed vector
        y_return_T = zeros(rows_y, cols_y);
        % Transpose
        for row = 1:rows_y
            for col = 1:cols_y
                y_return_T(row,col) = y_return(col,row);
            end
        end
        y_return = y_return_T;
    end
end
end

