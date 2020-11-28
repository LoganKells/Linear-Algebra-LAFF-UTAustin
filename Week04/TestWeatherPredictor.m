% UT Austin Linear Algebra - Foundations to Frontiers
% LAFF Tests of algorithms from Week 4.
% Date: 11/25/2020
% Created by: Logan Kells

disp("***************************");
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

disp("***************************");
