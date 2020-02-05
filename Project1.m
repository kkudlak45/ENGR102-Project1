% Kryzstof Kudlak
% Project 1 Data Analysis
% ENGR 102-H02
% 2/4/2020

file = 'data';

nike = xlsread(file, 'NIKE');
chip = xlsread(file, 'Chipotle');

plot(1:length(nike(:,1)), nike(:,1), '-');
hold on;
plot(1:length(chip(:,2)), chip(:,2), '-');










