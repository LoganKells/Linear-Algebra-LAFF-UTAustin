function [x] = WeatherPredictor(P, x, endDay)
%WEATHER Summary of this function goes here

% UT Austin Linear Algebra - Foundations to Frontiers
% LAFF Homework 4.1.1.3
% Date: 11/25/2020
% Created by: Logan Kells

% Calculate the weather probability for each day, i
for i=0:endDay-1
    x = P * x;
end

