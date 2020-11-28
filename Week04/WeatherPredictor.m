function [x] = WeatherPredictor(P, x, endDay)
% WEATHER - This method will compute the predicted probability of weather
% n days in advanced based on the transition matrix P and the current
% condition vector x.

% UT Austin Linear Algebra: Foundations to Frontiers (http://www.ulaff.net)
% LAFF Homework 4.1.1.3
% Date: 11/25/2020
% Created by: Logan Kells

% Calculate the weather probability for each day, i
for i=0:endDay-1
    x = P * x;
end

